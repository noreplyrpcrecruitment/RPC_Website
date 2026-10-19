SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict PGjB1xqVH6jKpXuIoigNpOEWFT3HKtLMQlu9vhomAxZ8iSifLOWZc2Vzg287HEy

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_recovery_code_sets; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_recovery_codes; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: scim_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: scim_users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: applicants; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."applicants" ("id", "full_name", "email", "phone", "address", "education", "created_at") VALUES
	(24, 'CooolDamn Bruh', 'superparisman@gmail.com', '01117813133', 'Parkhill Residence', 'qqqqqqqqqqqqqqqqqqqqqqq', '2026-10-14 08:00:39.306559+00'),
	(25, 'CooolDamn Bruh', 'superparisman@gmail.com', '01117813133', 'Parkhill Residence', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-14 08:01:30.019059+00'),
	(26, 'CooolDamn Bruh', 'superparisman@gmail.com', '01117813133', 'Parkhill Residence', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-15 01:42:19.032988+00');


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."jobs" ("id", "title", "department", "location", "job_type", "description", "responsibilities", "requirements", "posted_date", "is_active", "created_at") VALUES
	(6, 'Project Engineering', 'IT Department', NULL, 'Full Time', 'aaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-08', true, '2026-10-08 03:59:25.415831+00'),
	(7, 'Project', 'IHR Department', NULL, 'Internship', 'aaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-08', true, '2026-10-08 04:01:47.186251+00'),
	(9, 'aaaaaaaaaaaaaaaa', 'Production Department', NULL, 'Full Time', 'aaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-09', false, '2026-10-09 02:15:48.369547+00'),
	(8, 'Project', 'Production Department', NULL, 'Contract', 'aaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-08', false, '2026-10-08 06:08:50.647716+00'),
	(1, 'Rhoiz ku tenai', 'Production Department', 'Indonesia', 'Contract', 'Kami membuka kesempatan untuk bergabung dengan tim Purchasing dan mendukung proses pengadaan perusahaan.', 'Melakukan proses pengadaan barang dan jasa.
Menganalisis dan membandingkan kebutuhan serta penawaran.
Bekerja sama dengan tim lintas departemen.
Melakukan dokumentasi dan pelaporan pengadaan.
Mendukung evaluasi dan pemeliharaan hubungan dengan vendor.', 'Minimal Diploma atau Sarjana dari bidang yang relevan.
Memahami dasar proses purchasing dan administrasi.
Memiliki kemampuan komunikasi yang baik.
Mampu bekerja secara individu maupun tim.', '2026-10-08', false, '2026-10-08 02:41:50.153925+00'),
	(2, 'Engineering', 'Engineering Department', 'Indonesia', 'Contract', 'Kami sedang mencari seorang Engineering untuk bergabung dengan tim kami. Anda akan terlibat dalam perancangan, pengembangan, dan implementasi solusi teknis untuk mendukung operasional perusahaan.', 'Melakukan perancangan dan pengembangan solusi teknis.
Menganalisis dan memecahkan masalah teknis.
Bekerja sama dengan tim lintas departemen.
Melakukan dokumentasi teknis dan pelaporan proyek.
Mendukung testing dan pemeliharaan sistem.', 'Minimal Diploma atau Sarjana di bidang Teknik.
Memahami dasar desain dan implementasi sistem teknis.
Menguasai tools engineering menjadi nilai tambah.
Memiliki kemampuan analisis dan komunikasi yang baik.
Mampu bekerja secara individu maupun tim.', '2026-10-08', false, '2026-10-08 02:41:50.153925+00'),
	(3, 'ERP Coordinator', 'IT Department', 'Indonesia', 'Full Time', 'Mendukung koordinasi sistem ERP dan proses bisnis untuk membantu operasional perusahaan berjalan secara efektif.', 'Mengoordinasikan aktivitas ERP dengan tim terkait.
Menganalisis kebutuhan dan masalah sistem.
Bekerja sama dengan user dan tim teknis.
Membuat dokumentasi dan laporan.', 'Minimal Diploma atau Sarjana di bidang IT atau terkait.
Memahami dasar sistem informasi.
Memiliki kemampuan analisis dan komunikasi yang baik.', '2026-10-08', false, '2026-10-08 02:41:50.153925+00'),
	(4, 'HR', 'IHR Department', 'Indonesia', 'Full Time', 'Mendukung aktivitas Human Resources dan memberikan layanan administrasi serta pengembangan karyawan.', 'Mendukung administrasi HR.
Membantu proses recruitment dan onboarding.
Menjaga dokumentasi karyawan.
Bekerja sama dengan berbagai departemen.', 'Minimal Diploma atau Sarjana.
Komunikatif dan mampu bekerja dengan tim.
Memiliki ketelitian dan kemampuan administrasi.', '2026-10-08', false, '2026-10-08 02:41:50.153925+00'),
	(10, 'aaaaaaaaaaaaaaaaaaaaaaaaa', 'Engineer Department', NULL, 'Full Time', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-09', false, '2026-10-09 02:16:14.649647+00'),
	(11, 'aaaaaaaaaaaaaaaaaaaa', 'Engineer Department', NULL, 'Contract', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-09', false, '2026-10-09 02:16:30.241757+00'),
	(5, 'Drafter', 'Engineer Department', 'Indonesia', 'Full Time', 'Membantu pembuatan dan pengelolaan gambar teknis untuk mendukung kebutuhan proyek dan operasional perusahaan.', 'Membuat dan memperbarui gambar teknis.
Memastikan gambar sesuai standar yang berlaku.
Berkolaborasi dengan tim engineering.
Mengelola dokumentasi gambar.', 'Minimal Diploma di bidang Teknik.
Menguasai software drafting menjadi nilai tambah.
Teliti dan mampu bekerja dengan deadline.', '2026-10-08', false, '2026-10-08 02:41:50.153925+00'),
	(12, 'lllllllllllllll', 'Engineering Department', NULL, 'Full Time', 'aaaaaaaaa', 'aaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaa', '2026-10-13', true, '2026-10-13 07:13:12.814765+00'),
	(13, 'aaaaaaaaaaaaaaaaaaa', 'Engineer Department', NULL, 'Contract', 'aaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-13', true, '2026-10-13 07:13:25.86261+00'),
	(14, 'wwwwwwwwwwwwwwwwwwwww', 'Engineering Department', NULL, 'Contract', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-13', true, '2026-10-13 07:13:42.441365+00'),
	(15, 'aaaaaaaaaa', 'IHR Department', NULL, 'Contract', 'aaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2026-10-14', true, '2026-10-14 07:49:29.688668+00');


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."applications" ("id", "applicant_id", "job_id", "cv_url", "cover_letter_url", "photo_url", "ktp_url", "skck_url", "health_certificate_url", "work_experience_url", "ijazah_url", "status", "applied_at", "created_at") VALUES
	(20, 26, 6, '26/cv-1792028535607.docx', '26/cover-letter-1792028536105.docx', '26/photo-1792028536465.jpg', '26/ktp-1792028540247.png', '26/skck-1792028541244.png', '26/health-certificate-1792028542109.jpg', '26/work-experience-1792028546756.docx', '26/ijazah-1792028547551.jpg', 'Pending', '2026-10-15 01:42:37.869822+00', '2026-10-15 01:42:37.869822+00'),
	(18, 24, 15, '24/cv-1791964837418.docx', '24/cover-letter-1791964837786.docx', '24/photo-1791964838178.jpg', '24/ktp-1791964839711.jpg', '24/skck-1791964841127.jpg', '24/health-certificate-1791964842198.jpg', '24/work-experience-1791964843974.docx', '24/ijazah-1791964844286.jpg', 'Pending', '2026-10-14 08:00:48.006894+00', '2026-10-14 08:00:48.006894+00'),
	(19, 25, 14, '25/cv-1791964888160.docx', '25/cover-letter-1791964888733.docx', '25/photo-1791964889089.jpg', '25/ktp-1791964891005.jpg', '25/skck-1791964892781.png', '25/health-certificate-1791964893427.jpg', '25/work-experience-1791964895064.docx', '25/ijazah-1791964895445.jpg', 'Pending', '2026-10-14 08:01:39.371696+00', '2026-10-14 08:01:39.371696+00');


--
-- Data for Name: application_notification_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."application_notification_logs" ("application_id", "notification_type", "status", "error_message", "updated_at") VALUES
	(18, 'applicant', 'sent', NULL, '2026-10-14 08:00:50.861+00'),
	(18, 'admin', 'sent', NULL, '2026-10-14 08:00:51.363+00'),
	(19, 'applicant', 'sent', NULL, '2026-10-14 08:01:42.098+00'),
	(19, 'admin', 'sent', NULL, '2026-10-14 08:01:42.758+00'),
	(20, 'applicant', 'sent', NULL, '2026-10-15 01:42:40.595+00'),
	(20, 'admin', 'sent', NULL, '2026-10-15 01:42:40.727+00');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type", "versioning_status", "lifecycle_configuration", "lifecycle_configuration_generation") VALUES
	('application-documents', 'application-documents', NULL, '2026-10-07 01:43:42.583868+00', '2026-10-07 01:43:42.583868+00', true, false, 5242880, '{application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,image/jpeg,image/png}', NULL, 'STANDARD', 'DISABLED', NULL, NULL);


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata", "archived_at", "is_delete_marker", "is_versioned") VALUES
	('afd4057b-99df-49ee-b3d9-cf11be907415', 'application-documents', '3/cv-1791357417679.docx', NULL, '2026-10-07 07:17:08.96441+00', '2026-10-07 07:17:08.96441+00', '2026-10-07 07:17:08.96441+00', '{"eTag": "\"14c7a697092b0654f538aed0254593cc\"", "size": 1528730, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:17:09.000Z", "contentLength": 1528730, "httpStatusCode": 200}', '5fcc6184-5bba-4f18-a3b3-563a51ee05cd', NULL, '{}', NULL, false, false),
	('0fc191c4-1de5-439b-9462-be9c362d87c7', 'application-documents', '10/skck-1791535070294.jpg', NULL, '2026-10-09 08:37:53.928492+00', '2026-10-09 08:37:53.928492+00', '2026-10-09 08:37:53.928492+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T08:37:54.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'aa5deb56-4b72-4aad-bfce-03f181c451b8', NULL, '{}', NULL, false, false),
	('2abf81de-100a-4607-b88a-8a1fdc72da24', 'application-documents', '3/cover-letter-1791357429396.docx', NULL, '2026-10-07 07:17:18.272187+00', '2026-10-07 07:17:18.272187+00', '2026-10-07 07:17:18.272187+00', '{"eTag": "\"3db089968148849d899cbd397f89be51\"", "size": 1527716, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:17:19.000Z", "contentLength": 1527716, "httpStatusCode": 200}', '60e71575-1bdc-4a33-b502-37e2fa04cd67', NULL, '{}', NULL, false, false),
	('4b02347b-13a9-4a6a-b84b-7e4a908e7208', 'application-documents', '18/cv-1791961805691.docx', NULL, '2026-10-14 07:10:08.103033+00', '2026-10-14 07:10:08.103033+00', '2026-10-14 07:10:08.103033+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:10:09.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'eea584b7-c987-4d80-8ddb-dc2986b06e3d', NULL, '{}', NULL, false, false),
	('db6285d6-6ca0-429f-bd86-7a88a9d13246', 'application-documents', '3/photo-1791357438690.jpeg', NULL, '2026-10-07 07:17:18.778784+00', '2026-10-07 07:17:18.778784+00', '2026-10-07 07:17:18.778784+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:17:19.000Z", "contentLength": 52989, "httpStatusCode": 200}', '703db811-de03-4b5a-86ac-56d753046b26', NULL, '{}', NULL, false, false),
	('4a70a6e8-d9d0-473c-911b-b537ecaa5afd', 'application-documents', '10/health-certificate-1791535079411.jpg', NULL, '2026-10-09 08:38:00.229012+00', '2026-10-09 08:38:00.229012+00', '2026-10-09 08:38:00.229012+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T08:38:01.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'f308a20b-7249-4e5c-add6-c91895f65168', NULL, '{}', NULL, false, false),
	('4d328c07-023f-441d-b344-aab6ed0b05ce', 'application-documents', '3/ktp-1791357439207.jpg', NULL, '2026-10-07 07:17:19.356524+00', '2026-10-07 07:17:19.356524+00', '2026-10-07 07:17:19.356524+00', '{"eTag": "\"f037f9bcc2b03c217d0df618c70f0062\"", "size": 61261, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:17:20.000Z", "contentLength": 61261, "httpStatusCode": 200}', '22719eff-35c2-4f4d-977b-46249a05ea78', NULL, '{}', NULL, false, false),
	('309327d6-ccb6-4386-b1ce-2991b225722c', 'application-documents', '3/skck-1791357439792.jpeg', NULL, '2026-10-07 07:17:19.8494+00', '2026-10-07 07:17:19.8494+00', '2026-10-07 07:17:19.8494+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:17:20.000Z", "contentLength": 52989, "httpStatusCode": 200}', '3ff4a29f-1bf7-4226-9190-698a19de2810', NULL, '{}', NULL, false, false),
	('4d9da6e4-39ff-437e-a888-8b33d20b5345', 'application-documents', '10/work-experience-1791535085763.docx', NULL, '2026-10-09 08:38:00.688081+00', '2026-10-09 08:38:00.688081+00', '2026-10-09 08:38:00.688081+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T08:38:01.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'fed58260-57d4-419b-8965-f4cb6b324a4a', NULL, '{}', NULL, false, false),
	('c8cb8d66-8462-47a3-a2d2-b527ab4ea440', 'application-documents', '3/health-certificate-1791357440280.jpg', NULL, '2026-10-07 07:17:20.396611+00', '2026-10-07 07:17:20.396611+00', '2026-10-07 07:17:20.396611+00', '{"eTag": "\"f037f9bcc2b03c217d0df618c70f0062\"", "size": 61261, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:17:21.000Z", "contentLength": 61261, "httpStatusCode": 200}', '09a3c4a3-f4f1-4a70-be33-d130e04b5fe4', NULL, '{}', NULL, false, false),
	('32a9fc5b-86c4-4a54-8ea5-5ef280a6d7a1', 'application-documents', '3/work-experience-1791357440830.docx', NULL, '2026-10-07 07:17:30.857602+00', '2026-10-07 07:17:30.857602+00', '2026-10-07 07:17:30.857602+00', '{"eTag": "\"14c7a697092b0654f538aed0254593cc\"", "size": 1528730, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:17:31.000Z", "contentLength": 1528730, "httpStatusCode": 200}', '5b1c71c7-7302-4a13-ad1f-28a72f3d9202', NULL, '{}', NULL, false, false),
	('51c55b17-eb87-471b-9f60-a77e20f33914', 'application-documents', '3/ijazah-1791357451295.jpeg', NULL, '2026-10-07 07:17:31.623448+00', '2026-10-07 07:17:31.623448+00', '2026-10-07 07:17:31.623448+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:17:32.000Z", "contentLength": 52989, "httpStatusCode": 200}', '7ac3c54f-876e-41a6-9dbb-0884a768e761', NULL, '{}', NULL, false, false),
	('d6758a50-6d99-4b69-87e1-e4b91d8689a4', 'application-documents', '4/cv-1791358533730.docx', NULL, '2026-10-07 07:35:39.883888+00', '2026-10-07 07:35:39.883888+00', '2026-10-07 07:35:39.883888+00', '{"eTag": "\"14c7a697092b0654f538aed0254593cc\"", "size": 1528730, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:35:40.000Z", "contentLength": 1528730, "httpStatusCode": 200}', 'a6a294da-8060-430c-9e13-e1d674945ec8', NULL, '{}', NULL, false, false),
	('ba4c188f-ba63-42e7-a134-2b5850fcd17c', 'application-documents', '4/cover-letter-1791358540334.docx', NULL, '2026-10-07 07:35:42.404282+00', '2026-10-07 07:35:42.404282+00', '2026-10-07 07:35:42.404282+00', '{"eTag": "\"3db089968148849d899cbd397f89be51\"", "size": 1527716, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:35:43.000Z", "contentLength": 1527716, "httpStatusCode": 200}', 'ce34c699-291d-4bd4-b50d-a41c5afe28e2', NULL, '{}', NULL, false, false),
	('f42ef89d-c8a5-4f10-95c9-bab307a24487', 'application-documents', '10/ijazah-1791535086175.jpg', NULL, '2026-10-09 08:38:05.537698+00', '2026-10-09 08:38:05.537698+00', '2026-10-09 08:38:05.537698+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T08:38:06.000Z", "contentLength": 371071, "httpStatusCode": 200}', '4ded46e5-d27b-42bf-89dd-f44aebac982f', NULL, '{}', NULL, false, false),
	('10e8eca4-3677-433d-bc27-4a841e5f48bc', 'application-documents', '4/photo-1791358542913.jpeg', NULL, '2026-10-07 07:35:42.781443+00', '2026-10-07 07:35:42.781443+00', '2026-10-07 07:35:42.781443+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:35:43.000Z", "contentLength": 52989, "httpStatusCode": 200}', '34cb9769-b851-4c49-bb45-e78db5f9634f', NULL, '{}', NULL, false, false),
	('7527be44-2138-42d5-b924-45964364f0ac', 'application-documents', '18/cover-letter-1791961806065.docx', NULL, '2026-10-14 07:10:08.369243+00', '2026-10-14 07:10:08.369243+00', '2026-10-14 07:10:08.369243+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:10:09.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'f8ef882a-0ada-4ff0-8776-f920f116ebcc', NULL, '{}', NULL, false, false),
	('824fb1bb-c286-4c68-99bf-9fcd3daed3be', 'application-documents', '4/ktp-1791358543230.jpg', NULL, '2026-10-07 07:35:43.125436+00', '2026-10-07 07:35:43.125436+00', '2026-10-07 07:35:43.125436+00', '{"eTag": "\"f037f9bcc2b03c217d0df618c70f0062\"", "size": 61261, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:35:44.000Z", "contentLength": 61261, "httpStatusCode": 200}', '53488920-714c-463d-9c16-11f9423bd27d', NULL, '{}', NULL, false, false),
	('cdf69f39-c567-4a99-90be-4fd03acf28be', 'application-documents', '13/cv-1791873922516.docx', NULL, '2026-10-13 06:45:23.82454+00', '2026-10-13 06:45:23.82454+00', '2026-10-13 06:45:23.82454+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:45:24.000Z", "contentLength": 15717, "httpStatusCode": 200}', '5ce4c442-b648-487f-b31a-faebafaa73fb', NULL, '{}', NULL, false, false),
	('c8e80747-096b-4f3c-b29d-cf1c607540a5', 'application-documents', '4/skck-1791358543584.jpeg', NULL, '2026-10-07 07:35:43.457803+00', '2026-10-07 07:35:43.457803+00', '2026-10-07 07:35:43.457803+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:35:44.000Z", "contentLength": 52989, "httpStatusCode": 200}', '8af677e3-dcea-4fbc-8b43-30a3ab2331cd', NULL, '{}', NULL, false, false),
	('ab3e9c64-1231-4865-96d8-c40654cc28f0', 'application-documents', '4/health-certificate-1791358543904.jpg', NULL, '2026-10-07 07:35:43.79804+00', '2026-10-07 07:35:43.79804+00', '2026-10-07 07:35:43.79804+00', '{"eTag": "\"f037f9bcc2b03c217d0df618c70f0062\"", "size": 61261, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:35:44.000Z", "contentLength": 61261, "httpStatusCode": 200}', '989d04eb-f782-4f31-b874-4eb03ffb9bc0', NULL, '{}', NULL, false, false),
	('be8489e3-4cb2-41cf-80ba-9f7d15975806', 'application-documents', '13/cover-letter-1791873923031.docx', NULL, '2026-10-13 06:45:24.310997+00', '2026-10-13 06:45:24.310997+00', '2026-10-13 06:45:24.310997+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:45:25.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'b1a30b7a-c60d-4ac1-9594-e040575378eb', NULL, '{}', NULL, false, false),
	('90acad1c-b02a-42bb-a8cb-f2afa1a38023', 'application-documents', '4/work-experience-1791358544254.docx', NULL, '2026-10-07 07:35:46.287154+00', '2026-10-07 07:35:46.287154+00', '2026-10-07 07:35:46.287154+00', '{"eTag": "\"14c7a697092b0654f538aed0254593cc\"", "size": 1528730, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:35:47.000Z", "contentLength": 1528730, "httpStatusCode": 200}', '34f8a155-45e0-4b42-8c31-d24603fb23e3', NULL, '{}', NULL, false, false),
	('50466674-c7d4-476a-a5b0-f5b7ffe770fb', 'application-documents', '4/ijazah-1791358546746.jpeg', NULL, '2026-10-07 07:35:46.802839+00', '2026-10-07 07:35:46.802839+00', '2026-10-07 07:35:46.802839+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:35:47.000Z", "contentLength": 52989, "httpStatusCode": 200}', '9649edfa-d4e6-48a2-88a1-d2d1c6af6b77', NULL, '{}', NULL, false, false),
	('d54f300a-3532-43fa-ad1c-8f4e13e12f20', 'application-documents', '13/photo-1791873923460.jpg', NULL, '2026-10-13 06:45:25.668628+00', '2026-10-13 06:45:25.668628+00', '2026-10-13 06:45:25.668628+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:45:26.000Z", "contentLength": 371071, "httpStatusCode": 200}', '718c9915-2bdb-4991-935a-feb3d3a4a01b', NULL, '{}', NULL, false, false),
	('a7c1723a-c86d-4aca-bbc4-66689322bd65', 'application-documents', '5/cv-1791358650479.docx', NULL, '2026-10-07 07:37:32.772635+00', '2026-10-07 07:37:32.772635+00', '2026-10-07 07:37:32.772635+00', '{"eTag": "\"3db089968148849d899cbd397f89be51\"", "size": 1527716, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:37:33.000Z", "contentLength": 1527716, "httpStatusCode": 200}', 'd7d16f57-4eb0-4cb7-a5e2-10fa70b39e37', NULL, '{}', NULL, false, false),
	('ff8594e4-f672-44cb-9525-80e0ccbb7a92', 'application-documents', '5/cover-letter-1791358653235.pdf', NULL, '2026-10-07 07:37:33.519393+00', '2026-10-07 07:37:33.519393+00', '2026-10-07 07:37:33.519393+00', '{"eTag": "\"06d4848c19bcca6e39494189affd4343\"", "size": 311013, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:37:34.000Z", "contentLength": 311013, "httpStatusCode": 200}', 'e25cd86a-7648-4011-a69e-8e1603edf761', NULL, '{}', NULL, false, false),
	('26d2e3b6-0298-4000-974a-684a420781c9', 'application-documents', '5/photo-1791358653978.png', NULL, '2026-10-07 07:37:35.04825+00', '2026-10-07 07:37:35.04825+00', '2026-10-07 07:37:35.04825+00', '{"eTag": "\"be024be8200676f19a5d331a41529c5f\"", "size": 843983, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:37:35.000Z", "contentLength": 843983, "httpStatusCode": 200}', '22cad460-0bbc-4516-9f3c-1fe3a00c5382', NULL, '{}', NULL, false, false),
	('8f4a7157-2b04-4af4-addc-c86935478099', 'application-documents', '5/ktp-1791358655744.png', NULL, '2026-10-07 07:37:36.209193+00', '2026-10-07 07:37:36.209193+00', '2026-10-07 07:37:36.209193+00', '{"eTag": "\"ff0258917820ecfae4cadc829258feb5\"", "size": 551854, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:37:37.000Z", "contentLength": 551854, "httpStatusCode": 200}', 'bccbde22-2968-4d2d-989f-4eed372b56c3', NULL, '{}', NULL, false, false),
	('772b61f0-1a12-4e62-82d5-9baa2c9ecea4', 'application-documents', '5/skck-1791358656655.jpeg', NULL, '2026-10-07 07:37:36.655029+00', '2026-10-07 07:37:36.655029+00', '2026-10-07 07:37:36.655029+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:37:37.000Z", "contentLength": 52989, "httpStatusCode": 200}', '027f0bcc-4474-45b6-9f58-bbeb4478f218', NULL, '{}', NULL, false, false),
	('ba47243b-9770-48fd-a909-5096ab11d395', 'application-documents', '18/photo-1791961806317.png', NULL, '2026-10-14 07:10:08.877937+00', '2026-10-14 07:10:08.877937+00', '2026-10-14 07:10:08.877937+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:10:09.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'f9ee5538-7edb-4015-a32c-3e5263b0b755', NULL, '{}', NULL, false, false),
	('c0988f07-a066-4a7f-8b48-8cee726e1da7', 'application-documents', '5/health-certificate-1791358657185.jpeg', NULL, '2026-10-07 07:37:37.359256+00', '2026-10-07 07:37:37.359256+00', '2026-10-07 07:37:37.359256+00', '{"eTag": "\"d3a60fc675df8bdd4214606db29f03d1\"", "size": 111459, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:37:38.000Z", "contentLength": 111459, "httpStatusCode": 200}', 'fd14f9cc-ac7b-47df-864d-10610b343680', NULL, '{}', NULL, false, false),
	('ffc1c276-6d90-4a0d-b988-9241c0cc667f', 'application-documents', '11/cv-1791551426686.docx', NULL, '2026-10-09 13:10:26.892712+00', '2026-10-09 13:10:26.892712+00', '2026-10-09 13:10:26.892712+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T13:10:27.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'dfa860c6-9e1c-4c47-9af3-93d493b8fe11', NULL, '{}', NULL, false, false),
	('52e41aa3-b062-4083-9de5-d9557cc9ab65', 'application-documents', '5/work-experience-1791358657835.doc', NULL, '2026-10-07 07:37:37.714845+00', '2026-10-07 07:37:37.714845+00', '2026-10-07 07:37:37.714845+00', '{"eTag": "\"62ab406fa7cec278392a94887e85fa25\"", "size": 55808, "mimetype": "application/msword", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:37:38.000Z", "contentLength": 55808, "httpStatusCode": 200}', 'd664115a-0894-44c9-a45b-a804e2a2ca73', NULL, '{}', NULL, false, false),
	('06ec4f3d-9b6e-4301-83d2-f2a00b66ca4c', 'application-documents', '5/ijazah-1791358658172.jpeg', NULL, '2026-10-07 07:37:38.020054+00', '2026-10-07 07:37:38.020054+00', '2026-10-07 07:37:38.020054+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-07T07:37:38.000Z", "contentLength": 52989, "httpStatusCode": 200}', '3d150116-070d-4ae8-87f0-114639a3650e', NULL, '{}', NULL, false, false),
	('e859eabd-96ca-4f23-b22e-9f98e99ad6df', 'application-documents', '11/cover-letter-1791551426960.docx', NULL, '2026-10-09 13:10:27.112243+00', '2026-10-09 13:10:27.112243+00', '2026-10-09 13:10:27.112243+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T13:10:28.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'e8793da0-57f2-47d9-8814-6bd2324f951f', NULL, '{}', NULL, false, false),
	('f48dedd5-efec-4a67-87cf-de4e64aaa343', 'application-documents', '7/cv-1791427455496.docx', NULL, '2026-10-08 02:44:09.053783+00', '2026-10-08 02:44:09.053783+00', '2026-10-08 02:44:09.053783+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-08T02:44:10.000Z", "contentLength": 15717, "httpStatusCode": 200}', '0c8259ba-469c-4980-829e-685c162e69e0', NULL, '{}', NULL, false, false),
	('961f5e90-4c6e-46e5-bed4-78ca2afcef8c', 'application-documents', '18/ktp-1791961806839.png', NULL, '2026-10-14 07:10:09.308895+00', '2026-10-14 07:10:09.308895+00', '2026-10-14 07:10:09.308895+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:10:10.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'ecaf6553-2668-43b2-be1c-734b373426b2', NULL, '{}', NULL, false, false),
	('c2d7e1d8-fbc1-4fcb-a454-26a2d772a619', 'application-documents', '7/cover-letter-1791427455980.docx', NULL, '2026-10-08 02:44:14.662341+00', '2026-10-08 02:44:14.662341+00', '2026-10-08 02:44:14.662341+00', '{"eTag": "\"6884c31766cf15f8b6ae859ea5e5869c\"", "size": 1132871, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-08T02:44:15.000Z", "contentLength": 1132871, "httpStatusCode": 200}', '347833ee-0c18-4463-bc5a-6cae14383685', NULL, '{}', NULL, false, false),
	('e2b0d824-bfe3-4fa9-aaa8-9ddc85605cdf', 'application-documents', '11/photo-1791551427176.png', NULL, '2026-10-09 13:10:27.405584+00', '2026-10-09 13:10:27.405584+00', '2026-10-09 13:10:27.405584+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T13:10:28.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'ad83e5a9-20f5-4831-884a-10d33b2ed3db', NULL, '{}', NULL, false, false),
	('3e1f23ec-b2c7-4627-855c-1c8f75d00a7d', 'application-documents', '7/photo-1791427461559.jpg', NULL, '2026-10-08 02:44:16.650274+00', '2026-10-08 02:44:16.650274+00', '2026-10-08 02:44:16.650274+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-08T02:44:17.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'd187a9a6-4059-418a-9c35-463fa77f1347', NULL, '{}', NULL, false, false),
	('a7a44179-308c-4d17-bd3e-a7e2d49b899f', 'application-documents', '7/ktp-1791427463545.jpg', NULL, '2026-10-08 02:44:18.687951+00', '2026-10-08 02:44:18.687951+00', '2026-10-08 02:44:18.687951+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-08T02:44:19.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'bb454434-1fcc-41bb-866d-eb70cc63b375', NULL, '{}', NULL, false, false),
	('411f2244-e0e6-4cb2-8afa-6328e1a8aa5c', 'application-documents', '7/skck-1791427465840.jpg', NULL, '2026-10-08 02:44:21.002343+00', '2026-10-08 02:44:21.002343+00', '2026-10-08 02:44:21.002343+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-08T02:44:21.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'dfe536e6-a897-4c98-ab66-0a162504c8e8', NULL, '{}', NULL, false, false),
	('08d1bf1c-a9a2-403a-b8ff-58134c227484', 'application-documents', '7/health-certificate-1791427467890.jpg', NULL, '2026-10-08 02:44:22.997847+00', '2026-10-08 02:44:22.997847+00', '2026-10-08 02:44:22.997847+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-08T02:44:23.000Z", "contentLength": 371071, "httpStatusCode": 200}', '8c3cef98-8e36-4ede-80df-3cd4ae18107a', NULL, '{}', NULL, false, false),
	('45c74776-acd6-429f-b7bc-92a728e9451a', 'application-documents', '7/work-experience-1791427469941.docx', NULL, '2026-10-08 02:44:23.386091+00', '2026-10-08 02:44:23.386091+00', '2026-10-08 02:44:23.386091+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-08T02:44:24.000Z", "contentLength": 15717, "httpStatusCode": 200}', '5d053b24-68b0-45b1-a4a6-a928da7d5d93', NULL, '{}', NULL, false, false),
	('a569542a-bdb8-49e9-a6fa-c6e6aed70ac7', 'application-documents', '11/ktp-1791551427482.jpg', NULL, '2026-10-09 13:10:27.691125+00', '2026-10-09 13:10:27.691125+00', '2026-10-09 13:10:27.691125+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T13:10:28.000Z", "contentLength": 371071, "httpStatusCode": 200}', '4cc7f115-1946-4ccb-9b49-26c3ee66ace7', NULL, '{}', NULL, false, false),
	('70442115-9d3c-40c3-8dcb-39c60c2311aa', 'application-documents', '7/ijazah-1791427470308.jpg', NULL, '2026-10-08 02:44:25.147381+00', '2026-10-08 02:44:25.147381+00', '2026-10-08 02:44:25.147381+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-08T02:44:26.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'dacf0ba2-7806-4860-b348-f5977c62ad08', NULL, '{}', NULL, false, false),
	('16928b64-33a9-47d2-b39d-40cef8cf5890', 'application-documents', '18/skck-1791961807263.jpg', NULL, '2026-10-14 07:10:10.194827+00', '2026-10-14 07:10:10.194827+00', '2026-10-14 07:10:10.194827+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:10:11.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'a55f9e08-4c46-4e6a-9ea9-1fad1e0795ab', NULL, '{}', NULL, false, false),
	('a8c56df0-92cc-4d1f-a5bc-0a84d207bd4b', 'application-documents', '8/cv-1791531771303.docx', NULL, '2026-10-09 07:42:46.341522+00', '2026-10-09 07:42:46.341522+00', '2026-10-09 07:42:46.341522+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:42:47.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'ffd8c5ba-406a-4a82-9f48-93d23892f8b2', NULL, '{}', NULL, false, false),
	('9dbd1450-e93c-4367-bb6b-f70a44c18358', 'application-documents', '11/skck-1791551427758.jpg', NULL, '2026-10-09 13:10:27.974139+00', '2026-10-09 13:10:27.974139+00', '2026-10-09 13:10:27.974139+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T13:10:28.000Z", "contentLength": 371071, "httpStatusCode": 200}', '5da5cf81-0a7a-47ad-a972-2badb3e718e3', NULL, '{}', NULL, false, false),
	('997b7f1b-c06e-41f5-958f-420e3070e6e7', 'application-documents', '8/cover-letter-1791531771784.docx', NULL, '2026-10-09 07:42:47.709414+00', '2026-10-09 07:42:47.709414+00', '2026-10-09 07:42:47.709414+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:42:48.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'be9362cd-553f-4246-b0dd-ac5d8247b498', NULL, '{}', NULL, false, false),
	('b44d3e50-7288-4a55-94c7-ae4ce04effc1', 'application-documents', '8/photo-1791531773125.jpg', NULL, '2026-10-09 07:42:48.751423+00', '2026-10-09 07:42:48.751423+00', '2026-10-09 07:42:48.751423+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:42:49.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'f68124e5-d0de-4145-a6bc-190528f03807', NULL, '{}', NULL, false, false),
	('cd6f15ef-ea3f-4eb9-bbfe-3bd2924ab38f', 'application-documents', '11/health-certificate-1791551428045.pdf', NULL, '2026-10-09 13:10:28.283914+00', '2026-10-09 13:10:28.283914+00', '2026-10-09 13:10:28.283914+00', '{"eTag": "\"8bf05801d23f2c36162bcb4fbccdc389\"", "size": 1446413, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T13:10:29.000Z", "contentLength": 1446413, "httpStatusCode": 200}', '358b6406-55e3-4477-a7ae-0bdcd4f81290', NULL, '{}', NULL, false, false),
	('2f000d52-5db2-4165-b7d2-0a89bb47e975', 'application-documents', '8/ktp-1791531774159.jpg', NULL, '2026-10-09 07:42:49.81038+00', '2026-10-09 07:42:49.81038+00', '2026-10-09 07:42:49.81038+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:42:50.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'b11784db-d6ba-4ee8-bc58-fe219f622e5b', NULL, '{}', NULL, false, false),
	('348f3cc4-4b67-4dd6-94b4-a1eb936f2a7b', 'application-documents', '8/skck-1791531775219.jpg', NULL, '2026-10-09 07:42:50.829656+00', '2026-10-09 07:42:50.829656+00', '2026-10-09 07:42:50.829656+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:42:51.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'a514679c-7fc5-4750-bd6f-fae2e340e92f', NULL, '{}', NULL, false, false),
	('dfcf8cea-7659-4c5f-937b-560cce4161f6', 'application-documents', '11/work-experience-1791551428349.docx', NULL, '2026-10-09 13:10:28.773267+00', '2026-10-09 13:10:28.773267+00', '2026-10-09 13:10:28.773267+00', '{"eTag": "\"3db089968148849d899cbd397f89be51\"", "size": 1527716, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T13:10:29.000Z", "contentLength": 1527716, "httpStatusCode": 200}', '651811e3-8741-490c-81f1-5aa07c3d59a7', NULL, '{}', NULL, false, false),
	('9486c075-1bf1-4ff1-afd6-36ab1efb8a92', 'application-documents', '8/health-certificate-1791531776237.jpg', NULL, '2026-10-09 07:42:51.760928+00', '2026-10-09 07:42:51.760928+00', '2026-10-09 07:42:51.760928+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:42:52.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'cbd42bd4-8df2-4dfb-98a6-3a0444004bb5', NULL, '{}', NULL, false, false),
	('4b305c66-e24f-43c2-b408-581911a4682a', 'application-documents', '8/work-experience-1791531777196.docx', NULL, '2026-10-09 07:42:52.235008+00', '2026-10-09 07:42:52.235008+00', '2026-10-09 07:42:52.235008+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:42:53.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'e2a700ce-17a1-4242-a326-dd862acdc76a', NULL, '{}', NULL, false, false),
	('7e886efc-0e97-4f17-bf02-4e2facdbf491', 'application-documents', '8/ijazah-1791531777736.jpg', NULL, '2026-10-09 07:42:53.351701+00', '2026-10-09 07:42:53.351701+00', '2026-10-09 07:42:53.351701+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:42:54.000Z", "contentLength": 371071, "httpStatusCode": 200}', '5035ba9f-0da4-424d-ab42-4b750edb7ab2', NULL, '{}', NULL, false, false),
	('fb29be37-16ee-429c-9fee-5ac7616205b4', 'application-documents', '9/cv-1791532038290.docx', NULL, '2026-10-09 07:47:13.203795+00', '2026-10-09 07:47:13.203795+00', '2026-10-09 07:47:13.203795+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:47:14.000Z", "contentLength": 15717, "httpStatusCode": 200}', '63d27fa4-fcd9-4184-8080-4c961baadafe', NULL, '{}', NULL, false, false),
	('7f68626e-b8e5-428b-a33d-b21d9b06b671', 'application-documents', '18/health-certificate-1791961808148.png', NULL, '2026-10-14 07:10:10.67868+00', '2026-10-14 07:10:10.67868+00', '2026-10-14 07:10:10.67868+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:10:11.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'f90296ff-adf0-4aa6-adb5-cf48d90db947', NULL, '{}', NULL, false, false),
	('39978159-46fa-48e4-99d2-946a36e83be2', 'application-documents', '9/cover-letter-1791532038629.docx', NULL, '2026-10-09 07:47:13.473993+00', '2026-10-09 07:47:13.473993+00', '2026-10-09 07:47:13.473993+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:47:14.000Z", "contentLength": 15717, "httpStatusCode": 200}', '7b355453-e6b9-4f66-93d7-fb0d291f1e9b', NULL, '{}', NULL, false, false),
	('24815c0f-29dc-4c3e-85b8-e18f42a42ec9', 'application-documents', '11/ijazah-1791551428837.jpeg', NULL, '2026-10-09 13:10:29.015509+00', '2026-10-09 13:10:29.015509+00', '2026-10-09 13:10:29.015509+00', '{"eTag": "\"3daf4cbfc5bb1063cb3941f4415f4715\"", "size": 52989, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T13:10:29.000Z", "contentLength": 52989, "httpStatusCode": 200}', 'a3c777cc-0583-4207-9659-a15ce6079941', NULL, '{}', NULL, false, false),
	('dcf5cb49-d1cd-4e89-b614-fa4ba1be1e26', 'application-documents', '9/photo-1791532038920.jpg', NULL, '2026-10-09 07:47:14.115479+00', '2026-10-09 07:47:14.115479+00', '2026-10-09 07:47:14.115479+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:47:15.000Z", "contentLength": 371071, "httpStatusCode": 200}', '0154c393-5de4-4c69-b70c-b944fcf32915', NULL, '{}', NULL, false, false),
	('38d48cff-c167-4e34-b379-c9ecab8410b9', 'application-documents', '13/ktp-1791873924840.jpg', NULL, '2026-10-13 06:45:26.896554+00', '2026-10-13 06:45:26.896554+00', '2026-10-13 06:45:26.896554+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:45:27.000Z", "contentLength": 371071, "httpStatusCode": 200}', '269bae37-20fa-44b3-8bea-e008a0bb2a2b', NULL, '{}', NULL, false, false),
	('1cbf33de-a7d5-4157-8b25-e576907e55e9', 'application-documents', '9/ktp-1791532039530.jpg', NULL, '2026-10-09 07:47:14.721042+00', '2026-10-09 07:47:14.721042+00', '2026-10-09 07:47:14.721042+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:47:15.000Z", "contentLength": 371071, "httpStatusCode": 200}', '7b343d94-b548-4bbe-a6f7-e6a7f16d9bfe', NULL, '{}', NULL, false, false),
	('d9fda835-31a6-4e44-8dc2-347406a45f31', 'application-documents', '9/skck-1791532040137.jpg', NULL, '2026-10-09 07:47:15.340575+00', '2026-10-09 07:47:15.340575+00', '2026-10-09 07:47:15.340575+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:47:16.000Z", "contentLength": 371071, "httpStatusCode": 200}', '4f80ea3c-a803-451d-8b17-5a0e204177a9', NULL, '{}', NULL, false, false),
	('4e8495b8-1205-4c64-8ab5-40bb162645ee', 'application-documents', '13/skck-1791873926065.jpg', NULL, '2026-10-13 06:45:28.469261+00', '2026-10-13 06:45:28.469261+00', '2026-10-13 06:45:28.469261+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:45:29.000Z", "contentLength": 371071, "httpStatusCode": 200}', '132cae78-04c1-4d9d-a767-2229dc68eccc', NULL, '{}', NULL, false, false),
	('0d1656ca-80f0-4ee9-a5ef-ff1785e5bac0', 'application-documents', '9/health-certificate-1791532040757.jpg', NULL, '2026-10-09 07:47:16.049614+00', '2026-10-09 07:47:16.049614+00', '2026-10-09 07:47:16.049614+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:47:17.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'ac9c4e75-0944-42a0-8b8e-effd3f332766', NULL, '{}', NULL, false, false),
	('fca68f90-77df-4a8e-96d3-52c7d35bd6df', 'application-documents', '9/work-experience-1791532041493.docx', NULL, '2026-10-09 07:47:16.373422+00', '2026-10-09 07:47:16.373422+00', '2026-10-09 07:47:16.373422+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:47:17.000Z", "contentLength": 15717, "httpStatusCode": 200}', '8d8830c8-794c-4db5-a848-9b1f35e9d701', NULL, '{}', NULL, false, false),
	('27a2f535-2009-4f13-b88e-25d8c5013c2c', 'application-documents', '13/health-certificate-1791873927625.png', NULL, '2026-10-13 06:45:29.218956+00', '2026-10-13 06:45:29.218956+00', '2026-10-13 06:45:29.218956+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:45:30.000Z", "contentLength": 82172, "httpStatusCode": 200}', '35a087a6-6a19-4c6d-a507-f6493ccdd2bf', NULL, '{}', NULL, false, false),
	('5847fd01-7563-42c6-92e4-b439ebce3d21', 'application-documents', '9/ijazah-1791532041792.jpg', NULL, '2026-10-09 07:47:17.055575+00', '2026-10-09 07:47:17.055575+00', '2026-10-09 07:47:17.055575+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T07:47:17.000Z", "contentLength": 371071, "httpStatusCode": 200}', '1812963a-a289-484f-915d-b887093cac2a', NULL, '{}', NULL, false, false),
	('858f2270-77c6-4528-bf47-57fe3b178b35', 'application-documents', '10/cv-1791535049762.docx', NULL, '2026-10-09 08:37:25.428484+00', '2026-10-09 08:37:25.428484+00', '2026-10-09 08:37:25.428484+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T08:37:26.000Z", "contentLength": 15717, "httpStatusCode": 200}', '83af3561-c81b-497e-8161-18c5ccdeddcb', NULL, '{}', NULL, false, false),
	('51a27b83-d2d2-4121-8bdb-78c0d6f56683', 'application-documents', '10/cover-letter-1791535050912.docx', NULL, '2026-10-09 08:37:26.155136+00', '2026-10-09 08:37:26.155136+00', '2026-10-09 08:37:26.155136+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T08:37:27.000Z", "contentLength": 15717, "httpStatusCode": 200}', '8c2e2656-189c-4828-9f3f-cc28fd798a50', NULL, '{}', NULL, false, false),
	('46d14f15-0afa-494c-8545-36d2d9ef81e2', 'application-documents', '10/photo-1791535051632.jpg', NULL, '2026-10-09 08:37:35.331786+00', '2026-10-09 08:37:35.331786+00', '2026-10-09 08:37:35.331786+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T08:37:36.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'aaf76ca2-5b94-441b-8dfa-39865fd8cd1e', NULL, '{}', NULL, false, false),
	('26c96f85-aef3-403e-867b-482ded249a99', 'application-documents', '18/work-experience-1791961808634.docx', NULL, '2026-10-14 07:10:10.919282+00', '2026-10-14 07:10:10.919282+00', '2026-10-14 07:10:10.919282+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:10:11.000Z", "contentLength": 15717, "httpStatusCode": 200}', '0cefa2c1-7674-4b3d-86fd-a37bf7886ef6', NULL, '{}', NULL, false, false),
	('84e96580-fdf2-49f1-9f4b-df530626d48c', 'application-documents', '10/ktp-1791535060814.jpg', NULL, '2026-10-09 08:37:44.816822+00', '2026-10-09 08:37:44.816822+00', '2026-10-09 08:37:44.816822+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-09T08:37:45.000Z", "contentLength": 371071, "httpStatusCode": 200}', '7f8fe7a2-c9c1-4717-bbcf-85a55d8e8626', NULL, '{}', NULL, false, false),
	('9c5b4d51-7b40-4b11-adc6-d633018198be', 'application-documents', '12/cv-1791860132370.docx', NULL, '2026-10-13 02:55:34.041619+00', '2026-10-13 02:55:34.041619+00', '2026-10-13 02:55:34.041619+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T02:55:35.000Z", "contentLength": 15717, "httpStatusCode": 200}', '82ff3ade-7205-439c-b4b9-d2cd742b7b18', NULL, '{}', NULL, false, false),
	('854bc644-1477-4e33-903a-3896d53e4cfb', 'application-documents', '12/cover-letter-1791860132872.docx', NULL, '2026-10-13 02:55:34.399506+00', '2026-10-13 02:55:34.399506+00', '2026-10-13 02:55:34.399506+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T02:55:35.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'f7c43b79-5d61-4079-9ff3-62ed35e78d3c', NULL, '{}', NULL, false, false),
	('3868422e-5e51-4d81-92e0-3bf0669c6bc7', 'application-documents', '18/ijazah-1791961808883.png', NULL, '2026-10-14 07:10:12.108505+00', '2026-10-14 07:10:12.108505+00', '2026-10-14 07:10:12.108505+00', '{"eTag": "\"ff0258917820ecfae4cadc829258feb5\"", "size": 551854, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:10:13.000Z", "contentLength": 551854, "httpStatusCode": 200}', '5fbae83a-202d-4d27-b4ae-16cd315f0640', NULL, '{}', NULL, false, false),
	('b522f811-e060-4f6c-92dd-30119f21a947', 'application-documents', '12/photo-1791860133190.png', NULL, '2026-10-13 02:55:37.531511+00', '2026-10-13 02:55:37.531511+00', '2026-10-13 02:55:37.531511+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T02:55:38.000Z", "contentLength": 82172, "httpStatusCode": 200}', '2623495c-8638-4463-9f2e-2c1ce05b65a6', NULL, '{}', NULL, false, false),
	('b9f2b4f3-602d-4801-b561-f8fd0f206d5a', 'application-documents', '12/ktp-1791860136377.jpg', NULL, '2026-10-13 02:55:39.991611+00', '2026-10-13 02:55:39.991611+00', '2026-10-13 02:55:39.991611+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T02:55:40.000Z", "contentLength": 371071, "httpStatusCode": 200}', '4d900015-7731-4771-ac00-58fd61f67a98', NULL, '{}', NULL, false, false),
	('40fd8518-3d75-48b9-8589-0620f90773ff', 'application-documents', '24/cv-1791964837418.docx', NULL, '2026-10-14 08:00:39.764553+00', '2026-10-14 08:00:39.764553+00', '2026-10-14 08:00:39.764553+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:00:40.000Z", "contentLength": 15717, "httpStatusCode": 200}', '99c243d2-305a-414e-92c3-451848718b1c', NULL, '{}', NULL, false, false),
	('858b26c1-4329-417b-8158-523095ef3191', 'application-documents', '12/skck-1791860138784.jpg', NULL, '2026-10-13 02:55:42.629761+00', '2026-10-13 02:55:42.629761+00', '2026-10-13 02:55:42.629761+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T02:55:43.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'a5b106aa-9aa9-44eb-84e3-303a356f4e12', NULL, '{}', NULL, false, false),
	('59228296-0cf1-49ea-ad99-575d9f96cf48', 'application-documents', '12/health-certificate-1791860141434.jpg', NULL, '2026-10-13 02:55:45.34427+00', '2026-10-13 02:55:45.34427+00', '2026-10-13 02:55:45.34427+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T02:55:46.000Z", "contentLength": 371071, "httpStatusCode": 200}', '380801ac-1c3c-4f39-b010-ad4dc5f3cf8c', NULL, '{}', NULL, false, false),
	('b29012b1-3562-4fdd-9737-982bd415af28', 'application-documents', '24/cover-letter-1791964837786.docx', NULL, '2026-10-14 08:00:40.163406+00', '2026-10-14 08:00:40.163406+00', '2026-10-14 08:00:40.163406+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:00:41.000Z", "contentLength": 15717, "httpStatusCode": 200}', '42916dd8-4d28-4afd-a0a4-2f9a36d0135b', NULL, '{}', NULL, false, false),
	('db56774d-a89b-484b-a5d7-634e8085179e', 'application-documents', '12/work-experience-1791860144140.docx', NULL, '2026-10-13 02:55:45.737171+00', '2026-10-13 02:55:45.737171+00', '2026-10-13 02:55:45.737171+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T02:55:46.000Z", "contentLength": 15717, "httpStatusCode": 200}', '9a4678b6-43cb-4565-a913-311714f2dcca', NULL, '{}', NULL, false, false),
	('763086e5-9c0f-4016-bd7d-a448c70981a2', 'application-documents', '12/ijazah-1791860144556.jpg', NULL, '2026-10-13 02:55:48.59575+00', '2026-10-13 02:55:48.59575+00', '2026-10-13 02:55:48.59575+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T02:55:49.000Z", "contentLength": 371071, "httpStatusCode": 200}', '6dd1d5b6-6459-4e06-a5bf-73028efe9873', NULL, '{}', NULL, false, false),
	('ae5e908a-8730-414d-94f5-6a3ab3ed5ea6', 'application-documents', '13/work-experience-1791873928371.docx', NULL, '2026-10-13 06:45:29.645752+00', '2026-10-13 06:45:29.645752+00', '2026-10-13 06:45:29.645752+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:45:30.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'f1c7aa6a-edb8-4900-b174-5575082c9165', NULL, '{}', NULL, false, false),
	('fa3dd18d-4806-4ced-b281-a8b4717b8767', 'application-documents', '13/ijazah-1791873928818.jpg', NULL, '2026-10-13 06:45:30.980814+00', '2026-10-13 06:45:30.980814+00', '2026-10-13 06:45:30.980814+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:45:31.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'e8efe3bf-b58c-40fa-b6e5-1794900ba9a0', NULL, '{}', NULL, false, false),
	('dc7fdf98-2441-4bdc-9be7-47be8a84e538', 'application-documents', '19/cv-1791963145996.docx', NULL, '2026-10-14 07:32:28.48282+00', '2026-10-14 07:32:28.48282+00', '2026-10-14 07:32:28.48282+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:32:29.000Z", "contentLength": 15717, "httpStatusCode": 200}', '2573abda-06b4-417e-b840-8d5c57fe46f3', NULL, '{}', NULL, false, false),
	('fbcb8491-6415-4ce7-a590-8b369bc30c64', 'application-documents', '19/cover-letter-1791963146463.docx', NULL, '2026-10-14 07:32:28.875067+00', '2026-10-14 07:32:28.875067+00', '2026-10-14 07:32:28.875067+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:32:29.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'a4992bd1-5a8c-4ce9-9022-3a43dd740b7a', NULL, '{}', NULL, false, false),
	('c9de91d6-dccf-4c4d-b5a3-58426490b56b', 'application-documents', '20/cv-1791963150524.docx', NULL, '2026-10-14 07:32:33.250801+00', '2026-10-14 07:32:33.250801+00', '2026-10-14 07:32:33.250801+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:32:34.000Z", "contentLength": 15717, "httpStatusCode": 200}', '6a28a584-d6bc-4d31-b738-22b59f41bc54', NULL, '{}', NULL, false, false),
	('9bba6665-1e4f-42c0-b73e-258384b043b5', 'application-documents', '20/cover-letter-1791963151228.docx', NULL, '2026-10-14 07:32:33.639816+00', '2026-10-14 07:32:33.639816+00', '2026-10-14 07:32:33.639816+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:32:34.000Z", "contentLength": 15717, "httpStatusCode": 200}', '63caa309-11b3-4b37-8f0c-2492362db6b5', NULL, '{}', NULL, false, false),
	('52bbb9ac-3d18-46da-8665-7cb60df9349d', 'application-documents', '21/cv-1791963165995.docx', NULL, '2026-10-14 07:32:48.922668+00', '2026-10-14 07:32:48.922668+00', '2026-10-14 07:32:48.922668+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:32:49.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'f9989233-4429-4cd3-9e72-5037f576afb0', NULL, '{}', NULL, false, false),
	('318abf3e-e29b-42b6-8fee-7b8d90eb69d3', 'application-documents', '21/cover-letter-1791963166902.docx', NULL, '2026-10-14 07:32:49.659193+00', '2026-10-14 07:32:49.659193+00', '2026-10-14 07:32:49.659193+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:32:50.000Z", "contentLength": 15717, "httpStatusCode": 200}', '8c8e396b-5c7f-4697-a038-68e16244404d', NULL, '{}', NULL, false, false),
	('eba50974-1497-4144-b171-d54d8f2e64ed', 'application-documents', '21/photo-1791963167636.jpeg', NULL, '2026-10-14 07:32:56.392368+00', '2026-10-14 07:32:56.392368+00', '2026-10-14 07:32:56.392368+00', '{"eTag": "\"251b3c12e149cbc1d329f8dc485a452c\"", "size": 190286, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:32:57.000Z", "contentLength": 190286, "httpStatusCode": 200}', 'd20ca110-feb3-4e9e-8d1e-b5fd76e064d4', NULL, '{}', NULL, false, false),
	('472818fa-d651-4559-b727-7c3cee629963', 'application-documents', '21/ktp-1791963174373.jpg', NULL, '2026-10-14 07:33:04.752691+00', '2026-10-14 07:33:04.752691+00', '2026-10-14 07:33:04.752691+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:33:05.000Z", "contentLength": 371071, "httpStatusCode": 200}', '65ee8e5c-1f17-4220-9d2f-c169265bd0ec', NULL, '{}', NULL, false, false),
	('a266a1cd-7ca9-4346-82d8-a0267e0d72f8', 'application-documents', '14/cv-1791874690265.docx', NULL, '2026-10-13 06:58:11.505703+00', '2026-10-13 06:58:11.505703+00', '2026-10-13 06:58:11.505703+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:58:12.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'b361d9bd-2e1f-48db-8abb-f970019ec3d9', NULL, '{}', NULL, false, false),
	('6b00b5a5-08af-46c4-81e0-647d998a5163', 'application-documents', '21/skck-1791963182737.jpg', NULL, '2026-10-14 07:33:17.080445+00', '2026-10-14 07:33:17.080445+00', '2026-10-14 07:33:17.080445+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:33:18.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'e2375363-7997-4c1d-8e2f-b515b5a71e80', NULL, '{}', NULL, false, false),
	('a6af49ea-4f19-48c8-8454-c84d8801cc93', 'application-documents', '14/cover-letter-1791874690610.docx', NULL, '2026-10-13 06:58:11.804864+00', '2026-10-13 06:58:11.804864+00', '2026-10-13 06:58:11.804864+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:58:12.000Z", "contentLength": 15717, "httpStatusCode": 200}', '6ca76849-1ed1-4cc0-acd4-d8a9c7317ca7', NULL, '{}', NULL, false, false),
	('c92ac99a-0b67-40e8-af8f-7242a06870d9', 'application-documents', '14/photo-1791874690919.jpg', NULL, '2026-10-13 06:58:12.614415+00', '2026-10-13 06:58:12.614415+00', '2026-10-13 06:58:12.614415+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:58:13.000Z", "contentLength": 371071, "httpStatusCode": 200}', '14c45200-d229-4bc6-942a-d8e449449145', NULL, '{}', NULL, false, false),
	('15b13070-9c45-4a23-9597-4e46f6624417', 'application-documents', '21/health-certificate-1791963195070.jpg', NULL, '2026-10-14 07:33:28.956739+00', '2026-10-14 07:33:28.956739+00', '2026-10-14 07:33:28.956739+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:33:29.000Z", "contentLength": 371071, "httpStatusCode": 200}', '91fb96b4-0884-4e0e-8f3a-12c007430dfe', NULL, '{}', NULL, false, false),
	('8c7d68fd-f033-47e6-a65f-b86d1090b951', 'application-documents', '14/ktp-1791874691723.jpg', NULL, '2026-10-13 06:58:13.422639+00', '2026-10-13 06:58:13.422639+00', '2026-10-13 06:58:13.422639+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:58:14.000Z", "contentLength": 371071, "httpStatusCode": 200}', '3f68240e-4b48-4464-8ffe-d1077c392746', NULL, '{}', NULL, false, false),
	('05609409-f07e-4c31-b1a2-95e2d0a40a1f', 'application-documents', '14/skck-1791874692544.jpg', NULL, '2026-10-13 06:58:14.490642+00', '2026-10-13 06:58:14.490642+00', '2026-10-13 06:58:14.490642+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:58:15.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'ec7f41dc-8949-4297-a62b-8c42a7b954f9', NULL, '{}', NULL, false, false),
	('baa9b2d4-eed0-4f6a-a616-1586d530e5ce', 'application-documents', '21/work-experience-1791963206940.docx', NULL, '2026-10-14 07:33:30.801653+00', '2026-10-14 07:33:30.801653+00', '2026-10-14 07:33:30.801653+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:33:31.000Z", "contentLength": 15717, "httpStatusCode": 200}', '4f10bb70-c778-456d-b4ce-99649d35d65e', NULL, '{}', NULL, false, false),
	('7d1359fd-b06a-4668-9659-66aa533e35fb', 'application-documents', '14/health-certificate-1791874693647.jpg', NULL, '2026-10-13 06:58:15.262634+00', '2026-10-13 06:58:15.262634+00', '2026-10-13 06:58:15.262634+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:58:16.000Z", "contentLength": 371071, "httpStatusCode": 200}', '4e17b744-65a0-4ded-ae98-aa829b72a11c', NULL, '{}', NULL, false, false),
	('db5244cf-ceea-43e6-b703-453c0357649b', 'application-documents', '14/work-experience-1791874694365.docx', NULL, '2026-10-13 06:58:15.519316+00', '2026-10-13 06:58:15.519316+00', '2026-10-13 06:58:15.519316+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:58:16.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'fae7b34b-4e12-4772-abd8-87887fa89f49', NULL, '{}', NULL, false, false),
	('493fb90c-837e-4f54-97c5-5d5d326ff179', 'application-documents', '21/ijazah-1791963208778.jpg', NULL, '2026-10-14 07:33:42.614615+00', '2026-10-14 07:33:42.614615+00', '2026-10-14 07:33:42.614615+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:33:43.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'e2e4a86c-bc81-4c6f-b5f3-660c120ccae3', NULL, '{}', NULL, false, false),
	('887e800b-be29-438b-954e-670a8f566544', 'application-documents', '14/ijazah-1791874694627.jpg', NULL, '2026-10-13 06:58:16.493422+00', '2026-10-13 06:58:16.493422+00', '2026-10-13 06:58:16.493422+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T06:58:17.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'a9bb866d-9b57-48cb-8a02-4c1d4adf3673', NULL, '{}', NULL, false, false),
	('a9901d4d-870e-476b-93ae-9b15cb088021', 'application-documents', '15/cv-1791877627512.docx', NULL, '2026-10-13 07:47:08.617489+00', '2026-10-13 07:47:08.617489+00', '2026-10-13 07:47:08.617489+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T07:47:09.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'd8a15f3b-777c-4d4d-82c3-992747a203b2', NULL, '{}', NULL, false, false),
	('96a34869-1997-4d3e-b1b6-2b1d117a2898', 'application-documents', '15/cover-letter-1791877627787.docx', NULL, '2026-10-13 07:47:08.869985+00', '2026-10-13 07:47:08.869985+00', '2026-10-13 07:47:08.869985+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T07:47:09.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'a3a7d7b9-932b-400c-8253-8c56428603de', NULL, '{}', NULL, false, false),
	('b7d3aaa5-bba2-43d9-a778-fa9c67635905', 'application-documents', '15/photo-1791877628037.jpg', NULL, '2026-10-13 07:47:09.595651+00', '2026-10-13 07:47:09.595651+00', '2026-10-13 07:47:09.595651+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T07:47:10.000Z", "contentLength": 371071, "httpStatusCode": 200}', '351e9fc3-4d36-474f-9243-4c7ec2125420', NULL, '{}', NULL, false, false),
	('05b59528-e08e-420f-a924-578efcea65c1', 'application-documents', '15/ktp-1791877628770.jpg', NULL, '2026-10-13 07:47:10.435991+00', '2026-10-13 07:47:10.435991+00', '2026-10-13 07:47:10.435991+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T07:47:11.000Z", "contentLength": 371071, "httpStatusCode": 200}', '822587a3-ad03-43b5-9289-c3b8ef24242d', NULL, '{}', NULL, false, false),
	('025da90f-0ec1-48bc-99aa-4fbc5bcc5e35', 'application-documents', '22/cv-1791964039670.docx', NULL, '2026-10-14 07:47:22.016892+00', '2026-10-14 07:47:22.016892+00', '2026-10-14 07:47:22.016892+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:47:22.000Z", "contentLength": 15717, "httpStatusCode": 200}', '60b523ee-af97-4150-86fd-6c52eec9a3d0', NULL, '{}', NULL, false, false),
	('f2633fa5-b29a-4387-9aa3-5aa37f3e6c99', 'application-documents', '15/skck-1791877629604.jpg', NULL, '2026-10-13 07:47:11.190368+00', '2026-10-13 07:47:11.190368+00', '2026-10-13 07:47:11.190368+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T07:47:12.000Z", "contentLength": 371071, "httpStatusCode": 200}', '8bce249f-4c85-4057-8cf2-8a5f4fbed3e9', NULL, '{}', NULL, false, false),
	('f171835d-c360-418d-8361-7e75b0ddbcb4', 'application-documents', '15/health-certificate-1791877630356.jpg', NULL, '2026-10-13 07:47:11.955418+00', '2026-10-13 07:47:11.955418+00', '2026-10-13 07:47:11.955418+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T07:47:12.000Z", "contentLength": 371071, "httpStatusCode": 200}', '2c2431cb-9033-43ef-9fd6-ad75ef80e097', NULL, '{}', NULL, false, false),
	('3bda1de7-e2a6-4609-bf7c-0bd24d231382', 'application-documents', '22/cover-letter-1791964040039.docx', NULL, '2026-10-14 07:47:22.437737+00', '2026-10-14 07:47:22.437737+00', '2026-10-14 07:47:22.437737+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:47:23.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'cf6a0ee2-a97a-4866-8545-a1cd54d678ae', NULL, '{}', NULL, false, false),
	('85bf1bec-9bd2-45ed-bb84-7529dc596a2a', 'application-documents', '15/work-experience-1791877631136.docx', NULL, '2026-10-13 07:47:12.236521+00', '2026-10-13 07:47:12.236521+00', '2026-10-13 07:47:12.236521+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T07:47:13.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'aac33a54-c998-435b-8f54-ef868d0cd2a8', NULL, '{}', NULL, false, false),
	('66d530bc-87ee-4dee-bc40-c385300af92a', 'application-documents', '15/ijazah-1791877631399.jpg', NULL, '2026-10-13 07:47:12.891255+00', '2026-10-13 07:47:12.891255+00', '2026-10-13 07:47:12.891255+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T07:47:13.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'e84c2f03-148d-4542-b4f5-6934fbd51f82', NULL, '{}', NULL, false, false),
	('d4fc906e-5715-42f5-84de-8723841068e2', 'application-documents', '22/photo-1791964040430.png', NULL, '2026-10-14 07:47:22.863278+00', '2026-10-14 07:47:22.863278+00', '2026-10-14 07:47:22.863278+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:47:23.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'c46d37ae-4a8e-4bf3-b6c6-84798c9051ed', NULL, '{}', NULL, false, false),
	('455a74a9-04fe-4bcd-b9a9-32e9407020e3', 'application-documents', '16/cv-1791881555781.docx', NULL, '2026-10-13 08:52:37.02808+00', '2026-10-13 08:52:37.02808+00', '2026-10-13 08:52:37.02808+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T08:52:37.000Z", "contentLength": 15717, "httpStatusCode": 200}', '90a46f72-41e2-4896-b447-92eb57d9a6d1', NULL, '{}', NULL, false, false),
	('92a58f82-903e-435e-9a82-2265b567f328', 'application-documents', '16/cover-letter-1791881556297.docx', NULL, '2026-10-13 08:52:37.358625+00', '2026-10-13 08:52:37.358625+00', '2026-10-13 08:52:37.358625+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T08:52:38.000Z", "contentLength": 15717, "httpStatusCode": 200}', '7234aae3-9b9f-4ed9-9f87-0c451d9d409a', NULL, '{}', NULL, false, false),
	('fb9ec851-eeea-4661-a054-b2dd1ed4ffc0', 'application-documents', '16/photo-1791881556625.jpg', NULL, '2026-10-13 08:52:38.708128+00', '2026-10-13 08:52:38.708128+00', '2026-10-13 08:52:38.708128+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T08:52:39.000Z", "contentLength": 371071, "httpStatusCode": 200}', '8078faec-94fc-409e-88a2-fec602f64d00', NULL, '{}', NULL, false, false),
	('939f50ca-2ddc-4283-a3e0-b3c277fe47df', 'application-documents', '16/ktp-1791881557982.jpg', NULL, '2026-10-13 08:52:39.899097+00', '2026-10-13 08:52:39.899097+00', '2026-10-13 08:52:39.899097+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T08:52:40.000Z", "contentLength": 371071, "httpStatusCode": 200}', '80130e1a-cfdb-4711-b256-fb3b9999d590', NULL, '{}', NULL, false, false),
	('f9877e59-7801-44d3-80d9-b9b78cca6e65', 'application-documents', '16/skck-1791881559167.jpg', NULL, '2026-10-13 08:52:41.259692+00', '2026-10-13 08:52:41.259692+00', '2026-10-13 08:52:41.259692+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T08:52:42.000Z", "contentLength": 371071, "httpStatusCode": 200}', '24fd6473-94bc-49fc-a804-26918e66b374', NULL, '{}', NULL, false, false),
	('123a01fa-b041-46f5-82f5-abe935fef38d', 'application-documents', '22/ktp-1791964040862.png', NULL, '2026-10-14 07:47:23.350462+00', '2026-10-14 07:47:23.350462+00', '2026-10-14 07:47:23.350462+00', '{"eTag": "\"d371792324455008ff109cab7a38a66b\"", "size": 72719, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:47:24.000Z", "contentLength": 72719, "httpStatusCode": 200}', '6757f74c-017e-4fcb-b15a-24e599156ee3', NULL, '{}', NULL, false, false),
	('4354fee1-00f4-4692-a688-cc6ef60f4eeb', 'application-documents', '16/health-certificate-1791881560558.jpg', NULL, '2026-10-13 08:52:42.907797+00', '2026-10-13 08:52:42.907797+00', '2026-10-13 08:52:42.907797+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T08:52:43.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'f0228869-fd5d-4fca-b078-4c8659de0ef4', NULL, '{}', NULL, false, false),
	('13899f4d-fe10-497d-9448-6006549db4c0', 'application-documents', '16/work-experience-1791881562172.docx', NULL, '2026-10-13 08:52:43.214332+00', '2026-10-13 08:52:43.214332+00', '2026-10-13 08:52:43.214332+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T08:52:44.000Z", "contentLength": 15717, "httpStatusCode": 200}', '106f7512-c6f5-462f-b505-b9d3d30c2af0', NULL, '{}', NULL, false, false),
	('44604957-e19b-4494-addd-c195463e2b9c', 'application-documents', '22/skck-1791964041357.png', NULL, '2026-10-14 07:47:23.913883+00', '2026-10-14 07:47:23.913883+00', '2026-10-14 07:47:23.913883+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:47:24.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'c90c4dff-6dda-42c1-b90c-386a58a0bfcf', NULL, '{}', NULL, false, false),
	('1887f301-495d-46e5-b92e-4c3c52002e1a', 'application-documents', '16/ijazah-1791881562497.jpg', NULL, '2026-10-13 08:52:44.440502+00', '2026-10-13 08:52:44.440502+00', '2026-10-13 08:52:44.440502+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-13T08:52:45.000Z", "contentLength": 371071, "httpStatusCode": 200}', '3195726c-8637-49e9-9e32-0e3d04937719', NULL, '{}', NULL, false, false),
	('33f83a77-fac7-4010-afa4-fbc01f3fe076', 'application-documents', '17/cv-1791961509485.docx', NULL, '2026-10-14 07:05:12.06513+00', '2026-10-14 07:05:12.06513+00', '2026-10-14 07:05:12.06513+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:05:13.000Z", "contentLength": 15717, "httpStatusCode": 200}', '6fbf54a9-1493-41b2-996b-c617e2189358', NULL, '{}', NULL, false, false),
	('cfb716bc-abe5-42d3-9273-2153355313e4', 'application-documents', '22/health-certificate-1791964041913.png', NULL, '2026-10-14 07:47:24.74056+00', '2026-10-14 07:47:24.74056+00', '2026-10-14 07:47:24.74056+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:47:25.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'a542603f-88df-412c-bcc3-1f5cb16f6950', NULL, '{}', NULL, false, false),
	('3178a1e0-89f3-4663-bfe9-a5e3325602c5', 'application-documents', '17/cover-letter-1791961510020.docx', NULL, '2026-10-14 07:05:12.334245+00', '2026-10-14 07:05:12.334245+00', '2026-10-14 07:05:12.334245+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:05:13.000Z", "contentLength": 15717, "httpStatusCode": 200}', '33de88ce-02b3-4a1f-87cf-eacdddf6ba0b', NULL, '{}', NULL, false, false),
	('a3202000-d62f-4ec5-ae10-45a8bf9ccef6', 'application-documents', '17/photo-1791961510277.jpg', NULL, '2026-10-14 07:05:13.071627+00', '2026-10-14 07:05:13.071627+00', '2026-10-14 07:05:13.071627+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:05:14.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'ef312e67-ac24-449a-a621-5b87524db5d8', NULL, '{}', NULL, false, false),
	('962487b0-8bfb-4764-a53b-9455dfe85ee3', 'application-documents', '22/work-experience-1791964042748.docx', NULL, '2026-10-14 07:47:25.078104+00', '2026-10-14 07:47:25.078104+00', '2026-10-14 07:47:25.078104+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:47:26.000Z", "contentLength": 15717, "httpStatusCode": 200}', '09143da9-7a7b-435e-973d-b8cbd9ae01bb', NULL, '{}', NULL, false, false),
	('0bff60dc-afa4-4de6-a072-026b36bd850f', 'application-documents', '17/ktp-1791961511018.jpg', NULL, '2026-10-14 07:05:13.808959+00', '2026-10-14 07:05:13.808959+00', '2026-10-14 07:05:13.808959+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:05:14.000Z", "contentLength": 371071, "httpStatusCode": 200}', '4e848c12-8973-40d4-ab10-49b850db0e12', NULL, '{}', NULL, false, false),
	('e247bfff-27fc-475a-8f44-c00e41beb9e0', 'application-documents', '17/skck-1791961511765.jpg', NULL, '2026-10-14 07:05:15.1895+00', '2026-10-14 07:05:15.1895+00', '2026-10-14 07:05:15.1895+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:05:16.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'fb9a0071-58e1-4bd5-b3f6-66599ecb8803', NULL, '{}', NULL, false, false),
	('fa89e1d0-72b6-4c72-9080-fa1352417854', 'application-documents', '17/health-certificate-1791961513147.jpg', NULL, '2026-10-14 07:05:15.940683+00', '2026-10-14 07:05:15.940683+00', '2026-10-14 07:05:15.940683+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:05:16.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'eb00b100-2d07-4518-8a9e-1ab33577274f', NULL, '{}', NULL, false, false),
	('6507eaaf-10c1-4114-8b85-806ca9f9d2cf', 'application-documents', '17/work-experience-1791961513903.docx', NULL, '2026-10-14 07:05:16.210423+00', '2026-10-14 07:05:16.210423+00', '2026-10-14 07:05:16.210423+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:05:17.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'cf08a984-dfc4-4a21-beb7-f3a370222b8e', NULL, '{}', NULL, false, false),
	('476e7d0c-4ac5-4ef0-bd18-4283b3a7e497', 'application-documents', '17/ijazah-1791961514162.jpg', NULL, '2026-10-14 07:05:16.933914+00', '2026-10-14 07:05:16.933914+00', '2026-10-14 07:05:16.933914+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:05:17.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'be90945c-1870-4545-bc79-ee99bcb3323b', NULL, '{}', NULL, false, false),
	('f7e9c8f2-a10a-45d5-9001-eaa91daf1ad5', 'application-documents', '22/ijazah-1791964043128.png', NULL, '2026-10-14 07:47:25.614378+00', '2026-10-14 07:47:25.614378+00', '2026-10-14 07:47:25.614378+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:47:26.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'a51ad03a-8219-4cc6-804d-a538f7ae2d0c', NULL, '{}', NULL, false, false),
	('31fd58a2-7108-4085-996f-62ad3318349e', 'application-documents', '23/cv-1791964462995.docx', NULL, '2026-10-14 07:54:25.420485+00', '2026-10-14 07:54:25.420485+00', '2026-10-14 07:54:25.420485+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:54:26.000Z", "contentLength": 15717, "httpStatusCode": 200}', '4eebb432-552c-40b7-a812-eae46178fcbd', NULL, '{}', NULL, false, false),
	('0b6947ee-54b3-4762-9a4d-65d69a6b98fb', 'application-documents', '23/cover-letter-1791964463489.docx', NULL, '2026-10-14 07:54:25.783131+00', '2026-10-14 07:54:25.783131+00', '2026-10-14 07:54:25.783131+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:54:26.000Z", "contentLength": 15717, "httpStatusCode": 200}', '08f21dd3-6b2d-40cc-bb8a-e7f4c46a7716', NULL, '{}', NULL, false, false),
	('e7530cf3-5b99-48a4-8945-2c2cb688817a', 'application-documents', '23/photo-1791964463793.png', NULL, '2026-10-14 07:54:29.636799+00', '2026-10-14 07:54:29.636799+00', '2026-10-14 07:54:29.636799+00', '{"eTag": "\"be024be8200676f19a5d331a41529c5f\"", "size": 843983, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:54:30.000Z", "contentLength": 843983, "httpStatusCode": 200}', 'bd84d68d-1438-48bc-96c0-29b6361617f0', NULL, '{}', NULL, false, false),
	('667e01c2-1bca-4575-b43b-3bd5b5b380c3', 'application-documents', '23/ktp-1791964467739.png', NULL, '2026-10-14 07:54:30.496745+00', '2026-10-14 07:54:30.496745+00', '2026-10-14 07:54:30.496745+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:54:31.000Z", "contentLength": 82172, "httpStatusCode": 200}', '474cf42a-d65c-4a95-8c0b-c218eae2b700', NULL, '{}', NULL, false, false),
	('63b0c875-2d27-4dd2-ae3e-1db39926537e', 'application-documents', '23/skck-1791964468513.jpg', NULL, '2026-10-14 07:54:32.151842+00', '2026-10-14 07:54:32.151842+00', '2026-10-14 07:54:32.151842+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:54:33.000Z", "contentLength": 371071, "httpStatusCode": 200}', '1f8a18fe-da87-4764-860f-014fa5af4b96', NULL, '{}', NULL, false, false),
	('fc4c940a-b96f-44ac-9502-99ee42d0f52f', 'application-documents', '23/health-certificate-1791964470166.png', NULL, '2026-10-14 07:54:32.823933+00', '2026-10-14 07:54:32.823933+00', '2026-10-14 07:54:32.823933+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:54:33.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'c08a56d8-6f95-4e7d-88aa-a46330c440a9', NULL, '{}', NULL, false, false),
	('73753967-5e7a-4417-bbeb-57703b46deec', 'application-documents', '23/work-experience-1791964470844.docx', NULL, '2026-10-14 07:54:33.179123+00', '2026-10-14 07:54:33.179123+00', '2026-10-14 07:54:33.179123+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:54:34.000Z", "contentLength": 15717, "httpStatusCode": 200}', '338f6961-a09c-4b9a-a3a4-44cb69bd4a61', NULL, '{}', NULL, false, false),
	('5b5f025a-9944-4ffd-b491-3c9d77e70ae1', 'application-documents', '23/ijazah-1791964471187.jpg', NULL, '2026-10-14 07:54:36.140342+00', '2026-10-14 07:54:36.140342+00', '2026-10-14 07:54:36.140342+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T07:54:37.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'a14111cd-7413-4e30-b64a-d66246ba16ef', NULL, '{}', NULL, false, false),
	('9e9914f9-2a10-4e1a-a1cf-8c6f4b886d5d', 'application-documents', '24/photo-1791964838178.jpg', NULL, '2026-10-14 08:00:41.696865+00', '2026-10-14 08:00:41.696865+00', '2026-10-14 08:00:41.696865+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:00:42.000Z", "contentLength": 371071, "httpStatusCode": 200}', '7126eb1f-b00b-479a-96c6-e1ac91a3dd4f', NULL, '{}', NULL, false, false),
	('33b3bac0-4dc9-4a95-8dc2-53dab4e3b364', 'application-documents', '24/ktp-1791964839711.jpg', NULL, '2026-10-14 08:00:43.081804+00', '2026-10-14 08:00:43.081804+00', '2026-10-14 08:00:43.081804+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:00:44.000Z", "contentLength": 371071, "httpStatusCode": 200}', '9258ca23-3fe4-4815-9bdc-8b2b174179cd', NULL, '{}', NULL, false, false),
	('f7b55e1e-a3ae-45d4-ba57-d4a25fc17206', 'application-documents', '24/skck-1791964841127.jpg', NULL, '2026-10-14 08:00:44.150355+00', '2026-10-14 08:00:44.150355+00', '2026-10-14 08:00:44.150355+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:00:45.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'a48ab4de-15d4-46f9-beca-68ecc112232b', NULL, '{}', NULL, false, false),
	('3f25ed4a-1cfd-48bd-87ff-e778e1959937', 'application-documents', '24/health-certificate-1791964842198.jpg', NULL, '2026-10-14 08:00:45.945885+00', '2026-10-14 08:00:45.945885+00', '2026-10-14 08:00:45.945885+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:00:46.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'd0137fa5-860c-408f-a386-91862fb945c6', NULL, '{}', NULL, false, false),
	('23663977-ffd5-4d32-a1ff-1743536e776f', 'application-documents', '24/work-experience-1791964843974.docx', NULL, '2026-10-14 08:00:46.272455+00', '2026-10-14 08:00:46.272455+00', '2026-10-14 08:00:46.272455+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:00:47.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'd8863fa6-3b55-41d9-9ed1-66934e06b6d7', NULL, '{}', NULL, false, false),
	('b3392dcd-7b18-4894-b432-8c12d8a7601e', 'application-documents', '24/ijazah-1791964844286.jpg', NULL, '2026-10-14 08:00:47.855897+00', '2026-10-14 08:00:47.855897+00', '2026-10-14 08:00:47.855897+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:00:48.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'ff847343-e90f-443f-84b1-3c45e84ba154', NULL, '{}', NULL, false, false),
	('275d97a0-d7b1-446b-90d9-b066d4302a33', 'application-documents', '25/cv-1791964888160.docx', NULL, '2026-10-14 08:01:30.63239+00', '2026-10-14 08:01:30.63239+00', '2026-10-14 08:01:30.63239+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:01:31.000Z", "contentLength": 15717, "httpStatusCode": 200}', '59483924-912a-4e9f-a1dd-4a0ba40e7c21', NULL, '{}', NULL, false, false),
	('ce58f9a2-7d5a-4ebd-a7b8-b078763e4fc7', 'application-documents', '25/cover-letter-1791964888733.docx', NULL, '2026-10-14 08:01:31.059423+00', '2026-10-14 08:01:31.059423+00', '2026-10-14 08:01:31.059423+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:01:32.000Z", "contentLength": 15717, "httpStatusCode": 200}', 'b3cc4e6e-5435-4999-ac81-a4b5b0582677', NULL, '{}', NULL, false, false),
	('4f7c2ba7-a92d-4ec3-87df-95fdde7e8515', 'application-documents', '25/photo-1791964889089.jpg', NULL, '2026-10-14 08:01:32.942432+00', '2026-10-14 08:01:32.942432+00', '2026-10-14 08:01:32.942432+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:01:33.000Z", "contentLength": 371071, "httpStatusCode": 200}', '3db0d19f-6331-4105-9b1a-a8ca8cc37db1', NULL, '{}', NULL, false, false),
	('094ef228-a9ac-4478-a3fc-892079d28874', 'application-documents', '25/ktp-1791964891005.jpg', NULL, '2026-10-14 08:01:34.765422+00', '2026-10-14 08:01:34.765422+00', '2026-10-14 08:01:34.765422+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:01:35.000Z", "contentLength": 371071, "httpStatusCode": 200}', '96240c2f-e6c4-4acc-9851-6f36170fb47d', NULL, '{}', NULL, false, false),
	('e03edac0-7e25-4236-820f-8985250dbf4c', 'application-documents', '25/skck-1791964892781.png', NULL, '2026-10-14 08:01:35.355159+00', '2026-10-14 08:01:35.355159+00', '2026-10-14 08:01:35.355159+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:01:36.000Z", "contentLength": 82172, "httpStatusCode": 200}', '70ce8e7b-cf11-41cd-a0a7-4a996fa1b318', NULL, '{}', NULL, false, false),
	('e4b016fa-3d04-4e3c-b8b3-c23818f18496', 'application-documents', '25/health-certificate-1791964893427.jpg', NULL, '2026-10-14 08:01:37.032987+00', '2026-10-14 08:01:37.032987+00', '2026-10-14 08:01:37.032987+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:01:37.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'a63ba44d-4f09-43fa-9599-e744944c5226', NULL, '{}', NULL, false, false),
	('4a46e5a4-646d-40e9-b53c-5afbb442e988', 'application-documents', '25/work-experience-1791964895064.docx', NULL, '2026-10-14 08:01:37.378275+00', '2026-10-14 08:01:37.378275+00', '2026-10-14 08:01:37.378275+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:01:38.000Z", "contentLength": 15717, "httpStatusCode": 200}', '04180d4d-3d13-4503-b075-468dd5df302e', NULL, '{}', NULL, false, false),
	('dc75d235-2d7c-4eb5-a3d8-22349556f878', 'application-documents', '25/ijazah-1791964895445.jpg', NULL, '2026-10-14 08:01:39.216675+00', '2026-10-14 08:01:39.216675+00', '2026-10-14 08:01:39.216675+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-14T08:01:40.000Z", "contentLength": 371071, "httpStatusCode": 200}', 'f8303423-ee6b-40b2-aab2-bbba74acbe8a', NULL, '{}', NULL, false, false),
	('9dceea4b-7594-43d6-b2b9-4c8baa51b145', 'application-documents', '26/cv-1792028535607.docx', NULL, '2026-10-15 01:42:19.550731+00', '2026-10-15 01:42:19.550731+00', '2026-10-15 01:42:19.550731+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-15T01:42:20.000Z", "contentLength": 15717, "httpStatusCode": 200}', '62396abf-8458-4806-91bf-0fb1f48f554d', NULL, '{}', NULL, false, false),
	('4cba9fe6-1b5c-4008-822c-da247a2f8e68', 'application-documents', '26/cover-letter-1792028536105.docx', NULL, '2026-10-15 01:42:19.955445+00', '2026-10-15 01:42:19.955445+00', '2026-10-15 01:42:19.955445+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-15T01:42:20.000Z", "contentLength": 15717, "httpStatusCode": 200}', '568e9538-9c74-4f2e-86df-b9d3a66fa1cb', NULL, '{}', NULL, false, false),
	('e99d8c48-a0b8-4704-a746-7610c5c5ad7a', 'application-documents', '26/photo-1792028536465.jpg', NULL, '2026-10-15 01:42:23.671733+00', '2026-10-15 01:42:23.671733+00', '2026-10-15 01:42:23.671733+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-15T01:42:24.000Z", "contentLength": 371071, "httpStatusCode": 200}', '8ec8c533-2ce1-4370-a4f0-f74d242279da', NULL, '{}', NULL, false, false),
	('a015e66a-5899-423a-8966-c0abb3d7be00', 'application-documents', '26/ktp-1792028540247.png', NULL, '2026-10-15 01:42:24.706323+00', '2026-10-15 01:42:24.706323+00', '2026-10-15 01:42:24.706323+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-15T01:42:25.000Z", "contentLength": 82172, "httpStatusCode": 200}', 'bc1e001f-1d66-4d55-8262-b250b1bac605', NULL, '{}', NULL, false, false),
	('9abd57ca-63f4-42a7-9f8e-83369f9b07a6', 'application-documents', '26/skck-1792028541244.png', NULL, '2026-10-15 01:42:25.601269+00', '2026-10-15 01:42:25.601269+00', '2026-10-15 01:42:25.601269+00', '{"eTag": "\"d95cdf3c5e10e2cca190c1a83197a692\"", "size": 82172, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-10-15T01:42:26.000Z", "contentLength": 82172, "httpStatusCode": 200}', '3c6f539c-b0af-4b97-b553-3b62ee621898', NULL, '{}', NULL, false, false),
	('aeead65a-6960-4739-a405-30e6a1129505', 'application-documents', '26/health-certificate-1792028542109.jpg', NULL, '2026-10-15 01:42:30.235261+00', '2026-10-15 01:42:30.235261+00', '2026-10-15 01:42:30.235261+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-15T01:42:31.000Z", "contentLength": 371071, "httpStatusCode": 200}', '967e6750-d7fe-44fb-b48b-166b59e686ef', NULL, '{}', NULL, false, false),
	('71d6b596-3f64-4095-bf1c-6cc94cd0b951', 'application-documents', '26/work-experience-1792028546756.docx', NULL, '2026-10-15 01:42:31.029001+00', '2026-10-15 01:42:31.029001+00', '2026-10-15 01:42:31.029001+00', '{"eTag": "\"24bfe0453677490d3dbd76a841f5365a\"", "size": 15717, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-10-15T01:42:31.000Z", "contentLength": 15717, "httpStatusCode": 200}', '8e03177c-dff2-49a5-8902-1e8bc163e9b8', NULL, '{}', NULL, false, false),
	('cdde315a-15fe-4bfa-8f56-827fab9cfe8a', 'application-documents', '26/ijazah-1792028547551.jpg', NULL, '2026-10-15 01:42:37.648773+00', '2026-10-15 01:42:37.648773+00', '2026-10-15 01:42:37.648773+00', '{"eTag": "\"f2991892caf9ea88c1c41faf5ffff0f8\"", "size": 371071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-10-15T01:42:38.000Z", "contentLength": 371071, "httpStatusCode": 200}', '53fe0ad0-e3ef-46a9-995a-e1674daab265', NULL, '{}', NULL, false, false);


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: applicants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."applicants_id_seq"', 26, true);


--
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."applications_id_seq"', 20, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."jobs_id_seq"', 15, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict PGjB1xqVH6jKpXuIoigNpOEWFT3HKtLMQlu9vhomAxZ8iSifLOWZc2Vzg287HEy

RESET ALL;
