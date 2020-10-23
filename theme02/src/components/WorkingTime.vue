<template>
  <div class="mt-5 d-flex flex-column">
    <div class="mb-5 d-flex align-items-end">
      <div class="center content-inputs">
        <label>
          <small> Rechercher par start ou par end</small>
        </label>
        <vs-input
          type="text"
          v-model="query"
          @keyup="getResult(query)"
          placeholder="WorkingTime"
        />
      </div>
    </div>
    <WorkingTimes v-bind:workingtimes="workingtimes"/>
  </div>
</template>
<script>
import WorkingTimes from "./WorkingTimes";
import dataService from "../services/dataService";

export default {
  name: "workingtime",
  components: {
    WorkingTimes,
  },
  data() {
    return {
      query: "",
      dataService: dataService,
      workingtimes: []
    };
  },
  created: function () {
   dataService.getAllUsers().then((res) => {
      this.users = JSON.parse(JSON.stringify(res.data.data));
      this.workingtimes = this.users.forEach(user => {
        dataService.getAllWorkingTimesUser(user.id)
      });
      this.workingtimes = JSON.parse(JSON.stringify(res.data.data));
    });
  },
  methods: {
    getResult(query) {
      console.log(query); 
      // rajouter filtre start + end
    },
  },
};
</script>

<style lang="scss">
</style>