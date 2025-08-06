import { createRouter, createWebHistory } from 'vue-router'
import { useSessionStore } from '@/stores/session'
import * as Auth from '@/utils/auth'

import HomeView from '@/views/HomeView.vue'
import AboutView from '@/views/AboutView.vue'
import ContactsView from '@/views/ContactsView.vue'
import NewPackageView from '@/views/NewPackageView.vue'
import ProfileView from '@/views/ProfileView.vue'
import WhoView from '@/views/WhoView.vue'
import LoginView from '@/views/LoginView.vue'
import SignupView from '@/views/SignupView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/about',
      name: 'about',
      component: AboutView,
    },
    {
      path: '/contacts',
      name: 'contacts',
      component: ContactsView,
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView,
    },
    {
      path: '/newPackage',
      name: 'newPackage',
      component: NewPackageView,
    },
    {
      path: '/profile',
      name: 'profile',
      component: ProfileView,
    },
    {
      path: '/who',
      name: 'who',
      component: WhoView,
    },
    {
      path: '/signup',
      name: 'signup',
      component: SignupView,
    }
  ],
});

router.beforeEach(async (to, from, next) => {
  const sessionStore = useSessionStore();
  if(to.matched.some(record => record.meta.requiresAuth)){
    const userId = sessionStore.getUser();
    const data = await Auth.isLogged();
    if(userId === null || userId !== data.userId){
      next({
        path: '/login',
        query: {redirect: to.fullPath}
      });
    } else {
      next();
    }
  } else { 
    next();
  }
})

export default router
