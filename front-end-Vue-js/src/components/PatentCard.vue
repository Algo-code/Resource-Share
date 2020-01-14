<template>
  <v-card class="mx-auto" max-width="900" outlined style="padding: 5px">
    <v-list-item three-line>
      <v-list-item-content>
        <div class="search-title">{{patentName}}</div>
        <a class="link">{{company}} - {{location}}</a>
        <div class="author-text">{{owner}}</div>
        <div class="author-text">主分类号： {{main_class_num}}</div>
        <div class="author-text">分类号：{{classNum}}</div>
      </v-list-item-content>
      <div class="liter-date">{{date}}</div>
      <div class="my-2" style="margin-left: 10px;margin-right: 30px">
        <v-btn small elevation="0" color="#E8E8E8">审核</v-btn>
      </div>
      <div class="my-2" style="margin-right: 15px">
        <v-btn small elevation="0" color="#E8E8E8">出售</v-btn>
      </div>
      <div>
        <v-icon medium class="mr-1" :color="collect_color" @click="collect">mdi-star</v-icon>
      </div>
    </v-list-item>
  </v-card>
</template>

<script>
export default {
  props:{
    patentName:{},
    company:{},
    location:{},
    owner: [],
    main_class_num:{},
    classNum:{},
    date:{},
  },
  name: "LiteratureCard",
  data: () => ({
    collect_color: "#ccc"
  }),
  methods: {
    collect: function() {
      this.collect_color = this.collect_color == "#ccc" ? "yellow" : "#ccc";
    }
  },
  mounted() {

       this.axios.post('http://114.115.151.96:8666/Posting/GetPostingsByTeamId', {
         teamId: this.$store.state.group.groupId
       })
         .then(function (response) {
           console.log('returned')
           console.log(response.data)
           that.selfComments = response.data
         })
         .catch(function (error) {
           this.state.search.dataShow = [ { tit: error } ]
         })
  }
};
</script>

<style scoped>
.search-title {
  font-size: 17px;
}
.link {
  font-size: 14px;
  margin-top: 10px;
  margin-bottom: 5px;
}
.author-text {
  font-size: 14px;
  color: gray;
  margin-bottom: 5px;
}
.liter-date {
  margin-right: 20px;
  color: gray;
}
.ref {
  margin-right: 20px;
  width: 60px;
  height: 60px;
  background: #e8e8e8;
  text-align: center;
  font-size: 14px;
}
</style>
