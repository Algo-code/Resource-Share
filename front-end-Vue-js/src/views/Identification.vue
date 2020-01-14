<template>
    <v-row>
        <v-col >
            <v-card class="mx-auto"  outlined style="text-align: center;width: 1000px;height: 700px">
                <v-row>
                <div style="text-align: left" >
                        <div class="left">专家主页申请</div>
                </div>
                <div class="right" >
                    <v-btn
                            class="ma-2"
                            color="primary"
                            style="margin: auto; width: 150px; height: 30px; margin-top: 10px; margin-bottom: 20px"
                            v-on:click="apply"
                    >提交</v-btn>
                </div>
                </v-row>
                <v-divider class="mx-4" style="margin-top: 30px"></v-divider>
                <v-row >
                    <div class="title">
                        <div style="font-size: 30px">真实姓名：</div>
                    </div>
                    <div style="height: 0px;margin-top: 30px">
                    <v-text-field
                            label="输入真实姓名"
                            filled
                            background-color="#eee"
                            style="opacity: 0.8;width: 300px "
                            v-model="realname"
                    ></v-text-field>
                    </div>
                </v-row>
                <v-row >
                    <div class="title">
                        <div style="font-size: 30px">就职经历：</div>
                    </div>
                    <div style="height: 0px;margin-top: 30px">
                        <v-text-field
                                label="输入就职单位-职位-日期，如[ 北京航空航天大学 - 教授 - 2017~2019 ]，多条以换行区分"
                                filled
                                background-color="#eee"
                                style="opacity: 0.8;width: 740px "
                                v-model="workexp"
                        ></v-text-field>
                    </div>
                </v-row>
                <v-row >
                    <div class="title">
                        <div style="font-size: 30px">教育经历：</div>
                    </div>
                    <div style="height: 0px;margin-top: 30px">
                        <v-text-field
                                label="输入学校-学位-日期，如[ 北京航空航天大学 - 本科 - 2013~2017 ]，多条以换行区分"
                                filled
                                background-color="#eee"
                                style="opacity: 0.8;width: 740px "
                                v-model="eduexp"
                        ></v-text-field>
                    </div>
                </v-row>
                <v-row >
                    <div class="title">
                        <div style="font-size: 30px">个人经历：</div>
                    </div>
                </v-row>
                <v-row>
                    <div style="margin-left: 60px;margin-top: 30px;width:900px">
                        <v-textarea
                                label="输入个人简介，不超过200字"
                                counter
                                maxlength="200"
                                full-width
                                v-model="profile"
                        ></v-textarea>
                    </div>
                </v-row>
                <v-row >
                    <div class="title">
                        <div style="font-size: 30px;margin-top: -30px">联系方式：</div>
                    </div>
                    <div style="height: 0px;margin-top: 10px">
                    <v-text-field
                            label="输入联系方式，多条以换行区分"
                            filled
                            background-color="#eee"
                            style="opacity: 0.8;width: 300px "
                            v-model="contact"
                    ></v-text-field>
                    </div>
                </v-row>
            </v-card>
        </v-col>
    </v-row>
</template>

<script>
    import NavBar from "../components/NavBar";
    export default {
        name: "Identification",
        mounted(){
        },
        components: {
            NavBar
        },
        data () {
            return{
                realname: '',
                workexp: '',
                eduexp: '',
                profile: '',
                contact: ''
            }
        },
        props:{
            applytype:{
                default: 'apply'
            }
        },
        methods: {
            apply: function(){
                alert("申请成功！");
                this.$router.push('/user')
                var that = this
                this.axios({
                    method: 'post',
                    url: this.$store.state.baseurl+'/api/apply',
                    headers: {
                        token: that.$store.state.token
                    },
                    data: {
                        applytype: this.applytype,
                        realname: this.realname,
                        workexp: this.workexp,
                        eduexp: this.eduexp,
                        profile: this.profile,
                        contact: this.contact
                    },
                    crossDomain: true
                }).then(body => {
                    console.log('realname', that.realname)
                    console.log('token', that.$store.state.token)
                    console.log("kkkkkkkkkkkkkkkk", body.data)
                })
            }
        }
    }
</script>

<style scoped>
    .left {
        font-size: 40px;
        color: gray;
        margin-top: 50px;
        margin-left: 60px;
        margin-bottom: -10px;
    }
    .right {
         font-size: 40px;
         color: gray;
         font-weight: bold;
         margin-top: 50px;
         margin-left:500px;
         margin-bottom: -10px;
     }
    .title {
        width: 200px;
        font-size: 60px;
        color: black;
        font-weight: bold;
        margin-top: 50px;
        margin-left:40px;
        margin-bottom: -10px;
    }
</style>
