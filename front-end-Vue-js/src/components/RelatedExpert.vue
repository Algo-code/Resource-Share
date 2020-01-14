<template>
    <div class="related-expert-container">
        <P class="expert-title">
            相关专家
        </P>
        <v-row justify="center">
            <v-col class="expert-inf" v-for="(data, index) in experts"
                   :key="index" align-self="center" @click="">
                <v-row justify="start">
                    <v-img
                            class="expert-avatar"
                            src= "../img/avatar.jpeg"
                            @click="goToSpecialist(data.ID)"
                    >
                    </v-img>
                </v-row>
                <v-row justify="start">
                    <v-col class="expert-name">{{data.Realname}}</v-col>
                </v-row>
            </v-col>
        </v-row>
    </div>
</template>

<script>
    export default {
        name: "RelatedExpert",
        data () {
            return {
            }
        },
      props: {
        experts: {
          default:[{
            ID: 1,
            Realname: "王卫红",
            WorkPlace: "浙江工业大学",
            WorkHistory: "",
            Introduction: "浙江工业大学成员",
            Field: ['计算机软件及计算机应用', '自动化技术', '高等教育'],
            Email: "a9214863@sina.com",
            Hindex: 1,
            AuthorType: 1
          },
            {
            ID: 2,
            Realname: "王园",
            WorkPlace: "集美大学",
            WorkHistory: "",
            Introduction: "集美大学成员",
            Field: ['经济体制改革', '宏观经济管理与可持续发展', '海洋学'],
            Email: "a9214863@sina.com",
            Hindex: 4,
            AuthorType: 2
          }]
        }
      },
        methods: {
          goToSpecialist: function(id) {
            this.$router.push({ name: 'special', params: { specialistId : id }})
          }
        }

    }
</script>

<style scoped>
    .related-expert-container{
        background: white;
        width: 95%;
    }
    .expert-title{
        padding-top: 20px;
        padding-left: 20px;
        font-size: 20px;
        color:black;
    }
    .expert-avatar{
        border-radius: 50%;
        max-width: 50px;
        margin-left: 15px;
    }
    .expert-name{
        color: gray;
        width: 70px;
        font-size: 14px;
        align-items: center;
        margin-left: 10px;
        display: flex;
        justify-content: left;
    }
    .expert-inf{
        margin-left: 20px;
        margin-right: 20px;
        width: 70px;
    }
</style>
