<template>
    <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              <h3>{{ coordinate.name }}</h3>
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
                    <img class="col" :src=coordinate.image alt="コーデイメージ">
                  </div>
                  <div class="col">
                    <h5 class="font-weight-bold">アウター</h5>
                    <div class="row pb-3">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    <h5 class="font-weight-bold">トップス</h5>
                    <div class="row pb-3">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    <h5 class="font-weight-bold">インナー</h5>
                    <div class="row pb-3">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    <h5 class="font-weight-bold">ボトムス</h5>
                    <div class="row pb-3">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    <h5 class="font-weight-bold">シューズ</h5>
                    <div class="row pb-3">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    <h5 class="font-weight-bold">アクセサリ</h5>
                    <div class="row pb-3">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
  export default {
    props: ['coordinate']
  }
</script>
