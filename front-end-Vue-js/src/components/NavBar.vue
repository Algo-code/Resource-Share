<template>
    <div class="nav-container">
        <v-row>
            <v-col cols="3">
                <v-img
                        class="logo"
                        src="../img/IntPro.png"
                        @click="goHome()"
                >
                </v-img>
            </v-col>

            <v-col cols="6">
                <SearchField style="width: 1800px; margin-left: 80px" />
            </v-col>
            <v-col cols="3">
                <v-row v-if="$store.state.logined">
                    <v-col cols="2"></v-col>
                    <v-col cols="7">
                        <div class="say-hi" style="text-align: center; margin-top: -5px">晚上好, {{this.$store.state.account}}</div>
                    </v-col>
                    <v-col cols="3">
                        <div class="text-center">

                            <v-menu offset-y>
                                <template v-slot:activator="{ on }">
                                    <v-img
                                            :src = "getPlayUrl"
                                            class="avatar"
                                            size="10"
                                            v-on="on"
                                    >
                                    </v-img>
                                </template>

                                <v-list>
                                    <v-list-item
                                            v-for="(data, index) in items"
                                            :key="index"
                                            @click="goUserNotice(index)"
                                    >
                                        <v-list-item-title>{{ data.title }}</v-list-item-title>
                                    </v-list-item>
                                </v-list>
                            </v-menu>
                        </div>
                    </v-col>
                </v-row>
                <v-row v-else>
                    <v-btn big elevation="0" color="primary" class="mx-auto" @click="toLoginOrRegister()">登录/注册</v-btn>
                </v-row>
            </v-col>
        </v-row>
    </div>
</template>

<script>
    import SearchField from "./SearchField";
    export default {
        name: "NavBar",
        data() {
          return {
            items: [
              {
                title: '修改用户信息'
              },
              {
                title: '收藏夹'
              },
              {
                title: '我的'
              },
                {
                    title: '注销'
                }
            ]
          }
        },
      computed:{
        getPlayUrl(){
          return this.$store.state.picurl
        }
      },
        mounted(){
          console.log("user,token:",this.$store.state.token)
          this.$store.dispatch('changetoken',localStorage.getItem('token'))
          this.$store.dispatch('changelogined',localStorage.getItem('logined'))
          console.log("load ls:",this.$store.state.token)
          this.axios({
            method: 'post',
            url: this.$store.state.baseurl+'/api/user/getMyInfo',
            headers: {
              token: this.$store.state.token
            },
            crossDomain: true
          }).then(body => {
            console.log(body.data)
            this.$store.state.picurl = this.$store.state.baseurl+body.data.data.picUrl
            this.$store.state.account = body.data.data.account
          })
        },
        components: {
            SearchField
        },
        methods:{
          goHome: function () {
            this.$router.push('/')
          },
            logout: function(){
                this.$store.state.logined=false
                this.$store.state.token=undefined
                localStorage.removeItem("token")
                localStorage.setItem('logined',false)
            },
          goUserNotice: function (index) {
              if(index == 3) {
                  this.logout()
                  this.$router.push({path: '/login'})
              }
              else if(index == 2){
                  this.$router.push('/user')
              }
              else if(index == 1){
                  this.$router.push('/favorite')
              }
              else
                this.$router.push('/changeinfo')
          },
          toLoginOrRegister: function () {
            this.$router.push('/login')
          }
        }
    }
</script>

<style scoped>
    .logo{
        margin-left: 30px;
        width: 200px;
    }
    .nav-container{
        background-color: white;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .avatar{
        width: 50px;
        border-radius: 50%;
        display: inline;
        float: right;
        margin-right: 30px;
        margin-top: -15px;
        margin-bottom: -10px;
    }
    .say-hi{
        font-size: 17px;
        color: gray;
        margin-top: 10px;
        margin-left: 20px;
        margin-bottom: -10px;
    }
</style>
