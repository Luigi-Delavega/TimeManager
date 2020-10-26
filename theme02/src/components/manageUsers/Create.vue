<template>
  <section class="Create mt-5">
    <b-container class="bv-example-row">
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <b-form-group
          id="input-group-1"
          label="Email address:"
          label-for="input-1"
        >
          <b-form-input
            id="input-1"
            v-model="form.email"
            type="email"
            required
            placeholder="Enter email"
          ></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-2" label="Your Name:" label-for="input-2">
          <b-form-input
            id="input-2"
            v-model="form.username"
            required
            placeholder="Enter name"
          ></b-form-input>
        </b-form-group>
        <div class="d-flex float-right">
        <b-button class="mx-3" type="submit" variant="primary">Submit</b-button>
        <b-button type="reset" variant="danger">Reset</b-button>
        </div>
      </b-form>
    </b-container>
  </section>
</template>
<script>
import axios from "axios";

export default {
  name: "Create",
  data() {
    return {
      results: "",
      notification: "",
      form: {
          email: "",
          username: ""
      },
      show: true,
    };
  },
  methods: {
    openNotification(position = null, color) {
      const noti = this.$vs.notification({
        progress: "auto",
        color,
        position,
        title: this.notification,
      });
    },
    onSubmit(evt) {
      evt.preventDefault();
      axios.post(`http://localhost:4000/api/users`, {
          user: this.form
        })
        .then((res) => {
          console.log(res);
          this.notification = res.data.data.username + " has been created"
          this.openNotification('top-right', 'success')
        })
        .catch((e) => {
          console.log(e);
        });
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.form.email = "";
      this.form.name = "";
      // Trick to reset/clear native browser form validation state
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    },
  },
};
</script>

<style lang="scss">

</style>