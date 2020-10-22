<template>
  <section class="parent">
    <h1>{{title}}</h1>
    <router-view></router-view>
  </section>
</template>

<script>
import dataService from "../services/dataService";

export default {
  name: 'Dashboard',
  data() {
    return {
      title: 'Dashboard',
      users: [],
      dataService: dataService
    }
  },
  created() {
    this.users = dataService.getAllUsers();
  }
};
</script>

<style scoped>
</style>
