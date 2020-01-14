<template>
<v-app>
    <v-row style="width: 100%">
        <v-col cols="2"></v-col>
        <v-col cols="2">
            <RelatedExpert :experts="paperInfo.experts" style="margin-top: 15px"/>
            <Keywords :keywords="paperInfo.KeyWord" style="margin-top: 15px"/>
            <v-btn style="width:95%; margin-top: 15px;" color="primary" @click="downloadUrlFile(paperInfo.pdf)">下载</v-btn>
        </v-col>
        <v-col cols="6">
            <iframe :src="paperInfo.File" frameborder="0" style="width:100%; height: 100%;"></iframe>
        </v-col>
        <v-col cols="2"></v-col>
    </v-row>
</v-app>
</template>

<script>
import RelatedExpert from "../components/RelatedExpert";
import Keywords from "../components/Keywords";
import { saveAs } from '../plugins/FileSaver';

export default {
    name: "PaperDisplay",
    data () {
        return {
            url: "http://49.233.42.108:8080/api/files/zhiwang_html/敬告作者_.html",
            paperInfo: {
            }
        }
    },
    components: {
        Keywords,
        RelatedExpert
    },
    methods: {
      downloadUrlFile: function (url) {
        let that = this;
        const xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.responseType = 'blob';
        xhr.setRequestHeader('Authorization', 'Basic a2VybWl0Omtlcm1pdA==');
        xhr.onload = () => {
          if (xhr.status === 200) {
            // 获取图片blob数据并保存
            saveAs(xhr.response, 'abc.pdf');
          }
        };
        xhr.send();
      }
    },
    mounted(){
        const that = this
        // 测试代码
        const paperId = this.$route.params.paperId
        console.log(paperId)
      const url= that.$store.state.baseurl+'api/paper/getPaper'
      console.log(url)
        this.axios.post(url, {
          id: that.$route.params.paperId
        })
          .then(function (response) {
            // console.log('returned')
            console.log(response.data.data)
            that.paperInfo = response.data.data
            that.paperInfo.KeyWord = response.data.data.KeyWord.slice(1, -1).split(", ")
            let str=response.data.data.File
            console.log(str.length)
            if(str.length > 10){
              console.log(str)
              const true_url = that.$store.state.baseurl+"api/files"+str
              console.log(true_url)
              that.paperInfo.File = true_url
              that.paperInfo.pdf = true_url.replace("html","pdf").replace("html","pdf")
              console.log(that.paperInfo.pdf)
            }else{
              that.paperInfo.File = that.url
              that.paperInfo.pdf = that.url.replace("html","pdf").replace("html","pdf")
            }
          })
          .catch(function (error) {
            console.log(error)
          })
    }
}


</script>

<style scoped>

</style>