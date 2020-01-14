<template>
  <v-card class="mx-auto" max-width="450" outlined>
    <div style="text-align: center; margin-top: 40px">
      <v-avatar size="200">
        <img src="../img/avatar.jpeg" alt="John" />
      </v-avatar>
    </div>
    <v-list-item three-line>
      <v-list-item-content>
        <v-list-item-title class="headline mb-1" style="text-align: center;">{{name}}</v-list-item-title>
        <v-list-item-subtitle class="subtitle-2" style="text-align: center;">
          <v-avatar>
            <v-icon>mdi-school</v-icon>
          </v-avatar>{{school}}
        </v-list-item-subtitle>
        <v-list-item-subtitle class="subtitle-1" style="text-align: center;">
          <v-avatar>
            <v-icon>mdi-account</v-icon>
          </v-avatar>{{institution}}
        </v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>
    <v-list-item two-line>
      <v-list-item-content>
        <v-list-item-title style=" font-size: 30px;">研究领域</v-list-item-title>
      </v-list-item-content>
    </v-list-item>
    <div class="text-center">
      <v-chip
        class="ma-2"
        style="margin-left: 8px; margin-bottom: 8px;"
        large
        v-for='value in sort_option'
      >{{value}} </v-chip>
    </div>
    <v-card-actions>
      <div style="width: 100%; text-align: center; margin-top: 10px">
        <v-btn
          large
          color="primary"
          style="margin: auto; width: 120px; height: 40px; margin-top: 10px; margin-bottom: 20px"
        >合作洽谈</v-btn>
      </div>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props:{
    name:{},
      school:{},
    institution:{},
    sort_option: []
  },
  data (){
  return {

  }
}

};
</script>

<style scoped>
.text1111 {
  font-size: 12px;
}
</style>