<template>
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div @submit.prevent="updateCoordinate" class="modal-container">
          <form>
          <div class="modal-header">
            <slot name="header">
              <h3 class="col">追加する項目を入力してください</h3>
            </slot>
            <button class="modal-default-button btn btn-secondary">
              x
            </button>
          </div>
          <div class="modal-body">
            <slot name="body">
              <div class="container-fluid">
                <div class="row">
                  <div class="col">
                    <div class="col">
                      <input placeholder="category" type="text" class="form-control">
                    </div>
                    <div class="col">
                      <input placeholder="category" type="text" class="form-control">
                    </div>
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
</script>
