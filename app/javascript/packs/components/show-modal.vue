<template>
    <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              <h3>{{ coordinate.coordinate.name }}</h3>
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
                    <img class="col" :src=coordinate.coordinate.image alt="コーデイメージ">
                  </div>
                  <div class="col">
                    <h5 class="font-weight-bold">Item Data</h5>
                    <div v-for="category in coordinate.categorys" class="row pb-3">
                      <div class="col-4 pr-0">
                        {{ category.color }}
                      </div>
                      <div class="col">
                        {{ category.name }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </slot>
          </div>
          <div v-if="coordinate.coordinate.user_id == coordinate.coordinate.current_user_id" class="modal-footer">
            <slot name="footer">
              <button class="modal-default-button btn btn-warning">
                編集
              </button>
              <button @click="deleteCoordinate" class="modal-default-button btn btn-danger">
                削除
              </button>
            </slot>
          </div>

        </div>
      </div>
    </div>
  </transition>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['coordinate'],
    methods: {
      deleteCoordinate: function() {
        if (window.confirm("are you sure ?")) {
          var id = this.coordinate.coordinate.id;

          axios.delete('/coordinates/' + id)
          .then((response) => {
            this.$emit('close');
          }, (error) => {
            console.log(error);
          });

        } else {
          return false
        }
      }
    }
  }
</script>
