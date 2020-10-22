<template>
  <div class="mt-5 d-flex align-items-end">

    <div class="center content-inputs">
      <label>
        <small>Create a WorkingTime</small>
      </label>
      <vs-input
        type="text"
        v-model="userID"
        @keyup="createWorkingtime(userID)"
        placeholder="Search"
      />
    </div>
    <div class="center content-inputs">
      <label>
        <small>Update a WorkingTime</small>
      </label>
      <vs-input
        type="text"
        v-model="ID"
        @keyup="updateWorkingtime(ID)"
        placeholder="Search"
      />
    </div>
    <div class="center content-inputs">
      <label>
        <small>Delete a WorkingTime</small>
      </label>
      <vs-input
        type="text"
        v-model="ID"
        @keyup="deleteWorkingtime(ID)"
        placeholder="Search"
      />
    </div>
    <!-- <div style="height: fit-content">
      <vs-button
        flat
        :active="active == 1"
        @click="active = 1"
        v-on:click="getOneWorkingtime()"
      >
        Get one WorkingTime
      </vs-button>
    </div> -->

    <div style="height: fit-content">
      <vs-button
        flat
        :active="active == 1"
        @click="active = 1"
        v-on:click="getOneWorkingtime()"
      >
        Get one WorkingTime
      </vs-button>
    </div>

    <div class="center content-inputs">
      <label>
        <small> Get one WorkingTime</small>
      </label>
      <vs-input
        type="text"
        v-model="query"
        @keyup="getOneWorkingtime(query)"
        placeholder="Search"
      />
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "workingtime",
  data() {
    return {
      query: "",
      results: []
    };
  },
  methods: {
    createWorkingtime(userID) {
      axios
        .post("http://localhost:4000/api/workingtimes/" + userID)
        .then((res) => {
          this.results = res.data.results;
        });
      console.log(userID);
    },
    updateWorkingtime(ID) {
      axios
        .put("http://localhost:4000/api/workingtimes/" + ID)
        .then((res) => {
          this.results = res.data.results;
        });
      console.log(ID);
    },
    deleteWorkingtime(ID) {
      axios
        .delete("http://localhost:4000/api/workingtimes/" + ID)
        .then((res) => {
          this.results = res.data.results;
        });
      console.log(ID);
    },
    getOneWorkingtime(userID, ID) {
      axios
        .get("http://localhost:4000/api/workingtimes/"+ userID + "/" + ID)
        .then((res) => {
          this.results = res.data.results;
        });
      console.log(userID + "/" + ID);
    },
  },
};
</script>

<style lang="scss">
</style>