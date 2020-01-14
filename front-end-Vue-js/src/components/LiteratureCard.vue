<template>
    <v-card
            class="mx-auto"
            max-width="950"
            outlined
            style="padding: 5px"
    >
        <v-list-item three-line>
            <v-list-item-content>
                <a class="search-title" @click="goPaperDisplay()">
                    {{liter_title}}</a>
                <div class="link">{{liter_institution}}</div>
                <div class="author-text"><span v-for="author in liter_author">{{author}}&nbsp&nbsp&nbsp</span></div>
            </v-list-item-content>
            <div class="liter-date">{{liter_date.slice(0, 10)}}</div>
            <div class="ref">
                <p style="margin-top:7px">{{ref_num}}</p>
                <p style="margin-top:-12px">被引</p>
            </div>

            <div class="ref" @click="downloadUrlFile(download_url)">
                <p style="margin-top:7px">{{download_num}}</p>
                <p style="margin-top:-12px">下载</p>
            </div>

            <div>
                <v-icon medium class="mr-1" :color="collect_color" @click="collect">mdi-star</v-icon>
            </div>
        </v-list-item>
    </v-card>
</template>

<script>
    import { saveAs } from '../plugins/FileSaver';
    export default {
        name: "LiteratureCard",
        data: () => ({
            collect_color: '#ccc',
            // download_url: 'http://www.005.tv/uploads/allimg/170513/32-1F51319312bb.jpg'
            download_url: 'http://10.135.238.11:8080/api/files/e3ed823fbd9d4b0e96cd508de489f354.jpg'
            // download_url: 'https://pdf.sciencedirectassets.com/271625/1-s2.0-S0020025519X0033X/1-s2.0-S0020025519310850/main.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCOQjmA0MNzf7suMS8aCTE44PJskgq3TmVfIOrXTjIFlgIgV4EH2eS6o%2FugHW2jwg6lsLB92d7XKRSFAkNMFfPHV6gqzwIIPxACGgwwNTkwMDM1NDY4NjUiDAIVhAB6aGMz4vzFcyqsAofnne38n2JgJM5wwBmghTNADn3UF85yQaHomaEeP2PrMPoimJKrO7MBCDNMapGQ5Pydq4moR0gPn5MMa7zj%2BdkrjFlDAJfcqfmdc1gxD3rY87BTwFm2vv3Skszeiw5M2unKJxUcFlUheYVB1QkaBK9c3G9Xc2fgU8V%2BQc%2FsFGaSY99jBsOODvS9pQKyx4U9KIu%2BnuyyK1qE61jrIooU%2BC3vP%2FXIfI4f0RSKoprVexUSXLm%2BA%2BgP6ylgCui1tRn6gZwjraFT1agaeBuO4ypd%2BmTkD2ZM3Z6BVfQDAOW1rgZv7wqYswfhj9mMkx%2FtGzzN%2FP3t7yXZ8ff3OWFORWbl3J%2Bcw2dJ7TZX9BQfeB%2FdmUOCaIaU%2BEcQvlGEe5JwRVaip%2BebK4NnPGnZrM4VljCt9NHvBTrQAn%2FFE%2BeYYdorR4ytid4%2FHYxLd4eA5UpIlC%2BahQLd%2FWwnmclU%2FSoex%2FynOy2Oi7apKUGLVvUJdK4QrRDmeBNWs8YYSvj9TMAXatlKSkTofZ9cGgjk9LVXWlnURCXLog%2BdwMfsYmtkenG%2FxbW070mP47e4XhxGOQZlPVvpwHYIkpaSN1OaDvpCXa70yoioD8oCtucUaDORFzoqumAJMWfnCUFp2lVm2OgjETMiPvG8Ujv4ZU4nyyb0PhY8x7YXdOB9WDlaAjHtKHUDzxXNgAxTrdf4v8uEjaSBJVaFIgx%2BnpSYzvmwb48jmzFs3km46QvZYWZjU0JNe2H6GQOjEPCCeKRMjr3DaAfLXje0ikOngq8sqOGt3LZQcUiO3%2BfSZWp4sJFHAjqz9K4h3EktGU%2BOfxWpgrGo1bsd9wf%2Fc6tb1m0smhK67IR2OY%2F8Rod%2BpiZVAQ%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20191214T071909Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ3PHCVTY3TMVTBGS%2F20191214%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=68516b264acd69347db1499d49ac86e1403a09905707a7255f491a0664e3b5fe&hash=cf94a475c0c4db0e348b5ba4d0cd931951e00b50e3fa425c67200a6b5c03e14d&host=68042c943591013ac2b2430a89b270f6af2c76d8dfd086a07176afe7c76c2c61&pii=S0020025519310850&tid=spdf-289f9d9d-8ee3-45fb-af0a-95d9abee4806&sid=b92461a25b83e14095884a10179b2953ad76gxrqb&type=client'
        }),
        props:{
            liter_date:{
                default: '2019-09-04'
            },
            liter_title: {
              default: 'Simsax: A measure of project similarity based on symbolic approximation\n' +
                  '                    method and software defect inflow'
            },
            liter_institution:{
              default: 'Information and Software Technology (Elsevierjournal)'
            },

            liter_id: {
                default: '1'
            },
            collection: {
                default: '1'
            },
            liter_author: {
                default: 'Mirosław Ochodek;Miroslaw Staron;Wilhelm Meding'
            },

            ref_num:{
                default: 0
            },

            download_num:{
                default: 5
            }
        },
        methods: {
            collect: function () {
              const that = this
              this.axios({
                method: 'post',
                url: that.$store.state.baseurl+'api/paper/subscribe',
                data: {
                    pid: that.liter_id
                },
                headers:{
                  // Access-Control-Allow-Origin
                  token: this.$store.state.token
                },
                crossDomain: true
              }).then(body => {
                this.collect_color = (this.collect_color == '#ccc') ? 'yellow' : '#ccc'
              })
            },
            downloadUrlFile: function (url) {
                let that = this;
                const xhr = new XMLHttpRequest();
                xhr.open('GET', url, true);
                xhr.responseType = 'blob';
                xhr.setRequestHeader('Authorization', 'Basic a2VybWl0Omtlcm1pdA==');
                xhr.onload = () => {
                  if (xhr.status === 200) {
                    // 获取图片blob数据并保存
                    saveAs(xhr.response, 'abc.jpg');
                  }
                };
                xhr.send();
            },
          goPaperDisplay: function(){
            const that = this
            console.log(this.liter_id)
            this.$router.push({ name: 'paperDisplay', params: { paperId: ""+that.liter_id}})
          }
        },
        mounted() {
        //   this.axios.post('http://114.115.151.96:8666/Posting/GetPostingsByTeamId', {
        //     teamId: this.$store.state.group.groupId
        //   })
        //     .then(function (response) {
        //       console.log('returned')
        //       console.log(response.data)
        //       that.selfComments = response.data
        //     })
        //     .catch(function (error) {
        //       this.state.search.dataShow = [ { tit: error } ]
        //     })
            this.download_num = Math.round(Math.random() * 2);
        }
    }
</script>

<style scoped>
    .search-title{
        font-size: 17px;
    }
    .link{
        font-size: 14px;
        margin-top: 10px;
    }
    .author-text{
        font-size: 14px;
        color: gray;
    }
    .liter-date{
        margin-right: 12px;
        color: gray;
    }
    .ref{
        margin-right: 20px;
        width: 60px;
        height: 60px;
        background: #E8E8E8;
        text-align: center;
        font-size: 14px;
    }
</style>
