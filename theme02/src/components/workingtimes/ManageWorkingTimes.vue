<template>
  <div class="mt-5 d-flex flex-column">
    <WorkingTimesTab v-bind:workingtimes="workingtimes"/>
  </div>
</template>
<script>
import WorkingTimesTab from "./WorkingTimesTab";
import dataService from "../../services/dataService";

export default {
  name: "ManageWorkingTimes",
  components: {
    WorkingTimesTab,
  },
  data() {
    return {
      dataService: dataService,
      workingtimes: [],
    };
  },
  created: function () {
   dataService.getAllWorkingTimes().then((res) => {
      this.wt = JSON.parse(JSON.stringify(res.data.data));
      this.workingtimes = this.wt.forEach(user => {
        dataService.getAllWorkingTimesUser(user.id)
      });
      this.workingtimes = JSON.parse(JSON.stringify(res.data.data));
    });
  },
  methods: {

  },
};
</script>

<style lang="scss">

</style>