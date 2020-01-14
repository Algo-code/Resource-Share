<template>
  <div class="specialbar">
    <v-card
            class="spe mx-auto"
            outlined
            max-width="950"
            style="padding: 5px"
    >
      <v-row>
        <v-col cols="1" style="margin-left: 15px;margin-top: 8px">
          <v-avatar color="teal" size="62" @click="goToSpecialist(special_id)">
            <span class="white--text headline">T</span>
          </v-avatar>
        </v-col>
        <v-col cols="3" style="margin:10px;">
          <v-row>
            <font class="headline" >{{Realname}}</font>
          </v-row>
          <v-row>
            <font class="body-1" style="padding-top:5px;">{{Introduction}}</font>
          </v-row>
        </v-col>
        <v-col cols="4"></v-col>
        <v-col cols="2">
          <v-card class="relative" outlined="disabled">
            <v-row>
              <div style="margin:auto;padding:10px;">3</div>
            </v-row>
            <v-row>
              <div style="margin:auto;">相关文献</div>
            </v-row>
          </v-card>
        </v-col>
        <v-col cols="1" style="padding:auto;">
          <div class="fav">
            <v-btn elevation="0" tile color="primary">收藏</v-btn>
          </div>
        </v-col>
      </v-row>
    </v-card>
  </div>
</template>

<script>
import SearchField from "./SearchField";
export default {
  methods:{
    goToSpecialist: function(id) {
      this.$router.push({ name: 'special', params: { specialistId : id }})
    }
  },
  name: "SpecialBar",
  props:{
    special_id: {
      default: 1
    },
    Realname: {
      default: "xxx"
    },
    Introduction: {
      default: "山东农业大学成员"
    }
  },
  components: {
    SearchField
  }
};
</script>

<style>
.specialbar {
  /* margin-left: 75px; */
  /* margin-right: 75px; */
  /* margin-top: 10px; */
}

.spe {
  padding: 15px;
}
.relative{
  height: 80px;
}

.fav{
    padding-top:20px;
}


</style>
