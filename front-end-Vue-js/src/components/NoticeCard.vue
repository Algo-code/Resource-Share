<template>
    <v-card
            class="mx-auto"
            max-width="800"
            outlined
            style="padding: 5px"
    >
        <v-list-item three-line>
            <v-list-item-content>
                <div class="notice-name">你关注的 {{notice_from_name}} 发表了新文献</div>
                <div class="notice-from">《关于如何利用团队尽快肝完项目》</div>
            </v-list-item-content>
            <div class="notice-date">
                2019-09-04 22:00
            </div>
            <div class="get-more-filed">
                <v-btn
                        large
                        tile
                        elevation="0"
                        color="#03A9F4"
                        class="get-more-btn"
                >查看</v-btn>
            </div>

        </v-list-item>
    </v-card>
</template>

<script>
    export default {
        name: "NoticeCard",
        data(){
            return {
                notice_from_name: '一个人'
            }
        },
        props: {
            msg_id: {
                default: ''
            },
        }
    }
</script>

<style scoped>
    .notice-name{
        font-size: 19px;
    }
    .notice-from{
        font-size: 15px;
        color: gray;
    }
    .notice-date{
        margin-top: 40px;
        margin-right: 12px;
        color: gray;
    }
    .get-more-filed{
        margin-right: 20px;
        text-align: center;
        font-size: 14px;
    }
    .get-more-btn{
        color: white;
        margin: auto -10px auto 10px;
        width: 140px;
        height: 40px;
    }
</style>
