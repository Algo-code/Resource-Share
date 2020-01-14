import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
      baseurl: 'http://49.233.42.108:8080/',
      baseurl_es : 'http://49.233.42.108:9200/',
      username: '',
      password: '',
      re_password: '',
      phoneNumber: '',
      verificationCode: '',
      true_verificationCode: 0,
      isgt: 'false',
      verify: 'false',
      logined: false,
      token: '',
      keyword: '',
      picurl :'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576648015327&di=d9d493095522c7f39f335a6237b46345&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Feda2ab968c9926f766c758bc04f98c5c5dc91a508af0-s4SKpZ_fw236',
      account: 'Ishigawa Naomi',
  },
  mutations: {
      clear () {
          this.state.password = ''
          this.state.re_password = ''
      },
      handleUsername (state, newVal) {
          state.username = newVal
      },
      handlePassword (state, newVal) {
          state.password = newVal
      },
      handleRePassword (state, newVal) {
          state.re_password = newVal
      },
      handlePhoneNumber (state, newVal) {
          state.phoneNumber = newVal
      },
      handleVerificationCode (state, newVal) {
          state.verificationCode = newVal
      },
      handleisgt (state) {
          state.isgt = true
      },
      handleverify (state) {
          state.verify = true
      },
      handleKeyword (state, keyword) {
          state.keyword = keyword
      },
      handletoken (state, token) {
          state.token = token
      },
      handlelogined (state, logined) {
          state.logined = logined
      },
      logined () {
          this.state.logined = true
      },
  },
  actions: {
      changetoken (context, token) {
          context.commit('handletoken', token)
      },
      changelogined (context, logined) {
          context.commit('handlelogined', logined)
      },
  },
  modules: {
  }
})
