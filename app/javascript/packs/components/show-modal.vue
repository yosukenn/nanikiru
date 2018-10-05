<template>
    <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              <h3>春になったら何着よう</h3>
            </slot>
            <button class="modal-default-button btn btn-secondary" @click="$emit('close')">
              x
            </button>
          </div>
          <div class="modal-body">
            <slot name="body">
              <div class="container-fluid">
                <div class="row">
                  <div class="col">
                    <img src="https://rr.img.naver.jp/mig?src=http%3A%2F%2Fimgcc.naver.jp%2Fkaze%2Fmission%2FUSER%2F20170119%2F40%2F4513860%2F79%2F323x555xc5c7df4ae9c0000ed4152068.jpg%2F300%2F600&twidth=300&theight=600&qlt=80&res_format=jpg&op=r" alt="コーデイメージ">
                  </div>
                  <div class="col">
                    アウター
                    <div class="row">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    トップス
                    <div class="row">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    インナー
                    <div class="row">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    ボトムス
                    <div class="row">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    シューズ
                    <div class="row">
                      <div class="col">
                        color
                      </div>
                      <div class="col">
                        category
                      </div>
                    </div>
                    アクセサリ
                    <div class="row">
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
