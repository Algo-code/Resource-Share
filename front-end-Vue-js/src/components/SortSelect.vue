<template>
    <div class="sort-container">
        <P class="sort-title">
            排序方式
        </P>
        <div class="my-2">
            <v-btn class="sort_option" :color="sort_option[index].color" elevation="0" @click="sortSelect(index, data.color)"
                   v-for="(data, index) in sort_option"
                   :key="index">
                <span style="color: white">{{data.title}}</span>
                <v-icon color="white" class="down-icon">mdi-chevron-down</v-icon>
            </v-btn>
        </div>
    </div>
</template>

<script>
    export default {
        name: "SortSelect",
        data: () => ({
            sort_option: [
                {
                    title: "发表时间",
                    color: '#ABABAB'
                },
                {
                    title: "被引数量",
                    color: '#ABABAB'
                },
                {
                    title: "影响因素",
                    color: '#ABABAB'
                },
            ]
        }),
        methods: {
            sortSelect: function(idx, btn_color) {
                console.log(this.sort_option[idx].color)
                this.sort_option[idx].color = (btn_color == '#ABABAB') ? 'blue' : '#ABABAB'
                this.$emit('listenToMyStepBoy', idx, btn_color)
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
