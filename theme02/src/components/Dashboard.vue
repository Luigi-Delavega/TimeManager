<template>
  <section class="parent">
    <h1>{{title}}</h1>
    <donut-chart
            id="donut"
            :data="donutData"
            colors='[ "#FF6384", "#36A2EB", "#FFCE56" ]'
            resize="true">
    </donut-chart>
    <router-view></router-view>
  </section>
</template>

<script>
import dataService from "../services/dataService";
import Raphael from 'raphael/raphael'
global.Raphael = Raphael
import { DonutChart } from 'vue-morris'

export default {
  name: 'Dashboard',
  data() {
    return {
      title: 'Dashboard',
      users: [],
      dataService: dataService,
      donutData: [
        {label: 'Red', value: 300},
        {label: 'Blue', value: 50},
        {label: 'Yellow', value: 100}
      ],
    }
  },
  components: {
    DonutChart
  },
  created() {
    this.users = dataService.getAllUsers();
  }
};
</script>

<style scoped>
</style>
