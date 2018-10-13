<template>
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div  class="modal-container">

          <div class="modal-header">
            <slot name="header">
              <h3>{{ editTarget.coordinate.name }}</h3>
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
                    <img class="col" :src="editTarget.coordinate.image" alt="コーデイメージ">
                  </div>
                  <div class="col">
                    <h5 class="font-weight-bold">Item Data</h5>
                    <div v-for="category in editTarget.categorys" class="row pb-3">
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
          <div class="modal-footer">
            <slot name="footer">
              <button class="modal-default-button btn btn-warning">
                更新
              </button>
            </slot>
          </div>

        </div>
      </div>
    </div>
</template>

<script>
  export default {
    props: ['editTarget']
  }
</script>
