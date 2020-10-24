<template>
  <section class="parent mr-5" >
    <h1>{{ title }}</h1>
    <b-row>
      <b-col cols="5">
        <div class="m-card donut" v-bind:class="{ nodata: !hasWorkingTime }">
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
        <div class="m-card bar" v-bind:class="{ nodata: !hasWorkingTime }">
          <bar-chart
            id="bar"
            :data="lineChartData"
            line-colors='[ "#FF6384", "#36A2EB" ]'
            xkey="day"
            ykeys='[ "day", "v"]'
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
        <div class="m-card line" v-bind:class="{ nodata: !hasWorkingTime }">
          <line-chart
            id="line"
            :data="lineChartData"
            line-colors='[ "#FF6384", "#36A2EB" ]'
            xkey="day"
            ykeys='[ "day", "v"]'
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
    <div class="m-card area" v-bind:class="{ nodata: !hasWorkingTime }">
      <vs-input
        shadow
        type="text"
        v-model="query"
        @keyup="getUserGraph(query)"
        placeholder="Username"
        v-if="hasWorkingTime"
      />
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
      barChartData: [],
      lineChartData: [],
      donutData: []
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
      this.users = res.data.data;
      this.usersNumber = res.data.data.length;
    });
    dataService.getAllWorkingTimes().then((res) => {
      let data = res.data.data;
      this.graph_data_all(data)
      this.hasWorkingTime = true;
      // donutData Les 3 employés avec le plus de temps de travail
      var userID,
        user = JSON.parse(JSON.stringify(this.users)),
        start,
        end,
        hours = [],
        maxHours = [],
        nb;
      data.forEach((wt) => {
        hours.push({
          id: wt.user_id,
          h: this.getHours(wt.start, wt.end),
        });
      });
      for (let i = 0; i < user.length; i++) {
        nb = hours
          .filter((x) => x.id === user[i].id)
          .map((x) => x.h)
          .reduce((a, b) => a + b, 0);
        maxHours.push({
          id: user[i].id,
          h: nb,
        });
      }
      let values = maxHours.sort((a, b) => {
        return b.h - a.h;
      });
      for (let i = 0; i < 3; i++) {
        this.donutData.push({
          label: "User id: " + maxHours[i].id.toString(),
          value: values[i].h,
        });
      }
    });
  },
  methods: {
    ms_to_h(ms) {
      return Math.floor(ms / 1000 / 60 / 60);
    },
    workedHours() {},
    graph_data_area(data) {
      var start, end, ms, d, day;
      data.forEach((e) => {
        // Formate le temps pour momoJS 
        ms = Date.parse(e.end) - Date.parse(e.start);
        d = new Date(e.start);
        day =
          d.getUTCFullYear() +
          "-" +
          d.getUTCMonth() +
          "-" +
          d.getUTCDate() +
          " " +
          d.getUTCHours() +
          ":00";
        this.areaChartData.push({
          day: day,
          v: this.ms_to_h(ms),
        });
      });
    },
    getUserGraph(name) {
      dataService.getUserByName(name).then((res) => {
        dataService.getWorkingTime(res.data.data.id).then((res) => {
          this.hasWorkingTime = true;
          this.graph_data_area(res.data.data);
        });
      })
    },
    getHours(start, end) {
      return this.ms_to_h(Date.parse(end)) - this.ms_to_h(Date.parse(start));
    },
    graph_data_all(data) {
      console.log(data);
        var start, end, ms, d, day;
        data.forEach((e) => {
          // Formate le temps pour momoJS 
          ms = Date.parse(e.end) - Date.parse(e.start);
          d = new Date(e.start);
          day =
            d.getUTCFullYear() +
            "-" +
            d.getUTCMonth() +
            "-" +
            d.getUTCDate() +
            " " +
            d.getUTCHours() +
            ":00";
          this.lineChartData.push({
            day: day,
            v: this.ms_to_h(ms),
          });
        })
      }
  },
};
</script>

<style lang="scss">
.m-card {
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
  transition: 0.3s;
  &.nodata {
    min-height: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  &:hover {
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
  }
}
</style>