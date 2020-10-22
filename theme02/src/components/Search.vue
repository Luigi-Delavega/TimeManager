<template>
  <div class="Search mt-5">
    <div class="center content-inputs">
      <label>  
        <small>  Rechercher par nom ou par email</small> 
      </label>
      <vs-input
        type="text"
        v-model="query"
        @keyup="getResult(query)"
        placeholder="Search"
      />
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "search",
  data() {
    return {
      query: "",
    };
  },
  methods: {
    getResult(query) {
      axios
        .get("http://localhost:4000/api/users?username=" + query + "&email=")
        .then((response) => {
          this.results = response.data.results;
        });
      console.log(query);
    },
  },
};
</script>

<style lang="scss">

</style>