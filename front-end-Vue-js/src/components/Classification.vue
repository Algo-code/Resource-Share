<template>
    <div class="sort-container">
        <P class="sort-title">
            关键词
        </P>
        <div class="my-2">
            <v-btn class="sort_option" color="#ABABAB" elevation="0" @click="sortSelect(index, data.color)"
                   v-for="(data, index) in sort_option"
                   :key="index">
                <span style="color: white">{{data}}&nbsp&nbsp{{data.num}}</span>
            </v-btn>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Classification",
        data: () => ({

        }),
        methods: {
            sortSelect: function(idx, btn_color) {
                console.log(this.sort_option[idx].color)
                this.sort_option[idx].color = (btn_color == '#ABABAB') ? 'blue' : '#ABABAB'
            }
        },
        props:['sort_option', 'flag'],

        watch: {
            sort_option: function (newVal, oldVal) {
                console.log("sort#############", newVal)
            }
        }
    }
</script>

<style scoped>
    .sort-container{
        padding: 20px;
        background: white;
        width: 95%;
    }
    .sort-title{
        font-size: 20px;
        color:black;
        margin-bottom: -10px;
    }
    .sort_option{
        margin-right: 15px;
        margin-top: 20px;
    }
    .down-icon{
        width: 8px;
        margin-left: 10px;
        margin-right: -5px;
    }
</style>
