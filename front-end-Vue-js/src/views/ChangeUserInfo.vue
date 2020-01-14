<template>
    <v-row>
        <v-col >
            <v-card class="mx-auto"  outlined style="text-align: center;width: 1000px;height: 800px">
                <v-row>
                    <div style="text-align: left" >
                            <div class="left">个人信息修改</div>
                    </div>
                </v-row>
                <v-divider class="mx-4" style="margin-top: 30px"></v-divider>
                <v-row style="margin-top: 10px" justify="center">
                    <v-col cols="2" class="title">
                        <div style="font-size: 20px">修改用户名：</div>
                    </v-col>
                    <v-col cols="4">
                        <v-text-field
                                label="输入新用户名"
                                filled
                                background-color="#eee"
                                style="opacity: 0.8;width: 300px "
                                v-model="newid"
                        ></v-text-field>
                        <v-alert type="error" v-if="emptyname">
                            请输入新用户名
                        </v-alert>
                        <v-alert type="success" v-if="commitname">
                            修改成功
                        </v-alert>
                    </v-col>

                    <v-col cols="2"></v-col>
                    <v-col>
                        <v-btn
                                class="ma-2"
                                color="primary"
                                style="height: 50px; width: 100px"
                                v-on:click="applynewid"
                        >提交</v-btn>
                    </v-col>
                </v-row>
                <v-divider class="mx-4" style="margin-top: 30px"></v-divider>
                <v-row style="margin-top: 10px" justify="center">
                    <v-col cols="2" class="title">
                        <div style="font-size: 20px">修改头像：</div>
                    </v-col>
                    <v-col cols="4">
                        <input class="file" name="file" type="file" accept="image/png,image/gif,image/jpeg" @change="update"/>
                    </v-col>
                    <v-col cols="2"></v-col>
                    <v-col>
                        <v-btn
                                class="ma-2"
                                color="primary"
                                style="height: 50px; width: 100px"
                                v-on:click="applypic"
                        >提交</v-btn>
                    </v-col>
                </v-row>
                <v-divider class="mx-4" style="margin-top: 30px"></v-divider>
                <v-row style="margin-top: 10px" justify="center">
                    <v-col cols="2" class="title">
                        <div style="font-size: 20px">修改密码：</div>
                    </v-col>
                    <v-col cols="5">
                        <v-row>
                            <v-text-field
                                    label="输入旧密码"
                                    filled
                                    background-color="#eee"
                                    type="password"
                                    style="opacity: 0.8;width: 300px "
                                    v-model="oldpw"
                            ></v-text-field>
                        </v-row>
                        <v-row>
                            <v-text-field
                                    label="输入新密码"
                                    filled
                                    background-color="#eee"
                                    type="password"
                                    style="opacity: 0.8;width: 300px "
                                    v-model="newpw"
                            ></v-text-field>
                        </v-row>
                        <v-row>
                            <v-text-field
                                    label="重复新密码"
                                    filled
                                    background-color="#eee"
                                    type="password"
                                    style="opacity: 0.8;width: 300px "
                                    v-model="reppw"
                            ></v-text-field>
                        </v-row>
                        <v-alert type="error" v-if="emptypw">
                            请输入密码
                        </v-alert>
                        <v-alert type="error" v-if="notsame">
                            密码输入不一致
                        </v-alert>
                        <v-alert type="success" v-if="commitpw">
                            修改成功
                        </v-alert>
                    </v-col>
                    <v-col cols="1"></v-col>
                    <v-col>
                        <v-btn
                                class="ma-2"
                                color="primary"
                                style="height: 50px; width: 100px"
                                v-on:click="applypw"
                        >提交</v-btn>
                    </v-col>
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
            this.$store.dispatch('changetoken',localStorage.getItem('token'))
        },
        components: {
            NavBar
        },
        data () {
            return{
                file:{},
                emptypw:false,
                commitpw:false,
                notsame:false,
                emptyname:false,
                commitname:false,
                newid:'',
                oldpw:'',
                newpw:'',
                reppw:'',
                tmppic: ''
            }
        },
        props:{
            applytype:{
                default: 'apply'
            }
        },
        methods: {

            update(e){
                this.file = e.target.files[0];
                console.log(this.file);

            },applypic: function(){
                event.preventDefault();
                let formData = new FormData()
                formData.append('file', this.file)
                let config = {
                    headers: {
                        token:localStorage.getItem('token'),
                        'Content-Type': 'multipart/form-data'
                    }
                }
                this.$http.post(this.$store.state.baseurl+'api/user/changePic', formData, config).then(function (response) {
                        console.log(response);
                })
            },

            applynewid: function(){
                if(this.newid.length==0)
                { this.emptyname=true
                    this.commitname=false
                }
                else{
                    this.commitname=true
                    this.emptyname=false
                    this.axios({
                        method: 'post',
                        url: this.$store.state.baseurl+'/api/user/changeUserInfo',
                        headers: {
                            token: this.$store.state.token
                        },
                        data: {
                            "nickname":this.newid,
                        },
                        crossDomain: true
                    }).then(body => {
                        console.log(body)
                    })
                }

            },applypw: function(){
                if(this.newid.length==0||this.reppw.length==0||this.oldpw.length==0)
                { this.emptypw=true
                    this.commitpw=false
                    this.notsame=false
                }
                else if(this.reppw!=this.newpw)
                {
                    this.notsame=true;
                    this.emptyname=false
                    this.commitpw=false
                }
                else{
                    this.commitpw=true
                    this.notsame=false
                    this.emptyname=false
                    this.axios({
                        method: 'post',
                        url: this.$store.state.baseurl+'/api/user/changePsw',
                        headers: {
                            token: this.$store.state.token
                        },
                        data: {
                            "oldpsw":this.oldpsw,
                            "newpsw":this.newpw
                        },
                        crossDomain: true
                    }).then(body => {
                        console.log(body)
                    })
                }
            },selectpic: function(event){

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
        margin-top: 20px;
        margin-left:40px;
    }
</style>
