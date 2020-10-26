import Vue from "vue";
import Router from "vue-router";
import Dashboard from "./components/Dashboard";
import ManageUsers from "./components/manageUsers/ManageUsers";
import Create from "./components/manageUsers/Create";
import ManageWorkingTimes from "./components/workingtimes/ManageWorkingTimes";

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
      path: "/manage-users",
      name: "ManageUsers",
      component: ManageUsers,
      meta: {
        label: "Manage-users"
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
      path: "/manage-working-times",
      name: "ManageWorkingTimes",
      component: ManageWorkingTimes,
      meta: {
        label: "ManageWorkingTimes"
      }
    }
  ]
});