<template>
  <section class="parent">
    <h1>{{ title }}</h1>
    <b-row>
      <b-col cols="5">
        <div class="m-card donut">
          <donut-chart
            id="donut"
            :data="donutData"
            colors='[ "#FF6384", "#36A2EB", "#FFCE56" ]'
            resize="true"
            v-if="hasWorkingTime"
          >
          </donut-chart>
          <div class="text-center" v-else>
            <b-spinner variant="primary" label="Text Centered"></b-spinner>
          </div>
        </div>
      </b-col>
      <b-col cols="7">
        <div class="m-card bar">
          <bar-chart
            id="bar"
            :data="lineChartData"
            line-colors='[ "#FF6384", "#36A2EB" ]'
            xkey="day"
            ykeys='[ "a", "b"]'
            grid="true"
            grid-text-weight="bold"
            resize="true"
             v-if="hasWorkingTime"
          >
          </bar-chart>
          <div class="text-center" v-else>
            <b-spinner variant="primary" label="Text Centered"></b-spinner>
          </div>
        </div>
      </b-col>
    </b-row>
    <b-row class="my-4">
      <b-col>
        <div class="m-card line">
          <line-chart
            id="line"
            :data="lineChartData"
            line-colors='[ "#FF6384", "#36A2EB" ]'
            xkey="day"
            ykeys='[ "a", "b"]'
            grid="true"
            grid-text-weight="bold"
            resize="true"
             v-if="hasWorkingTime"
          >
          </line-chart>
          <div class="text-center" v-else>
            <b-spinner variant="primary" label="Text Centered"></b-spinner>
          </div>
        </div>
      </b-col>
    </b-row>
    <div class="m-card area">
      <area-chart
        id="area"
        :data="areaChartData"
        line-colors='[ "#FF6384"]'
        xkey="day"
        ykeys='["v"]'
        grid="true"
        grid-text-weight="bold"
        resize="true"
         v-if="hasWorkingTime"
      >
      </area-chart>
      <div class="text-center" v-else>
            <b-spinner variant="primary" label="Text Centered"></b-spinner>
          </div>
    </div>
    <router-view></router-view>
  </section>
</template>

<script>
import dataService from "../services/dataService";
import Raphael from "raphael/raphael";
global.Raphael = Raphael;
import { DonutChart, LineChart, AreaChart, BarChart } from "vue-morris";

export default {
  name: "Dashboard",
  data() {
    return {
      title: "Dashboard",
      hasWorkingTime: false,
      users: [],
      dataService: dataService,
      areaChartData: [],
      donutData: [
        { label: "Red", value: 300 },
        { label: "Blue", value: 50 },
        { label: "Yellow", value: 100 },
      ],
    };
  },
  components: {
    DonutChart,
    LineChart,
    AreaChart,
    BarChart,
  },
  created() {
    dataService.getAllUsers().then((res) => {
      this.users = res;
    });
    //  dataService.getWorkingTime(1) By id need to implement search
    dataService.getWorkingTime(1).then((res) => {
      this.hasWorkingTime = true
      console.log("ok");
      this.graph_data(res.data.data);
    });
  },
  methods: {
    ms_to_h(ms) {
      return Math.floor(ms / 1000 / 60 / 60);
    },
    graph_data(data) {
      var start, end, ms, d, day;
      console.log(data);
      data.forEach(e => {
          ms = Date.parse(e.end) - Date.parse(e.start);
          d = new Date(e.start)
          day = d.getUTCFullYear() + "-" + d.getUTCMonth() + "-" + d.getUTCDate() + " " + d.getUTCHours() + ":00"
          this.areaChartData.push({
            day: day,
            v: this.ms_to_h(ms)
          })
      });
    },
  },
};
</script>

<style lang="scss">
.m-card {
  /* Add shadows to create the "card" effect */
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
  min-height: 300px;
  transition: 0.3s;
    display: flex;
    justify-content: center;
    align-items: center;  
  &:hover {
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
  }
}
</style>
