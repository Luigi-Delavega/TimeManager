<template>
  <div class="center">
    <vs-table>
      <template #thead>
        <vs-tr>
          <vs-th> Name </vs-th>
          <vs-th> Email </vs-th>
          <vs-th> Id </vs-th>
        </vs-tr>
      </template>
      <template #tbody>
        <vs-tr :key="i" v-for="(tr, i) in users">
          <vs-td>
            {{ tr.username }}
          </vs-td>
          <vs-td>
            {{ tr.email }}
          </vs-td>
          <vs-td>
            {{ tr.id }}
          </vs-td>

          <template #expand>
            <div class="con-content d-flex justify-content-end">
              <div class="d-flex align-items-end w-50">
                <vs-avatar>
                  <img
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRCDe5JZ_HkfuU5VFQDlF0j1jeCl-SCj_mJdA&usqp=CAU"
                  />
                </vs-avatar>
                <vs-input type="text" class="px-4 input" />
              </div>
              <div class="d-flex w-50 justify-content-end">
                <vs-button flat icon v-on:click="postClock(tr.id)">
                  <font-awesome-icon icon="clock" />
                </vs-button>

                <vs-button flat icon v-on:click="save(tr.id)">Save</vs-button>

                <vs-button border danger v-on:click="remove(tr.id)">
                  Remove User
                </vs-button>
              </div>
            </div>
          </template>
        </vs-tr>
      </template>
    </vs-table>
  </div>
</template>

<script>
import dataService from "../services/dataService";
// import axios from "axios";
// import { devServer } from "../../vue.config";

export default {
  name: "Users",
  props: ["users"],
  methods: {
    remove(userID) {
      dataService.removeUser(userID);
      var index = this.users.findIndex((x) => x.id === userID);
      this.users.splice(index, 1);
    },
    save(userID) {
      var query = document.querySelector(".input input").value;
      dataService.UpdateUser(userID, query);
      document.querySelector(".isExpand").click();
      this.users.find((x) => x.id === userID).username = query;
    },
    postClock(id) {
      var d = new Date(),
        dformat =
          [
            (d.getFullYear() + 1).padLeft(),
            d.getMonth().padLeft(),
            d.getDate(),
          ].join("-") +
          " " +
          [
            d.getHours().padLeft(),
            d.getMinutes().padLeft(),
            d.getSeconds().padLeft(),
          ].join(":");

      dataService.getClock(id)
      .then((clock) => {
        var l = clock.data.data.length
        console.log(clock.data.data);

        if (clock.data.data.status == false ) {
          dataService.PostClock(id, dformat, true)
            console.log("ok2");
        }
        else if (clock.data.data.status == true) {
          dataService.PostClock(id, dformat, false)
            console.log("ok1");
        }
        else {
          dataService.PostClock(id, dformat, true)
            console.log("ok3");

        }
      })
    },
  },
  data: () => ({
    dataService: dataService,
    query: "",
  }),
};
Number.prototype.padLeft = function (base, chr) {
  var len = String(base || 10).length - String(this).length + 1;
  return len > 0 ? new Array(len).join(chr || "0") + this : this;
};
</script>

<style>
.vs-button--icon .vs-button__content {
  padding: 8px 12px !important;
}
.active {
  display: initial !important;
}
.toggle {
  display: none !important;
}
</style>
        