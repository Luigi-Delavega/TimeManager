<template>
  <div class="center">
    <vs-table>
      <template #thead>
        <vs-tr>
          <vs-th> Start </vs-th>
          <vs-th> End </vs-th>
          <vs-th> Id </vs-th>
        </vs-tr>
      </template>
      <template #tbody>
        <vs-tr :key="i" v-for="(tr, i) in workingtimes">
          <vs-td>
            {{ tr.start }}
          </vs-td>
          <vs-td>
            {{ tr.end }}
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
                <!-- <vs-button flat icon v-on:click="postClock(tr.id)">
                  <font-awesome-icon icon="clock" />
                </vs-button> -->

                <vs-button flat icon v-on:click="save(tr.id)">Save</vs-button>

                <vs-button border danger v-on:click="remove(tr.id)">
                  Remove WorkingTime
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

export default {
  name: "WorkingTime",
  props: ["workingtime"],
  methods: {
    remove(userID) {
      dataService.removeWorkingTime(userID);
      var index = this.workingtimes.findIndex((x) => x.id === userID);
      this.workingtimes.splice(index, 1);
    },
    // save(userID) {
    //   var query = document.querySelector(".input input").value;
    //   dataService.UpdateWorkingTime(userID, start, end);
    //   document.querySelector(".isExpand").click();
    //   this.workingtimes.find((x) => x.id === userID).start = start;
    //   this.workingtimes.find((x) => x.id === userID).end = end;
    // },
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
        