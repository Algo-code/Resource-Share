<template>
    <v-card
            class="mx-auto"
            max-width="800"
            outlined
            style="padding: 5px"
    >
        <v-list-item three-line>
            <v-list-item-content>
                <div class="notice-name">{{realname}}</div>
                <div class="notice-from">{{eduexp}}</div>
            </v-list-item-content>
            <div class="notice-date">
                {{date.slice(0, 10)}}
            </div>
            <div class="get-more-filed">
                <v-btn
                        large
                        tile
                        elevation="0"
                        color="#03A9F4"
                        class="get-more-btn"
                        v-on:click="gotoSpecialview"
                >查看详情</v-btn>
            </div>

        </v-list-item>
    </v-card>
</template>

<script>
    export default {
        name: "Application",
        props: {
            id: {
                default: 3
            },
            realname: {
                default: "Whatever English Name"
            },
            eduexp: {
                default: "Massachusetts Institute of Technology - School of Engineering"
            },
            date: {
                default: "2019-09-04 22:00"
            }
        },
        methods: {
            gotoSpecialview: function() {
                var id = this.id
                this.$router.push({
                    name: 'specialview',
                    params: {
                        id: this.id
                    }
                })
            }
        },
        mounted() {
            var that = this
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
