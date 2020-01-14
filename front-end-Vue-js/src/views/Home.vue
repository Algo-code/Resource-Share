<template>
  <v-app>
    <v-row align="center">
      <v-img src= "../img/full-logo.png" style="-webkit-box-align: center;max-width: 50%;margin:auto;margin-top: 10%" height="40vh">
      </v-img>
    </v-row>
    <v-row align="center">
      <v-col style="margin: auto;max-width: 550px;font-size: 40px;color: #03a9f4;">
        文献检索 专家查找 资源汇总
      </v-col>
    </v-row>
    <v-row align="center">
      <v-col style="margin: auto;max-width: 160px;font-size: 30px;margin-top: 1%; font-weight: bold; color: #6B6B6B;">
        热门内容
      </v-col>
    </v-row>
    <v-row>
        <v-col style="margin: auto;max-width: 90px;margin-top: -20px">
            <v-icon medium class="mr-1" style="width: 50px;color: #ababab" size="50px">mdi-arrow-down</v-icon>
        </v-col>
    </v-row>
    <v-row>
      <v-col>
        <LiteratureCard style="margin-top: 20px;" v-for="(data, index) in item1" v-bind:liter_title="data.liter_title"v-bind:liter_institution="data.liter_institution"v-bind:liter_author="data.liter_author" v-bind:liter_date="data.subtime"
                        :key="index" />
      </v-col>
    </v-row>
  </v-app>
</template>

<script>
import NavBar from "../components/NavBar";
import SearchClass from "../components/SearchClass"
import LiteratureCard from "../components/LiteratureCard"
import SearchField from "../components/SearchField.vue"

export default {
  name: "home",
  created(){
    this.axios({
      method: 'post',
      url: this.$store.state.baseurl+'api/paper/getRandPaper',
      headers: {
      },
      data: {
      },
      crossDomain: true
    }).then(body => {
      console.log(body.data.data)
      for (let i=0;i<4;i++)
      {

        let arr={liter_title: body.data.data[i].Title,liter_institution:body.data.data[i].Origin,liter_author:body.data.data[i].Publisher,subtime:body.data.data[i].SubmitTime}
        this.item1.push(arr)
      }
    })
  },
  mounted(){
  },
  data () {
    return {
      item1:[],
    }
  },
  components: {
    NavBar,
    SearchClass,
    LiteratureCard,
    SearchField
  }
};
</script>
