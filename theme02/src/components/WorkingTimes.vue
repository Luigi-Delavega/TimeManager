<template>
  <div class="mt-5 d-flex align-items-end">
    <div style="height: fit-content">
      <vs-button
        flat
        :active="active == 1"
        @click="active = 1"
        v-on:click="getWorkingTimes()"
      >
        List all working times
      </vs-button>
    </div>

    <div class="center content-inputs">
      <label>
        <small> Rechercher par ID de WorkingTime</small>
      </label>
      <vs-input
        type="text"
        v-model="query"
        @keyup="getResult(userID)"
        placeholder="Search"
      />
      <label>
        <small> Rechercher début de WorkingTime</small>
      </label>
      <vs-input
        type="text"
        v-model="query"
        @keyup="getResult(start)"
        placeholder="Search"
      />
      <label>
        <small> Rechercher par fin de WorkingTime</small>
      </label>
      <vs-input
        type="text"
        v-model="query"
        @keyup="getResult(end)"
        placeholder="Search"
      />
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "workingtimes",
  data() {
    return {
      query: "",
      results: []
    };
  },
  methods: {
    getWorkingTimes() {
      axios
        .get("http://localhost:4000/api/workingtimes")
        .then((res) => {
          this.results = JSON.parse(JSON.stringify(res.data.data));
          console.log(JSON.parse(JSON.stringify(res.data.data)));
        });
    },
    getResult(userID, start, end) {
      axios
        .get("http://localhost:4000/api/workingtimes/" + userID + "?start=" + start + "&end=" + end)
        .then((res) => {
          this.results = res.data.results;
        });
      console.log(userID + "?start=" + start + "&end=" + end);
    },
  },
};
</script>

<style lang="scss">
</style>