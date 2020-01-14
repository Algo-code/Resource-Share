import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
import axios from 'axios'
import VueAxios from 'vue-axios'
// 导入极验
require('@/assets/gt.js');
// 绑定到原型
Vue.prototype.$initGeet=initGeetest;
Vue.config.productionTip = false
Vue.prototype.$saveAs = saveAs
Vue.use(VueAxios, axios)
new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
