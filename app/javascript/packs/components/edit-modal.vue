<template>
    <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              <h3>タイトル</h3>
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
                    <img class="col" src="http://c.imgz.jp/880/27453880/27453880B_34_D_500.jpg" alt="コーデイメージ">
                  </div>
                  <div class="col">
                    <h5 class="font-weight-bold">Item Data</h5>
                    <div class="row pb-3">
                      <div class="col-4 pr-0">
                        ブラック
                      </div>
                      <div class="col">
                        コート
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </slot>
          </div>
          <div class="modal-footer">
            <slot name="footer">
              <button @click="showEdit" class="modal-default-button btn btn-warning">
                更新
              </button>
            </slot>
          </div>

        </div>
      </div>
    </div>
  </transition>
</template>
