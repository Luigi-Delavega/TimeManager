<template>
  <div id="app">
    <Menu />
    <b-row>
      <b-col>
      </b-col>
      <b-col cols="11">
        <router-view></router-view>
      </b-col>
    </b-row>
  </div>
</template>

<script>
import Menu from "./components/Menu/";

export default {
  name: "App",
  components: {
    Menu,
  },
};
</script>

<style scoped>
  #app, 
  #app > .row,
   #app > .row > .col {
    height: 100vh;
  }
</style>

