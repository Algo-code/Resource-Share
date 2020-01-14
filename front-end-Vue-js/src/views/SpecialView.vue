<template>
  <div>
    <div class="card">
      <!-- <v-card class="spe"> -->
      <div style="padding:25px;padding-left:40px; padding-right:40px;">
        <v-row>
          <v-col cols="4">
            <font class="display-1">专家主页申请</font>
          </v-col>
          <v-col cols="5"></v-col>
          <v-col cols="3">
            <div class="my-2">
              <v-btn
                v-on:click="Pass('true')"
                depressed
                large
                color="primary"
                style="margin-right:10px;"
              >通过</v-btn>
              <v-btn v-on:click="Pass('false')" depressed large color="grey">驳回</v-btn>
            </div>
          </v-col>
        </v-row>
        <v-row>
          <v-divider></v-divider>
        </v-row>
        <v-row class="row">
          <font class="headline" color="grey">真实姓名:</font>
          <font class="headline">{{name}}</font>
        </v-row>
        <v-row class="row">
          <font class="headline" color="grey">就职经历:</font>
        </v-row>
        <v-row class="row">
          <p>{{work_experience}}</p>
        </v-row>
        <v-row class="row">
          <font class="headline" color="grey">教育经历:</font>
        </v-row>
        <v-row class="row">
          <p>{{edu_experience}}</p>
        </v-row>
        <v-row class="row">
          <font class="headline" color="grey">个人简介:</font>
        </v-row>
        <v-row class="row">
          <p>{{introduction}}</p>
        </v-row>
        <v-row class="row">
          <font class="headline" color="grey">联系方式:</font>
        </v-row>
        <v-row class="row">
          <p>{{contact}}</p>
        </v-row>
        <v-row class="row">
          <font class="headline" color="grey">相关文献:</font>
        </v-row>
        <v-row class="row">
          <LiteratureCard style="width:1000px;" />
        </v-row>
        <v-row class="row">
          <LiteratureCard style="width:1000px;" />
        </v-row>
      </div>
      <!-- </v-card> -->
    </div>
  </div>
</template>

<script>
import NavBar from "../components/NavBar";
import SpecialBar from "../components/SpecialBar";
import LiteratureCard from "../components/LiteratureCard.vue";

export default {
  name: "specialView",
  methods: {
    Pass: function(ispass) {
      this.axios({
        method: "post",
        url: this.$store.state.baseurl + "/api/admin/pass",
        data: {
          id: this.id,
          pass: "true"
        },
        crossDomain: true
      }).then(function() {
        if(ispass=='true')
          alert("成功通过，返回管理页");
        else if(ispass=='false')
          alert("成功驳回，返回管理页");
        this.$router.push({path:'/bkm'}),
        console.log('abc')
      }.bind(this));
    }
  },
  components: { NavBar, SpecialBar, LiteratureCard },
  data: () => ({
      id: "5",
      name: "xxx",
      work_experience: "xxx",
      edu_experience: "xxx",
      introduction: "xxx",
      contact: "xxx",
      literature: "xxx"
  }),
  props: ["id"],
  mounted() {

    var that = this;
    console.log("idddddd", this.id)

    this.axios({
      method: "post",
      url: this.$store.state.baseurl + "/api/admin/findById",
      headers: {
        token: this.$store.state.token
        // token: "XHFOOCv/T+9AEpjV5Ary92SF+nkkr1dvP4zEo0pO0yF8ZuQHDAQT8Pcdzdd+waB9fEQRSOI/+KLMrvaNKg4GRVtsh8iKv69D/PiIYb/VITuEBmpSYsdfm2dERMM7yHym"
      },
      data: {
        id: that.id
      },
      crossDomain: true
    }).then(body => {
      console.log("id: ", this.id);
      console.log("SpecialView:body", body.data);
      var info = body.data.data;
      that.name = info.realname;
      that.work_experience = info.workexp;
      that.edu_experience = info.eduexp;
      that.contact = info.contact;
      that.introduction = info.profile;
      console.log("special_info", that.name)
    });
  }
};
</script>

<style scoped>
.card {
  width: 900px;
  margin: auto;
  margin-top: 10px;
  border: 1px solid lightgray;
}
.spe {
  padding-top: 10px;
  margin: auto;
  height: 500px;
  width: 900px;
}
.v-row {
  margin: 10px;
}
.row {
  margin: 10px;
}
</style>
