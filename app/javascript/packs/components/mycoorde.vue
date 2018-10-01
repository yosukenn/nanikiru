<template>
  <div class="p-5">
    <h1 class="text-center pt-1 pb-4 font-weight-bold">あなたのお気に入りのコーディネートを登録しよう！</h1>
    <form>
      <div class="form-row">
        <!-- 左部 -->
        <div class="col">
          <div class="form-group col-md-12">
            <input v-model="coordinate_image" type="text" class="form-control" placeholder="登録したい画像のURLを入力してください">
            <select v-model="gender_id" class="form-control-sm mt-3 float-right" required>
              <option value=1>Mens</option>
              <option value=2>Womens</option>
            </select>
          </div>
          <img v-if="coordinate_image !== ''" class="w-100 px-3 my-5" v-bind:src=coordinate_image alt="コーディネートイメージ">
        </div>
        <!-- 右部 -->
        <div class="col">
          <div class="form-group col-md-12">
            <input v-model="coordinate_name" type="text" class="form-control" placeholder="title">
          </div>
          <div class="form-group col-md-12">
            <p>アウター</p>
          </div>
          <div class="form-group col-md-6 float-left">
            <input type="text" class="form-control" placeholder="category">
          </div>
          <div class="form-group col-md-6 float-right">
            <input type="text" class="form-control" placeholder="color">
          </div>
          <div class="form-group col-md-12">
            <p>トップス</p>
          </div>
          <div class="form-group col-md-6 float-left">
            <input type="text" class="form-control" placeholder="category">
          </div>
          <div class="form-group col-md-6 float-right">
            <input type="text" class="form-control" placeholder="color">
          </div>
          <div class="form-group col-md-12">
            <p>インナー</p>
          </div>
          <div class="form-group col-md-6 float-left">
            <input type="text" class="form-control" placeholder="category">
          </div>
          <div class="form-group col-md-6 float-right">
            <input type="text" class="form-control" placeholder="color">
          </div>
          <div class="form-group col-md-12">
            <p>ボトムス</p>
          </div>
          <div class="form-group col-md-6 float-left">
            <input type="text" class="form-control" placeholder="category">
          </div>
          <div class="form-group col-md-6 float-right">
            <input type="text" class="form-control" placeholder="color">
          </div>
          <div class="form-group col-md-12">
            <p>シューズ</p>
          </div>
          <div class="form-group col-md-6 float-left">
            <input type="text" class="form-control" placeholder="category">
          </div>
          <div class="form-group col-md-6 float-right">
            <input type="text" class="form-control" placeholder="color">
          </div>
          <div class="form-group col-md-12">
            <p>アクセサリ</p>
          </div>
          <div class="form-group col-md-6 float-left">
            <input type="text" class="form-control" placeholder="category">
          </div>
          <div class="form-group col-md-6 float-right">
            <input type="text" class="form-control" placeholder="color">
          </div>
          <button type="submit" class="btn btn-primary float-right mr-3">登録！</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function() {
      return {
        gender_id : 1,
        coordinate_name : '',
        coordinate_image : '',
        coordinate_items : [
          {category_name: ''},
          {category_color: ''},
        ]
      }
    }
  }
</script>
