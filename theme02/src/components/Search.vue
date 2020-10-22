<template>
  <div class="mt-5 d-flex align-items-end">
    <div style="height: fit-content">
      <vs-button
        flat
        :active="active == 1"
        @click="active = 1"
        v-on:click="getAllUsers()"
      >
        List all users
      </vs-button>
    </div>

    <div class="center content-inputs">
      <label>
        <small> Rechercher par nom ou par email</small>
      </label>
      <vs-input
        type="text"
        v-model="query"
        @keyup="getResult(query)"
        placeholder="Search"
      />
    </div>
  </div>
  <!-- <User /> -->
</template>
<script>
import axios from "axios";
// import Users from "./Users";

export default {
  name: "search",
  data() {
    return {
      query: "",
      results: []
    };
  },
  methods: {
    getAllUsers() {
      axios
        .get("http://localhost:4000/api/users/1")
        .then((res) => {
          this.results = JSON.parse(JSON.stringify(res.data.data));
          console.log(JSON.parse(JSON.stringify(res.data.data)));
        });
    },
    getResult(query) {
      axios
        .get("http://localhost:4000/api/users?username=" + query + "&email=")
        .then((res) => {
          this.results = res.data.results;
        });
      console.log(query);
    },
  },
};
</script>

<style lang="scss">
</style>