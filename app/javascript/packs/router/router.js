import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import Mycoorde from '../components/mycoorde.vue'
import About from '../components/about.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/mycoorde', component: Mycoorde },
    { path: '/about', component: About }
  ]
})
