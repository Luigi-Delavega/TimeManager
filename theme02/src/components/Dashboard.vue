<template>
  <section class="parent">
    <h1>{{title}}</h1>
    <line-chart
            id="line"
            :data=lineChartData
            line-colors='[ "#FF6384", "#36A2EB" ]'
            xkey="year"
            ykeys='[ "a", "b"]'
            grid="true"
            grid-text-weight="bold"
            resize="true">
    </line-chart>
    <router-view></router-view>
  </section>
</template>

<script>
import dataService from "../services/dataService";
import Raphael from 'raphael/raphael'
global.Raphael = Raphael
import { LineChart } from 'vue-morris'

export default {
  name: 'Dashboard',
  data() {
    return {
      title: 'Dashboard',
      users: [],
      dataService: dataService,
      lineChartData: [
        {year: "2013", a: 10, b: 5 },
        {year: "2014", a: 40, b: 15 },
        {year: "2015", a: 20, b: 25 },
        {year: "2016", a: 30, b: 20 },
      ],
    }
  },
  components: {
    LineChart
  },
  created() {
    dataService.getAllUsers().then((res) => {
      this.users = res;
      console.log(this.users);
    });
  }
};
</script>

<style scoped>
</style>
