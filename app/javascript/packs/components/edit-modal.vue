<template>
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div @submit.prevent="updateCoordinate" class="modal-container">
          <form>
          <div class="modal-header">
            <slot name="header">
              <h3 class="col"><input v-model="coordinate_name" type="text" class="form-control"></h3>
            </slot>
            <button class="modal-default-button btn btn-secondary" @click="$emit('close')">
              x
            </button>
          </div>
          <div class="modal-body">
            <slot name="body">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-7">
                    <img class="col" :src="coordinate_image" alt="コーデイメージ">
                  </div>
                  <div class="col">
                    <h5 class="font-weight-bold">Item Data</h5>
                    <div v-for="category in editTarget.categorys" class="row pb-3">
                      <div class="col">
                        <input v-model="category.color" type="text" class="form-control">
                      </div>
                      <div class="col">
                        <input v-model="category.name" type="text" class="form-control">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </slot>
          </div>
          <div class="modal-footer">
            <slot name="footer">
              <button type="submit" class="modal-default-button btn btn-warning">
                更新
              </button>
            </slot>
          </div>
        </form>
        </div>
      </div>
    </div>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['editTarget'],
    data: function() {
      return {
        gender_id : this.editTarget.coordinate.gender_id,
        coordinate_name : this.editTarget.coordinate.name,
        coordinate_image : this.editTarget.coordinate.image,
        coordinate_items : this.editTarget.categorys
      }
    },
    methods: {
      updateCoordinate: function() {
        var id = this.editTarget.coordinate.id

        axios.patch('/coordinates/' + id, {
          params: {
            coordinate_name: this.coordinate_name,
            coordinate_items: this.coordinate_items
          }
        })
        .then((response) => {
          this.coordinate_name = response.data.coordinate.name;
          var index = this.$root.$refs.index.coordinates.findIndex(({id}) => id == response.data.coordinate.id);
          this.$root.$refs.index.coordinates[index].name = this.coordinate_name;
        }, (error) => {
          console.log(error);
        });
        this.$parent.editModal = false;
        this.$root.showModal = false;
      }
    }
  }
</script>
