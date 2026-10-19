import { createRouter, createWebHistory } from 'vue-router'
import { supabase } from '../lib/supabase'

// ==========================================
// APPLICANT PAGES
// ==========================================
import Home from '../views/applicant/Home.vue'
import OpenPositions from '../views/applicant/OpenPositions.vue'
import JobDetail from '../views/applicant/JobDetail.vue'
import ApplicationForm from '../views/applicant/ApplicationForm.vue'
import ThankYou from '../views/applicant/ThankYou.vue'

// ==========================================
// ADMIN PAGES
// ==========================================
import AdminLogin from '../views/admin/AdminLogin.vue'
import AdminOpenPositions from '../views/admin/AdminOpenPositions.vue'
import AdminAddPosition from '../views/admin/AdminAddPosition.vue'
import AdminEditPosition from '../views/admin/AdminEditPosition.vue'
import AdminApplicants from '../views/admin/AdminApplicants.vue'

// ==========================================
// ROUTER
// ==========================================
const router = createRouter({
  history: createWebHistory(),

  routes: [
    // PUBLIC APPLICANT PAGES
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/lowongan',
      name: 'lowongan',
      component: OpenPositions,
    },
    {
      path: '/lowongan/:id',
      name: 'job-detail',
      component: JobDetail,
    },
    {
      path: '/lamar/:id',
      name: 'application',
      component: ApplicationForm,
    },
    {
      path: '/thank-you',
      name: 'thank-you',
      component: ThankYou,
    },

    // ADMIN LOGIN - PUBLIC
    {
      path: '/admin/login',
      name: 'admin-login',
      component: AdminLogin,
    },

    // ADMIN - PROTECTED
    {
      path: '/admin/open-positions',
      name: 'admin-open-positions',
      component: AdminOpenPositions,
      meta: { requiresAdmin: true },
    },
    {
      path: '/admin/open-positions/add',
      name: 'admin-add-position',
      component: AdminAddPosition,
      meta: { requiresAdmin: true },
    },
    {
      path: '/admin/open-positions/edit/:id',
      name: 'admin-edit-position',
      component: AdminEditPosition,
      meta: { requiresAdmin: true },
    },
    {
      path: '/admin/applicants',
      name: 'admin-applicants',
      component: AdminApplicants,
      meta: { requiresAdmin: true },
    },
    {
      path: '/admin/applicants/:id',
      name: 'admin-applicant-detail',
      component: () => import('../views/admin/AdminApplicantDetail.vue'),
      meta: { requiresAdmin: true },
    },
  ],

  scrollBehavior() {
    return { top: 0 }
  },
})

// ==========================================
// ROUTE GUARD
// ==========================================
router.beforeEach(async (to) => {
  const requiresAdmin = to.matched.some((record) => record.meta.requiresAdmin)

  const {
    data: { session },
    error,
  } = await supabase.auth.getSession()

  if (error) {
    console.error('Failed to check authentication session:', error)

    if (requiresAdmin) {
      return {
        name: 'admin-login',
        query: { redirect: to.fullPath },
      }
    }
  }

  // Protect admin pages from users without a session.
  if (requiresAdmin && !session) {
    return {
      name: 'admin-login',
      query: { redirect: to.fullPath },
    }
  }

  // An already logged-in user does not need to visit login again.
  if (to.name === 'admin-login' && session) {
    return { name: 'admin-open-positions' }
  }

  return true
})

export default router
