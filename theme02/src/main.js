import Vue from 'vue'
import App from './App.vue'

import router from "./router";

import VueMaterial from 'vue-material' 
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import Vuesax from 'vuesax'

import { library } from '@fortawesome/fontawesome-svg-core'
import { faChartLine, faClock } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
library.add(faChartLine, faClock)


Vue.config.productionTip = false

import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'vuesax/dist/vuesax.css'

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.use(VueMaterial)
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
Vue.use(Vuesax, {
  // options here
})
new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
