<template>
    <div class="container">
        <v-btn text class="btn-class" :color="btn1_color" @click="selectBtn(1)">
            <span style="font-size: 16px">文献</span>
        </v-btn>

        <v-btn text class="btn-class" :color="btn2_color" @click="selectBtn(2)">
            <span style="font-size: 16px">作者</span>
        </v-btn>
        <div style="width: 650px"></div>
    </div>
</template>

<script>
    export default {
        name: "SearchClass",
        data: () => ({
            btn1_color: 'blue',
            btn2_color: 'black',
            user_op: false
        }),
        methods: {
            selectBtn: function (id) {
                if(id == 1){
                    this.btn1_color = (this.btn1_color == 'black') ? 'blue' : 'black'
                    if(this.btn1_color == 'blue'){
                        this.btn2_color = 'black'
                        this.user_op = false
                    }
                }
                else if(id == 2){
                    this.btn2_color = (this.btn2_color == 'black') ? 'blue' : 'black'
                    if(this.btn2_color == 'blue'){
                        this.btn1_color = 'black'
                        this.user_op = true
                    }
                }
                this.$emit('listenToMyBoy', this.user_op)
            }
        }
    }
</script>

<style scoped>
    .container{
        height: 40px;
        background: white;
        width: 950px
    }
    .btn-class{
        margin-left: 20px;
        margin-top: -10px;
    }

</style>
