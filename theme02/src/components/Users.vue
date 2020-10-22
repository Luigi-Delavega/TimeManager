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
                <vs-input
                  @keyup="test(query)"
                  type="text"
                  class="px-4 input"
                />
              </div>
              <div class="d-flex w-50 justify-content-end">
                <vs-button flat icon>
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

export default {
  name: "Users",
  props: ["users"],
  methods: {
    remove(userID) {
      dataService.removeUser(userID);
      var index = this.users.findIndex((x) => x.id === userID);
      this.users.splice(index, 1);
    },
    test(query) {
      // this.query = query
      console.log(query);
    },
    save(userID) {
      var query = document.querySelector('.input input').value
      dataService.UpdateUser(userID, query)
      document.querySelector(".isExpand").click()
      this.users.find(x => x.id === userID).username = query;
    },
  },
  data: () => ({
    dataService: dataService,
    query: "",
  }),
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
        