<template>
  <div class="p-5">
    <div class="code-form rounded p-5">
      <h1 class="text-center pt-1 pb-4 font-weight-bold">お気に入りのコーディネートを登録しよう！</h1>
      <form @submit.prevent="createCoordinate">
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
            <div v-for="coordinate_item in coordinate_items" class="clearfix">
              <div class="form-group col-md-12">
                <p>{{ coordinate_item.category_class }}</p>
              </div>
              <div class="form-group col-md-6 float-left">
                <input v-model="coordinate_item.name" type="text" class="form-control" placeholder="category">
              </div>
              <div class="form-group col-md-6 float-right">
                <input v-model="coordinate_item.color" type="text" class="form-control" placeholder="color">
              </div>
            </div>
            <button type="submit" class="btn btn-primary float-right mr-3">登録！</button>
          </div>
        </div>
      </form>
    </div>
    <!-- マイコーディネート部分 -->
    <h2 class="clearfix pt-5 text-light">あなたが登録したコーディネート</h2>
    <div class="card-columns p-5">
      <div @click="emitModal" :data-id="coordinate.id" v-for="coordinate in coordinates" class="card d-inline-block">
        <img class="card-img-top" v-bind:src=coordinate.image alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">{{ coordinate.name }}</h5>
          <p class="card-text"><small class="text-dark">{{ coordinate.updated_at }}</small></p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  import { csrfToken } from 'rails-ujs'

  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();

  export default {
    data: function() {
      return {
        gender_id : 1,
        coordinate_name : '',
        coordinate_image : '',
        coordinate_items : [
          {category_class: 'アウター', name: '', color: ''},
          {category_class: 'トップス', name: '', color: ''},
          {category_class: 'インナー', name: '', color: ''},
          {category_class: 'ボトムス', name: '', color: ''},
          {category_class: 'シューズ', name: '', color: ''},
          {category_class: 'アクセサリ', name: '', color: ''}
        ],
        coordinates: []
      }
    },
    mounted: function() {
      this.fetchCoordenates();
    },
    methods: {
      createCoordinate: function() {
        axios.post('/coordinates', {
          params: {
            gender_id: this.gender_id,
            coordinate_name: this.coordinate_name,
            coordinate_image: this.coordinate_image,
            coordinate_items: this.coordinate_items
          }
        })
        .then((response) => {
          this.coordinates.unshift(response.data.coordinate);
          this.gender_id = 1,
          this.coordinate_name = '',
          this.coordinate_image = '',
          this.coordinate_items = [
            {category_class: 'アウター', name: '', color: ''},
            {category_class: 'トップス', name: '', color: ''},
            {category_class: 'インナー', name: '', color: ''},
            {category_class: 'ボトムス', name: '', color: ''},
            {category_class: 'シューズ', name: '', color: ''},
            {category_class: 'アクセサリ', name: '', color: ''}
          ]
        }, (error) => {
          console.log(error);
        });
      },
      fetchCoordenates: function() {
        this.coordinates.length = 0;
        axios.get('/users')
        .then((response) => {
          for(var i = 0; i < response.data.coordinates.length; i++) {
            this.coordinates.push(response.data.coordinates[i]);
          }
        }, (error) => {
          console.log(error);
        });
      },
      show: function() {
      },
      emitModal: function(e) {
        var id = e.currentTarget.getAttribute('data-id');
        axios.get('/coordinates/' + id, {
          params: {
            id: id
          }
        }).then((response) => {
          this.$emit('show', response.data);
        }, (error) => {
          console.log(error);
        });
      }
    }
  }
</script>

<style scoped>
  .code-form {
    background-color: rgba(255, 255, 255, .5);
  }
  .card {
    background-color: rgba(255, 255, 255, 0.6);
  }
</style>
