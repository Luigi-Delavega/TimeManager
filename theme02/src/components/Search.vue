<template>
  <div class="mt-5 d-flex flex-column">
    <div class="mb-5 d-flex align-items-end">
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
    <Users v-bind:users="users"/>
  </div>
</template>
<script>
import Users from "./Users";
import dataService from "../services/dataService";

export default {
  name: "search",
  components: {
    Users,
  },
  data() {
    return {
      query: "",
      dataService: dataService,
      users: []
    };
  },
  created: function () {
   dataService.getAllUsers().then((res) => {
      this.users = JSON.parse(JSON.stringify(res.data.data));
    });
  },
  methods: {
    getResult(query) {
      console.log(query);
      // axios
      //   .get("http://localhost:4000/api/users?username=" + query + "&email=")
      //   .then((res) => {
      //     this.results = JSON.parse(JSON.stringify(res.data.data));
      //     console.log(JSON.parse(JSON.stringify(res.data.data)));
      //   });
    },
  },
};
</script>

<style lang="scss">
</style>