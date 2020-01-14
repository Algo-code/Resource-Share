<template>
    <div class="notice-container">
        <v-row class="page-title">
            <div >
                我的收藏
            </div>
        </v-row>
        <v-divider style="margin: 10px 0 40px 0"></v-divider>
            <LiteratureCard :liter_id="data.ID" :liter_title="data.Title" :liter_date="data.SubmitTime"
                            :ref_num="data.ReferenceNum" :liter_author="data.Realnames.split(',')"
                            :liter_institution="data.Affiliation" style="margin-top: 20px;" v-for="(data, index) in favs"
                            :key="index"/>
        <div style="height: 100px"></div>
    </div>
</template>

<script>
    import LiteratureCard from "../components/LiteratureCard"
    export default {
        name: "UserNotice",
        mounted(){
          const that = this
            this.axios({
                method: 'post',
                url: this.$store.state.baseurl+'/api/user/getMyInfo',
                headers: {
                    token: this.$store.state.token
                },
                crossDomain: true
            }).then(body => {
              console.log(body)
              const subs = body.data.data.subscribe
              const url= that.$store.state.baseurl+'api/paper/getPaper'
              let res = new Array();
              for (let i = 0; i < subs.length; i++) {
                console.log("hello")
                console.log(subs[i])
                that.axios.post(url, {
                  id: subs[i]
                })
                  .then(function (response) {
                    // console.log('returned')
                    console.log("I am here")
                    let d = response.data.data
                    d.Realnames = ""
                    for (let j = 0; j<d.experts.length; j++){
                      d.Realnames = d.Realnames + d.experts[j].Realname + ','
                    }
                    res.push(d)
                    that.favs=res
                    console.log(that.favs)
                  })
                  .catch(function (error) {
                    console.log(error)
                  })
              }

            })
        },
        components:{
            LiteratureCard
        },
        data () {
            return {
                favs:[],
                msg_num: 4 ,
                results:[
                    {
                        msg_id: 1,
                    },
                    {
                        msg_id: 2,
                    },
                    {
                        msg_id: 3,
                    },
                    {
                        msg_id: 4,
                    },
                    {
                        msg_id: 5,
                    },
                    {
                        msg_id: 6,
                    }

                ]
            }
        }
    }
</script>

<style scoped>
    .notice-container{
        background: white;
        margin: 0 320px 0 320px;
        padding-top: 50px;
        padding-left: 70px;
        padding-right: 70px;
    }
    .page-title{
        font-size: 44px;
        margin-bottom: 40px;
    }

    .apl-num{
        font-size: 24px;
        color: #07AAF4;
        margin-left: 25px;
        margin-top: 20px;
    }
</style>
