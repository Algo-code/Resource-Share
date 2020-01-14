<template>
    <div>
        <h1 style="margin: 40px">数据：</h1>

    </div>
</template>

<script>
    export default {
        name: "test",
        mounted() {
            // console.log(this.$store.state.baseurl_es)
            // this.axios({
            //     method: 'post',
            //     url: this.$store.state.baseurl_es+'ss_expert/_search',
            //     data: {
            //         query:
            //             {
            //                 match_all: {}
            //             },
            //         // _source: ["ISSN"]
            //     },
            //     headers:{
            //         // Access-Control-Allow-Origin
            //     },
            //     crossDomain: true
            // }).then(body => {
            //     console.log(body.data)
            // })

            console.log(this.$store.state.token)
            this.axios({
                method: 'post',
                url: this.$store.state.baseurl+'/api/searchhis/find',
                headers: {
                    token: this.$store.state.token
                },
                data: {
                },
                crossDomain: true
            }).then(body => {
                console.log(body.data.data)
            })

        }
    }
</script>

<style scoped>

</style>
