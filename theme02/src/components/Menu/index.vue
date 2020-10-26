<template>
  <div class="hidden">
    <vs-sidebar class="sidebar" fixed open reduce hover-expand>
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
      <router-link :to="{ path: 'manage-users' }">
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
      <router-link :to="{ path: 'manage-working-times' }">
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
.sidebar a {
  position: relative;
}
.sidebar a:hover button:after {
    content: "";
    position: absolute;
    left: 4px;
    top: 0px;
    width: 10px;
    height: 100%;
    background: rgba(var(--vs-color), 1);
    border-radius: 0px 20px 20px 0px;
    -webkit-transform: translate(-6px);
    transform: translate(-6px);
    -webkit-transition: all 0.25s ease;
    transition: all 0.25s ease;
    z-index: 60;}
</style>