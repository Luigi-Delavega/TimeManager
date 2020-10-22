<template>
  <div class="hidden">
    <vs-sidebar absolute hover-expand reduce open>
      <template #logo>
        <img
          src="https://newsroom.ionis-group.com/wp-content/uploads/2018/12/epitech-logo-quadri-baseline-anglais.png"
        />
      </template>
      <vs-sidebar-item id="dashboard">
        <template #icon>
          <font-awesome-icon icon="chart-line" />
        </template>
        <router-link :to="{ path: 'dashboard' }">Dashboard</router-link>
      </vs-sidebar-item>
      <vs-sidebar-item id="search">
        <template #icon>
          <font-awesome-icon icon="chart-line" />
        </template>
        <router-link :to="{ path: 'search' }">Manage users</router-link>
      </vs-sidebar-item>
      <vs-sidebar-item id="market">
        <template #icon>
          <font-awesome-icon icon="chart-line" />
        </template>
        <router-link :to="{ path: 'create' }">Create user</router-link>
      </vs-sidebar-item>
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
