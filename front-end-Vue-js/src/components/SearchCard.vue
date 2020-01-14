<template>
  <div class="card">
    <v-card class="ca">
      <v-row>
        <v-col cols="2">
          <v-select :items="items" label="关键字" solo v-model="search_info.item"></v-select>
        </v-col>
        <v-col cols="6">
          <v-text-field placeholder="请输入" v-model="search_info.item_info1"></v-text-field>
        </v-col>
        <!-- <v-col cols="1">
          <v-select class="frequent" :items="frequent" label="词频" solo v-model="frequent1"></v-select>
        </v-col>-->
        <v-col cols="2">
          <v-select class="frequent" :items="acurate" label="模糊" solo v-model="search_info.acurate1" disabled></v-select>
        </v-col>
      </v-row>
      <!-- <v-row>
        <v-col cols="2">
          <v-select class="relation" :items="relation" label="并含" solo v-model="search_info.relation" disabled=""></v-select>
        </v-col>
        <v-col cols="6">
          <v-text-field placeholder="请输入" v-model="search_info.item_info2"></v-text-field>
        </v-col> -->
        <!-- <v-col cols="1">
          <v-select class="frequent" :items="frequent" label="词频" solo v-model="frequent2"></v-select>
        </v-col>-->
        <!-- <v-col cols="2">
          <v-select class="frequent" :items="acurate" label="模糊" solo v-model="search_info.acurate1" disabled></v-select>
        </v-col> -->
      <!-- </v-row> -->
      <v-row>
        <v-col cols="2">
          <v-select :items="author" label="作者" solo v-model="search_info.author_item" disabled></v-select>
        </v-col>
        <v-col cols="6">
          <v-text-field placeholder="中文名/英文名/拼音" v-model="search_info.Realname1"></v-text-field>
        </v-col>
        <v-col cols="2">
          <!-- <v-select class="frequent" :items="acurate" label="精确度" solo v-model="search_info.acurate2"></v-select> -->
        </v-col>
        <v-col></v-col>
        <v-col></v-col>
      </v-row>
      <v-row>
        <v-col cols="2"></v-col>
        <v-col cols="6">
          <v-text-field placeholder="全称/简称/曾用名" label="作者单位" v-model="search_info.Affiliation"></v-text-field>
        </v-col>
        <v-col cols="2">
          <!-- <v-select class="frequent" :items="acurate" label="精确度" solo v-model="search_info.acurate3"></v-select> -->
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="2"></v-col>
        <v-col cols="6">
          <v-text-field placeholder="请输入" label="文献来源" v-model="search_info.Origin"></v-text-field>
        </v-col>
        <v-col cols="2">
          <!-- <v-select class="frequent" :items="acurate" label="精确度" solo v-model="search_info.acurate4"></v-select> -->
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="2"></v-col>
        <v-col cols="6">
          <v-text-field placeholder="请输入" label="支持基金" v-model="search_info.Fund"></v-text-field>
        </v-col>
        <v-col cols="2">
          <!-- <v-select class="frequent" :items="acurate" label="精确度" solo v-model="search_info.acurate5"></v-select> -->
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="2"></v-col>
        <v-col cols="3">
          <v-text-field placeholder="1900-1-1" label="开始日期" v-model="search_info.start_date" disabled></v-text-field>
        </v-col>
        <v-col cols="3">
          <v-text-field placeholder="2019-1-1" label="结束日期" v-model="search_info.end_date" disabled></v-text-field>
        </v-col>
        <v-col cols="6"></v-col>
      </v-row>
      <v-row>
        <!-- <v-col>
          <v-checkbox v-model="label1" label="网络首发" value="网络首发"></v-checkbox>
        </v-col>
        <v-col>
          <v-checkbox v-model="label2" label="增强出版" value="增强出版"></v-checkbox>
        </v-col>
        <v-col>
          <v-checkbox v-model="label3" label="数据论文" value="数据论文"></v-checkbox>
        </v-col>
        <v-col>
          <v-checkbox v-model="label4" label="中英文扩展" value="中英文扩展"></v-checkbox>
        </v-col>
        <v-col>
          <v-checkbox v-model="label5" label="同义词扩展" value="同义词扩展"></v-checkbox>
        </v-col> -->
        <v-col></v-col>
        <v-col></v-col>
        <v-col></v-col>
        <v-col>
          <div class="my-2">
            <v-btn large color="error" @click="search">检索</v-btn>
          </div>
        </v-col>
      </v-row>
    </v-card>
  </div>
</template>

<script>
export default {
  name: "advancedSearch",
  data: () => ({
    items: [{text:"关键字",value:"KeyWord"}, {text:"标题",value:"Title"}, {text:"摘要",value:"Abstract"}, {text:"ISSN",value:"Issn"}],
    // frequent: ["2", "3", "4", "5", "6", "7", "8", "9"],
    relation: [{text:"并含",value:"and"}, {text:"或含",value:"or"}, {text:"不含",value:"not"}],
    acurate: ["精确", "模糊"],
    author: ["第一作者", "第二作者"],
    search_info: {
      item: "",
      item_info1: "",
      item_info2: "",
      // relation: "",
      acurate1: "",
      acurate2: "",
      acurate3: "",
      acurate4: "",
      acurate5: "",
      author_item: "",
      Realname1: "",
      Affiliation: "",
      Origin: "",
      Fund: "",
      start_date: "",
      end_date: "",
      // label1: "",
      // label2: "",
      // label3: "",
      // label4: "",
      // label5: ""
    }
  }),
  methods: {
    search: function() {
      //传数据给父组件
      var clicked = true;
      this.$emit("search", clicked, this.search_info);
    }
  }
};
</script>

<style>
.card {
  width: 80%;
  margin-left: auto;
  margin-right: auto;
  margin-top: 10px;
}
.v-text-field {
  height: 38px;
}
.ca {
  padding: 25px;
}
</style>
