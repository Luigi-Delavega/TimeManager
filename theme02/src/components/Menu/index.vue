<template>
  <div class="hidden">
    <vs-sidebar fixed hover-expand reduce v-model="active" open>
      <template #logo>
        <img
          src="https://newsroom.ionis-group.com/wp-content/uploads/2018/12/epitech-logo-quadri-baseline-anglais.png"
        />
      </template>
      <router-link :to="{ path: 'dashboard' }">
        <vs-sidebar-item id="dashboard">
          <template #icon>
            <font-awesome-icon icon="chart-line" />
          </template>
          Dashboard
        </vs-sidebar-item>
      </router-link>
      <router-link :to="{ path: 'search' }">
        <vs-sidebar-item id="search">
          <template #icon>
            <font-awesome-icon icon="chart-line" />
          </template>
          Manage users
        </vs-sidebar-item>
      </router-link>
      <router-link :to="{ path: 'create' }">
        <vs-sidebar-item id="market">
          <template #icon>
            <font-awesome-icon icon="chart-line" />
          </template>
          Create user
        </vs-sidebar-item>
      </router-link>
      <router-link :to="{ path: 'workingtime' }">
        <vs-sidebar-item id="market">
          <template #icon>
            <font-awesome-icon icon="chart-line" />
          </template>
          Manage WorkingTime
        </vs-sidebar-item>
      </router-link>
    </vs-sidebar>
  </div>
</template>

<script>
export default {
  name: "Menu",
  computed: {
    routes() {
      return this.$router.options.routes;
    },
  },
};
</script>

<style lang="scss">
button:focus {
  outline: 0 !important;
  outline: unset;
}
</style>