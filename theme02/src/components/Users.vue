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
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRCDe5JZ_HkfuU5VFQDlF0j1jeCl-SCj_mJdA&usqp=CAU">
                  </vs-avatar>
                <p class="px-4">
                  {{ tr.username }}
                </p>
              </div>
              <div class="d-flex w-50 justify-content-end">
                <vs-button flat icon>
                  <font-awesome-icon icon="clock" />
                </vs-button>
                <vs-button flat icon> Edit </vs-button>
                <vs-button border danger> Remove User </vs-button>
              </div>
            </div>
          </template>
        </vs-tr>
      </template>
    </vs-table>
  </div>
</template>

<script>
export default {
  name: "Users",
	props: ['users'],

  data: () => ({
    editActive: false,
    edit: null,
    editProp: "",
    search: "",
    allCheck: false,
    page: 1,
    max: 3,
    active: 0,
    selected: [], 
  }),
};
</script>

<style>
	.vs-button--icon .vs-button__content {
		padding: 8px 12px !important;
	}
</style>
        