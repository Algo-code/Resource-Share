<template>
    <div>
        <v-row>
            <v-col style="margin-left: 30px;" >
                <SearchClass style="margin-top: 20px;" v-on:listenToMyBoy="listenToMyBoy"/>
                <div v-if="!chooseUser">
                    <LiteratureCard :liter_id="data._source.P_ID" :liter_title="data._source.Title" :liter_date="data._source.SubmitTime"
                                    :ref_num="data._source.ReferenceNum" :liter_author="data._source.Realnames.split(',')"
                                    :liter_institution="data._source.Affiliation" style="margin-top: 20px;" v-for="(data, index) in results"
                                :key="index"/>
                </div>
                <div v-else >
                    <SpecialBar :Introduction="data._source.Introduction" :special_id="data._source.Id" :Realname="data._source.Realname" style="margin-top: 20px;" v-for="(data, index) in expert_results"
                                :key="index" />
                </div>
                <div class="text-center" STYLE="margin-top: 50px" v-if="!chooseUser">
                    <v-pagination
                            v-model="notuserpage"
                            :length= "notuserp_length"
                            :total-visible="12"
                    ></v-pagination>
                </div>
                <div class="text-center" STYLE="margin-top: 50px" v-else >
                    <v-pagination
                            v-model="userpage"
                            :length= "userp_length"
                            :total-visible="12"
                    ></v-pagination>
                </div>
            </v-col>

            <v-col style="width: 27%; margin-left: 10px" >

                <SearchHistory style="margin-top: 10px" v-if="this.$store.state.logined" :flag="flag"/>
                <SortSelect style="margin-top: 15px" v-on:listenToMyStepBoy="listenToMyStepBoy"/>
                <Classification :sort_option="keywords" :flag="111" style="margin-top: 15px"/>
                <RelatedExpert style="margin-top: 15px"/>
            </v-col>
        </v-row>
    </div>
</template>

<script>
    import HelloWorld from '../components/HelloWorld'
    import NavBar from "../components/NavBar"
    import SearchField from "../components/SearchField"
    import SearchClass from "../components/SearchClass"
    import LiteratureCard from "../components/LiteratureCard"
    import SearchHistory from "../components/SearchHistory"
    import SortSelect from "../components/SortSelect"
    import Classification from "../components/Classification"
    import RelatedExpert from "../components/RelatedExpert"
    import SpecialBar from "../components/SpecialBar"
    import Event from '../assets/Bus'

    export default {
        name: "SearchResult",

        data () {
            return {
                flag: 0,
                sortWays: 0,
                blue: 0,
                matchitem1:{},
                matchitem2:{},
                testdata: 0,
                notuserpage:1,
                notuserp_length:5,
                userpage:1,
                userp_length:5,
                keywords: [],
                chooseUser: false,
                results: [
                    {
                        liter_id: 1
                    },
                    {
                        liter_id: 2
                    },
                    {
                        liter_id: 3
                    },
                    {
                        liter_id: 4
                    }
                ],
                expert_results: [
                ]
            }
        },
        components: {
            NavBar,
            HelloWorld,
            SearchField,
            SearchClass,
            LiteratureCard,
            SearchHistory,
            SortSelect,
            Classification,
            RelatedExpert,
            SpecialBar

        },
        methods: {
            listenToMyBoy: function (user_op) {
                // childValue就是子组件传过来的值
                this.chooseUser = user_op
            },
            changeMatchItem: function(){
                var that = this
                var page_from = (this.notuserpage - 1) * this.notuserp_length
                var page_num = this.notuserp_length
                if(that.sortWays != 1 && that.sortWays != 2){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"SubmitTime" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"SubmitTime" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                }
                else if(that.sortWays == 1){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"ReferenceNum" : "desc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"ReferenceNum" : "desc"}],
                        from: page_from,
                        size: page_num
                    }
                }
                else if(that.sortWays == 2){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"ImpactFactor" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"ImpactFactor" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                }
            },
            listenToMyStepBoy: function (idx, btn_color) {
                // childValue就是子组件传过来的值
                var that = this
                that.flag = that.flag + 1
                this.sortWays = idx
                var page_from = (this.notuserpage - 1) * this.notuserp_length
                var page_num = this.notuserp_length
                if(that.sortWays != 1 && that.sortWays != 2 && btn_color != "blue"){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"SubmitTime" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"SubmitTime" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                }
                else if(that.sortWays == 1 && btn_color != "blue"){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"ReferenceNum" : "desc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"ReferenceNum" : "desc"}],
                        from: page_from,
                        size: page_num
                    }
                }
                else if(that.sortWays == 2 && btn_color != "blue"){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"ImpactFactor" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"ImpactFactor" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                }


                // have a try ---------------------------------------------------------
                if (that.$store.state.keyword == 'everything') {
                    this.axios({
                        method: 'post',
                        url: that.$store.state.baseurl_es + 'ss_paper/_search',
                        data:that.matchitem2,
                        headers: {
                            // Access-Control-Allow-Origin
                        },
                        crossDomain: true
                    }).then(body => {
                        console.log('have a try1', body)
                        that.results = body.data.hits.hits
                        var keys
                        var n = 0
                        for(n = 0; n < 5; n++){
                            if(that.results[n]._source.KeyWord.length <= 3) {
                                n++;
                            }
                            else
                                break;
                        }
                        console.log('resulttttttttttt', that.results[0]._source.KeyWord.length <= 3)
                        keys = that.results[n]._source.KeyWord.slice(1, -1).split(", ")

                        for(var i = 0; i < keys.length; i++){
                            keys[i] = keys[i].slice(1, -1)
                        }
                        that.keywords = keys
                    })
                }
                else {
                    this.axios({
                        method: 'post',
                        url: that.$store.state.baseurl_es + 'ss_paper/_search',
                        data: that.matchitem1,
                        headers: {
                            // Access-Control-Allow-Origin
                        },
                        crossDomain: true
                    }).then(body => {
                        that.results = body.data.hits.hits
                        console.log("have a try2", that.results)
                        var keys
                        var n = 0
                        for(n = 0; n < 5; n++){
                            if(that.results[n]._source.KeyWord.length <= 3) {
                                n++;
                            }
                            else
                                break;
                        }
                        console.log('resulttttttttttt', that.results[0]._source.KeyWord.length <= 3)
                        keys = that.results[n]._source.KeyWord.slice(1, -1).split(", ")

                        for(var i = 0; i < keys.length; i++){
                            keys[i] = keys[i].slice(1, -1)
                        }
                        that.keywords = keys
                    })
                }

                // ---------------------------------------------------------
            },
          printId: function (id) {
            console.log("草拟吗",id)
          }
        },
        watch: {
            userpage:function(val) {
                var that = this
                console.log("val-----------", val)
                var page_from = (val - 1) * this.userp_length
                var page_num = this.userp_length
                this.axios({
                    method: 'post',
                    url: that.$store.state.baseurl_es+'ss_expert/_search',
                    data: {
                        query:
                            {
                                match_all: {}
                            },
                        // from: (this.userpage - 1) * this.userp_length,
                        from: page_from,
                        size: page_num
                    },
                    headers:{
                        // Access-Control-Allow-Origin
                    },
                    crossDomain: true
                }).then(body => {
                    that.expert_results = body.data.hits.hits
                })
            },
            notuserpage:function(val) {
                // var that = this
                // console.log("val1-----------", val)
                // var page_from = (val - 1) * this.notuserp_length
                // var page_num = this.notuserp_length
                // if (that.$store.state.keyword == 'everything') {
                //     this.axios({
                //         method: 'post',
                //         url: that.$store.state.baseurl_es + 'ss_paper/_search',
                //         data: {
                //             query:
                //                 {
                //                     match_all: {}
                //                 },
                //             // from: (this.userpage - 1) * this.userp_length,
                //             from: page_from,
                //             size: page_num
                //         },
                //         headers: {
                //             // Access-Control-Allow-Origin
                //         },
                //         crossDomain: true
                //     }).then(body => {
                //         console.log('resulttttttttttt', body)
                //         that.results = body.data.hits.hits
                //         var keys
                //         var n = 0
                //         for(n = 0; n < 5; n++){
                //             if(that.results[n]._source.KeyWord.length <= 3) {
                //                 n++;
                //             }
                //             else
                //                 break;
                //         }
                //         console.log('resulttttttttttt', that.results[0]._source.KeyWord.length <= 3)
                //         keys = that.results[n]._source.KeyWord.slice(1, -1).split(", ")
                //
                //         for(var i = 0; i < keys.length; i++){
                //             keys[i] = keys[i].slice(1, -1)
                //         }
                //         that.keywords = keys
                //     })
                // }
                // else {
                //     this.axios({
                //         method: 'post',
                //         url: that.$store.state.baseurl_es + 'ss_paper/_search',
                //         data: {
                //             query:
                //                 {
                //                     match: { Abstract: that.$store.state.keyword }
                //                 },
                //             // from: (this.userpage - 1) * this.userp_length,
                //             from: page_from,
                //             size: page_num
                //         },
                //         headers: {
                //             // Access-Control-Allow-Origin
                //         },
                //         crossDomain: true
                //     }).then(body => {
                //         that.results = body.data.hits.hits
                //         console.log(that.results)
                //         var keys
                //         var n = 0
                //         for(n = 0; n < 5; n++){
                //             if(that.results[n]._source.KeyWord.length <= 3) {
                //                 n++;
                //             }
                //             else
                //                 break;
                //         }
                //         console.log('resulttttttttttt', that.results[0]._source.KeyWord.length <= 3)
                //         keys = that.results[n]._source.KeyWord.slice(1, -1).split(", ")
                //
                //         for(var i = 0; i < keys.length; i++){
                //             keys[i] = keys[i].slice(1, -1)
                //         }
                //         that.keywords = keys
                //     })
                // }
                console.log("val---------------------------", val)

                var that = this
                that.flag = that.flag + 1
                var page_from = (val - 1) * this.notuserp_length
                var page_num = this.notuserp_length
                console.log("index-------------------------", page_from)
                if(that.sortWays != 1 && that.sortWays != 2){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"SubmitTime" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"SubmitTime" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                }
                else if(that.sortWays == 1){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"ReferenceNum" : "desc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"ReferenceNum" : "desc"}],
                        from: page_from,
                        size: page_num
                    }
                }
                else if(that.sortWays == 2){
                    that.matchitem1 = {
                        query: {
                            match: {
                                "Abstract": that.$store.state.keyword
                            }
                        },
                        sort: [{"ImpactFactor" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                    that.matchitem2 = {
                        query: {
                            match_all: {}
                        },
                        sort: [{"ImpactFactor" : "asc"}],
                        from: page_from,
                        size: page_num
                    }
                }


                // have a try ---------------------------------------------------------
                if (that.$store.state.keyword == 'everything') {
                    this.axios({
                        method: 'post',
                        url: that.$store.state.baseurl_es + 'ss_paper/_search',
                        data:that.matchitem2,
                        headers: {
                            // Access-Control-Allow-Origin
                        },
                        crossDomain: true
                    }).then(body => {
                        console.log('have a try1', body)
                        that.results = body.data.hits.hits
                        var keys
                        var n = 0
                        for(n = 0; n < 5; n++){
                            if(that.results[n]._source.KeyWord.length <= 3) {
                                n++;
                            }
                            else
                                break;
                        }
                        console.log('resulttttttttttt', that.results[0]._source.KeyWord.length <= 3)
                        keys = that.results[n]._source.KeyWord.slice(1, -1).split(", ")

                        for(var i = 0; i < keys.length; i++){
                            keys[i] = keys[i].slice(1, -1)
                        }
                        that.keywords = keys
                    })
                }
                else {
                    this.axios({
                        method: 'post',
                        url: that.$store.state.baseurl_es + 'ss_paper/_search',
                        data: that.matchitem1,
                        headers: {
                            // Access-Control-Allow-Origin
                        },
                        crossDomain: true
                    }).then(body => {
                        that.results = body.data.hits.hits
                        console.log("have a try2", that.results)
                        var keys
                        var n = 0
                        for(n = 0; n < 5; n++){
                            if(that.results[n]._source.KeyWord.length <= 3) {
                                n++;
                            }
                            else
                                break;
                        }
                        console.log('resulttttttttttt', that.results[0]._source.KeyWord.length <= 3)
                        keys = that.results[n]._source.KeyWord.slice(1, -1).split(", ")

                        for(var i = 0; i < keys.length; i++){
                            keys[i] = keys[i].slice(1, -1)
                        }
                        that.keywords = keys
                    })
                }


            },
        },
        created() {
            var that = this

            // if(that.$store.state.keyword == 'everything' && that.chooseUser) {



            Event.$on('broSearch', function(message){
                console.log("keyword:", that.$store.state.baseurl_es)
                console.log("keyword:", that.$store.state.keyword)
                console.log("chooseUser:", that.chooseUser)
                // expert ------------------------------------------------------------------
                if(that.chooseUser) {
                    var page_from = (that.userpage - 1) * that.userp_length
                    var page_num = that.userp_length
                    if (that.$store.state.keyword == 'everything') {
                        that.userp_length = 5
                        this.axios({
                            method: 'post',
                            url: that.$store.state.baseurl_es + 'ss_expert/_search',
                            data: {
                                query:
                                    {
                                        match_all: {}
                                    },
                                // from: (this.userpage - 1) * this.userp_length,
                                from: page_from,
                                size: page_num
                            },
                            headers: {
                                // Access-Control-Allow-Origin
                            },
                            crossDomain: true
                        }).then(body => {
                            that.expert_results = body.data.hits.hits
                            console.log("exp--------------------", that.expert_results)
                        })
                    }
                    else{
                        console.log("name: ======", that.$store.state.keyword)
                        this.axios({
                            method: 'post',
                            url: that.$store.state.baseurl_es + 'ss_expert/_search',
                            data: {
                                query:
                                    {
                                        match: {
                                            "Realname": that.$store.state.keyword
                                        }
                                    },
                                size: 1
                            },
                            headers: {
                                // Access-Control-Allow-Origin
                            },
                            crossDomain: true
                        }).then(body => {
                            that.expert_results = body.data.hits.hits
                            that.userp_length = 1
                        })
                    }
                }
                else{
                    var page_from = (that.notuserpage - 1) * that.notuserp_length
                    var page_num = that.notuserp_length
                    if (that.$store.state.keyword == 'everything') {
                        that.notuserp_length = 5
                        this.axios({
                            method: 'post',
                            url: that.$store.state.baseurl_es + 'ss_paper/_search',
                            data: {
                                query:
                                    {
                                        match_all: {}
                                    },
                                // from: (this.userpage - 1) * this.userp_length,
                                from: page_from,
                                size: page_num
                            },
                            headers: {
                                // Access-Control-Allow-Origin
                            },
                            crossDomain: true
                        }).then(body => {

                            that.results = body.data.hits.hits
                            var keys
                            var n = 0
                            for(n = 0; n < 5; n++){
                                if(that.results[n]._source.KeyWord.length <= 3) {
                                    n++;
                                }
                                else
                                    break;
                            }
                            console.log('resulttttttttttt', that.results[0]._source.KeyWord.length <= 3)
                            keys = that.results[n]._source.KeyWord.slice(1, -1).split(", ")

                            for(var i = 0; i < keys.length; i++){
                                keys[i] = keys[i].slice(1, -1)
                            }
                            that.keywords = keys
                        })
                    }
                    // paper ----------------------------------------------------------------
                    else {
                        this.axios({
                            method: 'post',
                            url: that.$store.state.baseurl_es + 'ss_paper/_search',
                            data:{
                                query:
                                    {
                                        match: { Abstract: that.$store.state.keyword }
                                    },
                                // from: (this.userpage - 1) * this.userp_length,
                                from: page_from,
                                size: page_num
                            },
                            headers: {
                                // Access-Control-Allow-Origin
                            },
                            crossDomain: true
                        }).then(body => {
                          console.log(body)
                            that.results = body.data.hits.hits
                            var keys
                            var n = 0
                          //   console.log(that.results)
                          // console.log(that.results[0])
                            for(n = 0; n < 5; n++){
                                if(that.results[n]._source.KeyWord.length <= 3) {
                                    n++;
                                }
                                else
                                    break;
                            }
                            console.log('resulttttttttttt', that.results[0]._source.KeyWord.length <= 3)
                            keys = that.results[n]._source.KeyWord.slice(1, -1).split(", ")

                            for(var i = 0; i < keys.length; i++){
                                keys[i] = keys[i].slice(1, -1)
                            }
                            that.keywords = keys
                        })
                    }
                }

            })
        }
    }
</script>

<style scoped>

</style>
