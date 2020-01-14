<template>
    <div class="search-history">
        <P class="his-title">关键词</P>
        <v-divider></v-divider>
        <p class="his-item" v-for="(data, index) in keywords" :key="index">{{data.slice(1, -1)}}</p>
    </div>
</template>

<script>
  export default {
    name: "Keywords",
    data() {
      return {
      };
    },
    props: {
      keywords: {
        default: ["'软件工程'", "'机器学习'", "'数据库'"]
      }
    },
  };
</script>

<style scoped>
    .search-history {
        padding: 20px;
        background: white;
        width: 95%;
    }
    .his-title {
        font-size: 20px;
        color: black;
    }
    .his-item {
        color: gray;
        font-size: 16px;
        margin-top: 10px;
        margin-bottom: -2px;
    }
</style>
