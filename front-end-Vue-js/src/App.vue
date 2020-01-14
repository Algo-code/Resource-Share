<template>
  <v-app>
    <NavBar />
    <div class="app-container">
      <router-view style="min-height: 85vh;"/>
    </div>
    <Footer />
  </v-app>
</template>

<script>
import HelloWorld from "./components/HelloWorld";
import NavBar from "./components/NavBar";
import SearchField from "./components/SearchField";
import SearchClass from "./components/SearchClass";
import LiteratureCard from "./components/LiteratureCard";
import SearchHistory from "./components/SearchHistory";
import SortSelect from "./components/SortSelect";
import Classification from "./components/Classification";
import RelatedExpert from "./components/RelatedExpert";
import SearchResult from "./views/SearchResult";
import Sepicalist from "./views/specialist";
import LoginRegister from "./views/LoginRegister";
import Geet from "./components/Geet";
import Gtpage from "./components/GtPage";
import BackGroundPic from "./components/BackGroundPic";
import User from "./views/User";
import Application from "./components/Application"
import UserManageCard from "./components/UserManageCard"
import BKManage from "./views/BKManage"
import UserNotice from "./views/UserNotice"
import Identification from "./views/Identification";
import Footer from "./components/Footer";

export default {
  name: "App",

  components: {
    Identification,
    Application,
    NavBar,
    HelloWorld,
    SearchField,
    SearchClass,
    LiteratureCard,
    SearchHistory,
    SortSelect,
    Classification,
    RelatedExpert,
    SearchResult,
    Sepicalist,
    User,
    LoginRegister,
    Geet,
    Gtpage,
    BackGroundPic,
    UserManageCard,
    BKManage,
    UserNotice,
    Footer
  },

  data: () => ({
    //
  })
};
</script>

<style scoped>
.app-container {
  background: rgba(0, 159, 255, 0.03);
}
</style>
