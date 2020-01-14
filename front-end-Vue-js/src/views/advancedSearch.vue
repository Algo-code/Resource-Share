<template>
  <v-row>
    <SearchCard v-on:search="GetSearchInfo" />

    <div v-if="clicked" style="width: 100%">
      <div>
        <LiteratureCard
          :liter_id="data._source.P_ID"
          :liter_title="data._source.Title"
          :liter_institution="data._source.Affiliation"
          :liter_author="data._source.Realname1"
          :ref_num="data._source.ReferenceNum"
          :liter_date="data._source.SubmitTime.slice(0,10)"
          style="margin-top: 20px;"
          v-for="(data, index) in this.data"
          :key="index"
        />
      </div>

      <div class="text-center" style="margin-top: 50px;text-align: center">
        <v-pagination v-on:input="ChangePage" v-model="page" :length="p_length"></v-pagination>
      </div>
    </div>
  </v-row>
</template>

<script>
import NavBar from "../components/NavBar";
import SearchCard from "../components/SearchCard";
import LiteratureCard from "../components/LiteratureCard";

export default {
  name: "advancedSearch",
  components: { NavBar, SearchCard, LiteratureCard },
  data: () => ({
    page: 1,
    choose_item:"",
    p_length: 10,
    results: [],
    clicked: false,
    search_info: [],
    search_info_not: [],
    search_info_or: [],
    data: {}
  }),
  methods: {
    GetSearchInfo: function(clicked, info) {
      // console.log('clicked');
      // console.log(this.page);
      //先把无关项置为空
      // console.log(this.page);
      var isAnd = false,
        isOr = false,
        isNot = false,
        hasRelation = false;
      this.search_info = [];
      info.author_item = "";
      info.start_date = "";
      info.end_date = "";
      this.clicked = clicked;
      // this.search_info = search_info;

      // var match = {};
      // console.log(search_info);
      // console.log(search_info.length)
      for (var obj in info) {
        if (info[obj] != "") {

          //https://blog.csdn.net/xiaomanonyo/article/details/78642148 解决方法
          // if (info[obj] == "and" && info.item_info2 != "") {
            // isAnd = true;
            // hasRelation = true;
            // if(this.choose_item == "KeyWord")
          //   this.search_info.push({match:{KeyWord:info.item_info2}});
          //   else if(this.choose_item == "Title")
          //   this.search_info.push({match:{Title:info.item_info2}});
          //   else if(this.choose_item == "Abstract")
          //   this.search_info.push({match:{Abstract:info.item_info2}});
          //   else if(this.choose_item == "Issn")
          //   this.search_info.push({match:{Issn:info.item_info2}});

          //   info.item_info2 = "";
          //   info.relation = "";
          //   continue;
          // } else if (info[obj] == "or" && info.item_info2 != "") {
            // isOr = true;
            // hasRelation = true;
          //   if(this.choose_item == "KeyWord")
          //   this.search_info_or.push({match:{KeyWord:info.item_info2}});
          //   else if(this.choose_item == "Title")
          //   this.search_info_or.push({match:{Title:info.item_info2}});
          //   else if(this.choose_item == "Abstract")
          //   this.search_info_or.push({match:{Abstract:info.item_info2}});
          //   else if(this.choose_item == "Issn")
          //   this.search_info_or.push({match:{Issn:info.item_info2}});

          //   info.item_info2 = "";
          //   info.relation = "";
          //   continue;
          // } else if (info[obj] == "not" && info.item_info2 != "") {
            // isNot = true;
            // hasRelation = true;
          //   if(this.choose_item == "KeyWord")
          //   this.search_info_not.push({match:{KeyWord:info.item_info2}});
          //   else if(this.choose_item == "Title")
          //   this.search_info_not.push({match:{Title:info.item_info2}});
          //   else if(this.choose_item == "Abstract")
          //   this.search_info_not.push({match:{Abstract:info.item_info2}});
          //   else if(this.choose_item == "Issn")
          //   this.search_info_not.push({match:{Issn:info.item_info2}});

          //   info.item_info2 = "";
          //   info.relation = "";
          //   continue;
          // }

          switch (info[obj]) {
            case "KeyWord":
              this.choose_item = "KeyWord";
              this.search_info.push({ match: { KeyWord: info.item_info1 } });
              // if(info.item_info2 != "")
              // this.search_info.push({match:{KeyWord:info.item_info2}});
              // if (isAnd)
              //   this.search_info.push({ match: { KeyWord: info.item_info2 } });
              // else if (isOr)
              //   this.search_info_or.push({
              //     match: { KeyWord: info.item_info2 }
              //   });
              // else if (isNot)
              //   this.search_info_not.push({
              //     match: { KeyWord: info.item_info2 }
              //   });
              // if(hasRelation)
              // info.item_info2="";
              info.item_info1 = "";
              info.item_info2 = "";
              info.item = "";
              // var a = {};
              // a[obj] = info[obj];
              // var b = { match: a };
              // this.search_info.push(b);
              break;
            case "Title":
              this.choose_item = "Title";
              this.search_info.push({ match: { Title: info.item_info1 } });
              // if(info.item_info2 != "")
              // this.search_info.push({match:{Title:info.item_info2}});
              // if (isAnd)
              //   this.search_info.push({ match: { Title: info.item_info2 } });
              // else if (isOr)
              //   this.search_info_or.push({
              //     match: { Title: info.item_info2 }
              //   });
              // else if (isNot)
              //   this.search_info_not.push({
              //     match: { Title: info.item_info2 }
              //   });
              // if(hasRelation)
              // info.item_info2="";
              info.item = "";
              info.item_info1 = "";
              info.item_info2 = "";
              // var a = {};
              // a[obj] = info[obj];
              // var b = { match: a };
              // this.search_info.push(b);
              break;
            case "Abstract":
              this.choose_item = "Abstract";
              this.search_info.push({ match: { Abstract: info.item_info1 } });
              // if(info.item_info2 != "")
              // this.search_info.push({match:{Abstract:info.item_info2}});
              // if (isAnd)
              //   this.search_info.push({ match: { Abstract: info.item_info2 } });
              // else if (isOr)
              //   this.search_info_or.push({
              //     match: { Abstract: info.item_info2 }
              //   });
              // else if (isNot)
              //   this.search_info_not.push({
              //     match: { Abstract: info.item_info2 }
              //   });
              // if(hasRelation)
              // info.item_info2="";
              info.item = "";
              info.item_info1 = "";
              info.item_info2 = "";
              // var a = {};
              // a[obj] = info[obj];
              // var b = { match: a };
              // this.search_info.push(b);
              break;
            case "Issn":
              this.choose_item = "Issn";
              this.search_info.push({ match: { Issn: info.item_info1 } });
              // if(info.item_info2 != "")
              // this.search_info.push({match:{Issn:info.item_info2}});
              // if (isAnd)
              //   this.search_info.push({ match: { Issn: info.item_info2 } });
              // else if (isOr)
              //   this.search_info_or.push({
              //     match: { Issn: info.item_info2 }
              //   });
              // else if (isNot)
              //   this.search_info_not.push({
              //     match: { Issn: info.item_info2 }
              //   });
              // if(hasRelation)
              // info.item_info2="";
              info.item = "";
              info.item_info1 = "";
              info.item_info2 = "";
              // var a = {};
              // a[obj] = info[obj];
              // var b = { match: a };
              // this.search_info.push(b);
              break;
            default:
              var a = {};
              a[obj] = info[obj];
              var b = { match: a };
              this.search_info.push(b);
          }
        }
      }

      // console.log(this.search_info);

      this.axios({
        method: "post",
        url: this.$store.state.baseurl_es + "ss_paper/_search",
        data: {
          query: {
            bool: {
              must: this.search_info,
              // should:this.search_info_or,
              // must_not:this.search_info_not,
              // range:{
              //   timestamp:{
              //     gte:"2018-1-1",
              //     lte:"2019-1-1",
              //   }
              // }
              // should:[
              //   {match:{Fund:"浙江"}},
              //   {match:{Origin:"国家"}}
              // ]
              
            }
          },
          from: (this.page - 1) * 10,
          size: 10
        },
        headers: {},
        crossDomain: true
      }).then(body => {
        // console.log(body.data.hits.hits);
        console.log(this.search_info);
        console.log(this.search_info_or);
        console.log(this.search_info_not);
        console.log(body);
        this.data = body.data.hits.hits;
      });
    },
    ChangePage: function() {
      console.log(this.page);
      this.axios({
        method: "post",
        url: this.$store.state.baseurl_es + "ss_paper/_search",
        data: {
          query: {
            bool: {
              should: this.search_info
            }
          },
          from: (this.page - 1) * 10,
          size: 10
        },
        headers: {},
        crossDomain: true
      }).then(body => {
        console.log(body.data.hits.hits);
        this.data = body.data.hits.hits;
      });
    }
  },
  mounted() {
    // this.$store.dispatch("changetoken", localStorage.getItem("token"));
    this.$store.dispatch("changelogined", localStorage.getItem("logined"));
    console.log(this.clicked);
  }
};
</script>

<style scoped>
.hello {
  font-size: 30px;
  color: gray;
  font-weight: bold;
  margin-top: 15px;
  margin-left: 20px;
  margin-bottom: -10px;
}
</style>
