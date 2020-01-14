<template>
    <v-row>
        <v-col style="margin-top: 60px;">
             <v-card class="mx-auto" style="padding-bottom: 30px;padding-left: 50px"  outlined>
                <v-row align-content="center" class="align-center" style="margin-left: 30px;margin-top: 10px;margin-bottom: 10px">
                    <v-avatar size="150">
                        <img :src="this.$store.state.picurl"/>
                    </v-avatar>
                    <div class="hello">晚上好，{{this.$store.state.account}}</div>
                </v-row>
                <v-list-item style="">
                    <v-list-item-content width="100px">
                        <v-list-item-subtitle class="subtitle-1" style="text-align: left;">
                            <v-avatar>
                                <v-icon>mdi-school</v-icon>
                            </v-avatar>Beihang University
                        </v-list-item-subtitle>
                        <v-list-item-subtitle class="subtitle-1" style="text-align: left;">
                            <v-avatar>
                                <v-icon>mdi-account</v-icon>
                            </v-avatar>Prof. , Institute of Softeware Chinese Academy of Science
                        </v-list-item-subtitle>
                        <v-list-item-subtitle style="text-align: left;" v-if="proID">
                            <v-avatar>
                                <v-icon v-if="proID"style="color: #18ff64">mdi-checkbox-marked-circle</v-icon>
                            </v-avatar>认证通过
                        </v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item >
                 <div style="width: 100%; text-align: left; margin-left: 30px;margin-top: -20px">
                     <v-btn
                             large
                             color="primary"
                             style="margin: auto; width: 150px; height: 40px; margin-top: 10px;"
                             to="Identification"
                             v-if="proID"
                     >修改账号认证</v-btn>
                     <v-btn
                             large
                             color="primary"
                             style="margin: auto; width: 150px; height: 40px; margin-top: 10px;"
                             to="Identification"
                             v-if="!proID"
                     >专家申请</v-btn>
                 </div>
                 <div style="font-size: 40px;margin-left: 20px;margin-top: 40px">
                     账号安全
                 </div>
                 <v-divider class="mx-4" width="500px"></v-divider>
                <v-card-action >
                    <div style="width: 100%; text-align: left; margin-top: 10px;margin-left: 20px">
                        <v-btn
                                class="ma-2"
                                color="grey"
                                style="margin: auto; width: 150px; height: 40px; margin-top: 10px; margin-bottom: 20px;color: white;"
                        >绑定邮箱【未绑定】</v-btn>&nbsp
                        <v-btn
                                class="ma-2"
                                color="primary"
                                style="margin: auto; width: 150px; height: 40px; margin-top: 10px; margin-bottom: 20px;color: white;"
                        >绑定手机【已绑定】</v-btn>
                        <v-btn
                                class="ma-2"
                                color="primary"
                                style="margin: auto; width: 150px; height: 40px; margin-top: 10px; margin-bottom: 20px"
                                to = "changeinfo"
                        >修改账号信息</v-btn>
                 </div>
                </v-card-action>

            </v-card>
        </v-col>
    </v-row>
</template>

<script>
    import NavBar from "../components/NavBar";
    export default {

        name: "aaa",
        components: {NavBar},
        data () {
            return {
                subscribe: 'Prof. , Institute of Softeware Chinese Academy of Science',
                proID: 0 ,
            }
        },
        mounted() {
            console.log("user,token:",this.$store.state.token)
            //this.$store.dispatch('changetoken',localStorage.getItem('token'))
            //this.$store.dispatch('changelogined',localStorage.getItem('logined'))
            console.log("load ls:",this.$store.state.token)
            console.log()
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
                this.subscribe = body.data.data.subscribe
                this.proID = body.data.data.ProID
            })
        }
    };
</script>

<style scoped>
    .hello {
        font-size: 30px;
        color: gray;
        margin-top: 15px;
        margin-left: 20px;
        margin-bottom: -10px;
    }
</style>
