<template>
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div @submit.prevent="addItem" class="modal-container">
          <form>
          <div class="modal-header">
            <slot name="header">
              <h3 class="col">追加する項目を入力</h3>
            </slot>
            <button class="modal-default-button btn btn-secondary" @click="$emit('close')">
              x
            </button>
          </div>
          <div class="modal-body">
            <slot name="body">
              <div class="container-fluid">
                <div class="row">
                    <div class="row">
                      <input v-model="coordinate_item.name" placeholder="category" type="text" class="form-control col mx-3">
                      <input v-model="coordinate_item.color" placeholder="color" type="text" class="form-control col mx-3">
                    </div>
                </div>
              </div>
            </slot>
          </div>
          <div class="modal-footer">
            <slot name="footer">
              <button type="submit" class="modal-default-button btn btn-warning">
                追加
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
  import { csrfToken } from 'rails-ujs'

  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();

  export default {
    props: ['coordinateId'],
    data: function() {
      return {
        id: this.coordinateId,
        coordinate_item: {
          name: '', color: ''
        }
      }
    },
    methods: {
      addItem: function() {
        axios.post('/category_tags', {
            id: this.id,
            coordinate_item: this.coordinate_item
        })
        .then((response) => {

        }, (error) => {
          console.log(error);
        });
        this.$emit('close');
      }
    }
  }
</script>
