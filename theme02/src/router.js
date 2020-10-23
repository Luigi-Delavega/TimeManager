import Vue from "vue";
import Router from "vue-router";
import Dashboard from "./components/Dashboard";
import Search from "./components/Search";
import Create from "./components/Create";
import WorkingTime from "./components/WorkingTime";

Vue.use(Router);

export default new Router({
  routes: [
    { path: "/", redirect: { name: "Dashboard" } },
    {
      path: "/dashboard",
      name: "Dashboard",
      component: Dashboard,
      meta: {
        label: "Dashboard"
      }
    },
    {
      path: "/search",
      name: "Search",
      component: Search,
      meta: {
        label: "Search"
      }
    },
    {
      path: "/create",
      name: "Create",
      component: Create,
      meta: {
        label: "Create"
      }
    },
    {
      path: "/workingtime",
      name: "WorkingTime",
      component: WorkingTime,
      meta: {
        label: "WorkingTime"
      }
    }
  ]
});