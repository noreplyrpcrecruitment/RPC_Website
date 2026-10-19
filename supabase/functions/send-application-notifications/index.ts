
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const gmailWebAppUrl = Deno.env.get("GMAIL_WEB_APP_URL");
const notificationToken = Deno.env.get("RPC_NOTIFICATION_TOKEN");
const adminEmail = Deno.env.get("ADMIN_NOTIFICATION_EMAIL");

const supabase = createClient(supabaseUrl, serviceRoleKey);

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: {
      ...corsHeaders,
      "Content-Type": "application/json",
    },
  });
}

function escapeHtml(value: unknown): string {
  return String(value ?? "").replace(/[&<>"']/g, (character) => {
    const entities: Record<string, string> = {
      "&": "&amp;",
      "<": "&lt;",
      ">": "&gt;",
      '"': "&quot;",
      "'": "&#39;",
    };

    return entities[character];
  });
}

async function sendNotification(
  applicationId: number,
  type: "applicant" | "admin",
  payload: Record<string, unknown>,
) {
  const { data: existing, error: lookupError } = await supabase
    .from("application_notification_logs")
    .select("status")
    .eq("application_id", applicationId)
    .eq("notification_type", type)
    .maybeSingle();

  if (lookupError) throw lookupError;

  if (existing?.status === "sent") {
    return { type, status: "already_sent" };
  }

  const { error: logError } = await supabase
    .from("application_notification_logs")
    .upsert(
      {
        application_id: applicationId,
        notification_type: type,
        status: "processing",
        error_message: null,
        updated_at: new Date().toISOString(),
      },
      { onConflict: "application_id,notification_type" },
    );

  if (logError) throw logError;

  try {
    const response = await fetch(gmailWebAppUrl!, {
      method: "POST",
      headers: {
        "Content-Type": "text/plain;charset=utf-8",
      },
      body: JSON.stringify({
        ...payload,
        token: notificationToken,
      }),
      redirect: "follow",
    });

    if (!response.ok) {
      throw new Error(`Google Apps Script returned HTTP ${response.status}`);
    }

    const result = await response.json();

    if (result.success !== true) {
      throw new Error("Google Apps Script did not confirm email delivery.");
    }

    const { error: updateError } = await supabase
      .from("application_notification_logs")
      .update({
        status: "sent",
        error_message: null,
        updated_at: new Date().toISOString(),
      })
      .eq("application_id", applicationId)
      .eq("notification_type", type);

    if (updateError) throw updateError;

    return { type, status: "sent" };
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Unknown notification error";

    await supabase
      .from("application_notification_logs")
      .update({
        status: "failed",
        error_message: message.slice(0, 1000),
        updated_at: new Date().toISOString(),
      })
      .eq("application_id", applicationId)
      .eq("notification_type", type);

    throw error;
  }
}

Deno.serve(async (request) => {
  if (request.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  if (request.method !== "POST") {
    return jsonResponse(
      { success: false, message: "Method not allowed" },
      405,
    );
  }

  if (!gmailWebAppUrl || !notificationToken || !adminEmail) {
    return jsonResponse(
      {
        success: false,
        message: "Gmail notification secrets are not configured.",
      },
      500,
    );
  }

  try {
    const body = await request.json();
    const applicationId = Number(body.applicationId);

    if (!Number.isSafeInteger(applicationId) || applicationId <= 0) {
      return jsonResponse(
        { success: false, message: "A valid applicationId is required." },
        400,
      );
    }

    const { data: application, error: applicationError } = await supabase
      .from("applications")
      .select("id, applicant_id, job_id")
      .eq("id", applicationId)
      .maybeSingle();

    if (applicationError) throw applicationError;

    if (!application) {
      return jsonResponse(
        { success: false, message: "Application not found." },
        404,
      );
    }

    const { data: applicant, error: applicantError } = await supabase
      .from("applicants")
      .select("id, full_name, email")
      .eq("id", application.applicant_id)
      .maybeSingle();

    if (applicantError) throw applicantError;

    if (!applicant?.email) {
      return jsonResponse(
        { success: false, message: "Applicant email not found." },
        400,
      );
    }

    const { data: job, error: jobError } = await supabase
      .from("jobs")
      .select("id, title")
      .eq("id", application.job_id)
      .maybeSingle();

    if (jobError) throw jobError;

    const applicantName = String(applicant.full_name || "Applicant");
    const jobTitle = String(job?.title || "the selected position");

    const applicantPayload = {
      applicantEmail: applicant.email,
      applicantName,
      jobTitle,
      recruiterEmail: adminEmail,
      applicationId,
      notificationType: "applicant",
    };

    const adminPayload = {
      applicantEmail: applicant.email,
      applicantName,
      jobTitle,
      recruiterEmail: adminEmail,
      applicationId,
      notificationType: "admin",
    };

    // Send each notification separately.
    // Google Apps Script sends one email based on notificationType.
    // Each notification is logged independently to avoid resending
    // notifications that have already been marked as sent.
    const results = await Promise.allSettled([
      sendNotification(applicationId, "applicant", applicantPayload),
      sendNotification(applicationId, "admin", adminPayload),
    ]);

    const notifications = results.map((result, index) => {
      const type = index === 0 ? "applicant" : "admin";

      if (result.status === "fulfilled") {
        return result.value;
      }

      console.error(`Failed ${type} notification:`, result.reason);

      return {
        type,
        status: "failed",
        message:
          result.reason instanceof Error
            ? result.reason.message
            : "Unknown error",
      };
    });

    const success = notifications.every(
      (notification) =>
        notification.status === "sent" ||
        notification.status === "already_sent",
    );

    return jsonResponse(
      {
        success,
        applicationId,
        notifications,
      },
      success ? 200 : 502,
    );
  } catch (error) {
    console.error("Notification function error:", error);

    return jsonResponse(
      {
        success: false,
        message: "Failed to process application notifications.",
      },
      500,
    );
  }
});
