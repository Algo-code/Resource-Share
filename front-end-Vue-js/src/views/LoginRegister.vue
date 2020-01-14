<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
    <div class="scope_home">
        <BackGroundPic/>
        <v-row no-gutters class="login-regist-container">
            <v-col cols="7">
                <img src="../img/full-logo.png" class="logo-left">
            </v-col>
            <v-col cols="5" class="right-content">
                <form @submit.prevent="login">
                    <p class="b-text"></p>
                    <div v-if="!this.$store.state.logined">
                        <v-text-field
                                v-model="username"
                                label="用户名"
                                filled
                                background-color="#eee"
                                style="opacity: 0.8"
                                class="username"></v-text-field>

                        <v-text-field
                                :value="password"
                                v-model="password"
                                label="密码"
                                type="Password"
                                filled
                                background-color="#eee"
                                style="opacity: 0.8"
                        ></v-text-field>

                        <v-text-field
                                :value="re_password"
                                v-if="register"
                                v-model="re_password"
                                label="重新输入密码"
                                type="Password"
                                filled
                                background-color="#eee"
                                style="opacity: 0.8"
                        ></v-text-field>
                        <v-text-field
                                v-if="register"
                                v-model="phoneNumber"
                                label="请输入您的手机号码"
                                filled
                                background-color="#eee"
                                style="opacity: 0.8"
                        ></v-text-field>
                        <Geet :isGeet="this.$store.state.isgt" @geetPath="GeetPath" @clickChange="GeetChange"></Geet>
                        <v-row>
                            <v-col cols="6">
                                <v-text-field
                                        v-if="register"
                                        v-model="verificationCode"
                                        label="验证码"
                                        filled
                                        background-color="#eee"
                                        style="width:160px ;height: 60px;opacity: 0.8"
                                ></v-text-field>
                            </v-col>
                            <v-col col="6">
                                <v-btn style="height: 60px" v-if="register" v-show="show" v-on:click="getCode" block
                                       color="secondary" dark>获取验证码
                                </v-btn>
                                <v-btn style="height: 60px" v-show="!show" class="count" block color="secondary" dark>
                                    {{count}} s
                                </v-btn>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols="12">
                                <v-btn v-on:click="login" block color="secondary" dark v-if="!register">登录/注册</v-btn>
                                <v-btn v-on:click="login" block color="secondary" dark v-if="register">注册</v-btn>
                                <v-tooltip v-model="password_wrong_show" bottom color="red lighten-2"
                                           style="margin-left: 200px">
                                    <template v-slot:activator="{ on }">
                                        <v-icon color="gray lighten-1">mdi-shopping_cart</v-icon>
                                    </template>
                                    <span>{{error_img}}</span>
                                </v-tooltip>
                            </v-col>
                        </v-row>
                    </div>
                </form>

            </v-col>
        </v-row>

    </div>
</template>

<script>
    import Gtpage from '../components/GtPage'
    import Geet from '../components/Geet'
    import BackGroundPic from '../components/BackGroundPic'

    export default {
        data() {
            return {
                avatar_prefix: 'http://114.115.151.96:8666/ProfilePicture/UserAccount/',
                user_img: '',
                team_img: '',
                show: true,
                count: '',
                timer: null,
                error_img: '',
                password_wrong_show: false,
                info: '',
                height: '560px',
                width: '310px',
                register: false,
                success: false,
                topics: [
                    {},
                    {},
                    {},
                    {},
                    {}
                ]
            }
        },
        components: {
            Geet,
            Gtpage,
            BackGroundPic
        },
        mounted() {
        },
        methods: {
            getCode() {
                const TIME_COUNT = 60
                if (!this.timer) {
                    this.axios({
                        method: 'post',
                        url: this.$store.state.baseurl + 'api/very/send',
                        data: {
                            phone: this.$store.state.phoneNumber
                        },
                        crossDomain: true
                    }).then(body => {
                        console.log(body.data)
                        this.info = body
                        // 错误信息
                        if (this.info.data.code !== 1) {
                            console.log(this.info.data)
                            var that = this
                            this.password_wrong_show = true
                            this.error_img = 'request fail!'
                            setTimeout(function () {
                                that.password_wrong_show = false
                            }, 2000)
                        }
                    })
                    this.count = TIME_COUNT;
                    this.show = false;
                    this.timer = setInterval(() => {
                        if (this.count > 0 && this.count <= TIME_COUNT) {
                            this.count--;
                        } else {
                            this.show = true;
                            clearInterval(this.timer);
                            this.timer = null;
                        }
                    }, 1000)
                }
            },
            // 极验图片加载之后，通过更改控制变量实现可以再次加载
            GeetChange(val) {
                this.$store.state.isgt = val;
            },
            GeetPath(val) {
                console.log("4,接受到图形验证参数，将参数发往服务端进行验证");
                console.log(val);
                this.$store.state.isgt = false;
            },
            unshow() {
                this.password_wrong_show = false
            },
            login() {
                // 未输入账号
                if (this.$store.state.username === '') {
                    this.password_wrong_show = true
                    var that = this
                    this.error_img = '请输入账号'
                    setTimeout(function () {
                        that.password_wrong_show = false
                        that.$forceUpdate()
                    }, 2000)
                    this.$store.commit('clear')
                } else {
                    // 未处于注册态,进行登录
                    if (this.register === false) {
                        if (this.$store.state.verify === 'false') {
                            this.$store.commit('handleisgt')
                        }
                        this.axios({
                            method: 'post',
                            url: this.$store.state.baseurl+'api/user/login',
                            data: {
                                account: this.$store.state.username,
                                password: this.$store.state.password
                            },
                            crossDomain: true
                        }).then(body => {
                            this.info = body
                            // 用户不存在
                            console.log("userlogin:", this.info.data)
                            if (this.info.data.code === 108 && this.$store.state.verify === true) {
                                this.register = true
                            }
                            // 密码错误
                            else if (this.info.data.code === 106) {
                                this.password_wrong_show = true
                                var that = this
                                this.error_img = '密码错误'
                                setTimeout(function () {
                                    that.password_wrong_show = false
                                    that.$forceUpdate()
                                }, 2000)
                                this.$store.commit('clear')
                            }
                            // 登录成功
                            else {
                                if (this.$store.state.verify === true) {
                                    this.$store.commit('logined')
                                    //this.$store.dispatch('changeAC', this.info.data.user.account)
                                    //console.log('1111111111')
                                    this.$store.dispatch('changetoken', this.info.data.data[0])
                                    //this.$store.state.logined()
                                  localStorage.setItem('token',this.info.data.data[0])
                                  localStorage.setItem('logined',true)
                                  console.log("lS:",localStorage.getItem('token'))
                                    console.log(this.$store.state.token)
                                    console.log("admin:", this.info.data.data[1])
                                    if (this.info.data.data[1] == "admin")
                                        this.$router.push({path: '/bkm'})
                                    else {
                                        this.$router.push({path: '/user'})
                                    }

                                } else {
                                    this.password_wrong_show = true
                                    var that = this
                                    this.error_img = '滑动认证未通过'
                                    setTimeout(function () {
                                        that.password_wrong_show = false
                                        that.$forceUpdate()
                                    }, 2000)
                                }
                            }
                        })
                    }
                    // 处于注册态
                    else {
                        this.axios({
                            method: 'post',
                            url: this.$store.state.baseurl + 'api/very/check',
                            data: {
                                phone: this.$store.state.phoneNumber,
                                code: this.$store.state.verificationCode
                            },
                            crossDomain: true
                        }).then(body => {
                            this.$store.state.true_verificationCode = this.info.data.code;
                        })
                        // 两次密码输入不相同
                        if (this.$store.state.re_password !== this.$store.state.password) {
                            this.error_img = '两次密码不相同'
                            this.password_wrong_show = true
                            var that = this
                            setTimeout(function () {
                                that.password_wrong_show = false
                                that.$forceUpdate()
                            }, 2000)
                            this.$store.commit('clear')
                        }
                        // 验证码错误
                        else if (this.$store.state.true_verificationCode !== 1) {
                            var that = this
                            //this.password_wrong_show = true
                            //this.error_img = 'Wrong Verification Code!'
                            //setTimeout(function () {
                            //    that.password_wrong_show = false
                            //}, 2000)
                        }
                        // 注册
                        else {
                            this.axios({
                                method: 'post',
                                url: this.$store.state.baseurl + 'api/user/register',
                                data: {
                                    account: this.$store.state.username,
                                    password: this.$store.state.password,
                                    phone: this.$store.state.phoneNumber
                                },
                                crossDomain: true
                            }).then(body => {
                                this.info = body
                                if (this.info.data.code === 1) {
                                    //console.log('register', this.$store.state.account)
                                    //this.$store.commit('logined')
                                    //this.$store.dispatch('changeAC', this.$store.state.username)
                                    this.register=false
                                    this.$router.push({path: '/login'})
                                } else {
                                    console.log(this.info.data)
                                    this.error_img = '注册失败'
                                    this.password_wrong_show = true
                                    var that = this
                                    setTimeout(function () {
                                        that.password_wrong_show = false
                                        that.$forceUpdate()
                                    }, 2000)
                                }
                            })
                        }
                    }
                }
            }
        },
        computed: {
            username: {
                get() {
                    return this.$store.state.username
                },
                set(newVal) {
                    this.$store.commit('handleUsername', newVal)
                }
            },
            password: {
                get() {
                    return this.$store.state.password
                },
                set(newVal) {
                    this.$store.commit('handlePassword', newVal)
                }
            },
            re_password: {
                get() {
                    return this.$store.state.re_password
                },
                set(newVal) {
                    this.$store.commit('handleRePassword', newVal)
                }
            },
            phoneNumber: {
                get() {
                    return this.$store.state.phoneNumber
                },
                set(newVal) {
                    this.$store.commit('handlePhoneNumber', newVal)
                }
            },
            verificationCode: {
                get() {
                    return this.$store.state.verificationCode
                },
                set(newVal) {
                    this.$store.commit('handleVerificationCode', newVal)
                }
            }
        }
    }
</script>

<style scoped>
    .hot-content {
        width: 85%;
    }

    .right-content {
        display: -webkit-box;
        -webkit-box-align: center; /* 垂直居中 */
        -webkit-box-pack: center; /* 水平居中 */
    }

    .logo-left {
        margin-left: 80px;
        -webkit-box-align: center; /* 垂直居中 */
        width: 80%
    }

    .b-text {
        width: 396px;
        height: 101px;
        color: rgba(0, 0, 0, 1);
        font-size: 36px;
        font-family: "Microsoft YaHei" ! important;
    }

    .username {
        margin-top: -50px;
    }

    .login-regist-container {
        margin-top: -100vh;
        z-index: 2;
        position: relative;
        background: transparent;
    }
</style>
