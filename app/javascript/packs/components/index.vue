<template>
  <!-- 検索フォーム -->
  <div>
    <h1 class="text-center pt-5 pb-3 font-weight-bold">今日の主役は何ですか？</h1>
    <form @submit.prevent="searchCoordinates" class="needs-validation px-5" novalidate>
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <select v-model="gender_id" class="form-control" required>
            <option value=1>Mens</option>
            <option value=2>Womens</option>
          </select>
          <div class="valid-feedback">
            Looks good!
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <input v-model="color_tag" type="text" class="form-control" placeholder="color" required>
          <div class="valid-feedback">
            Looks good!
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="input-group">
            <input v-model="category_tag" type="text" class="form-control" placeholder="category" aria-describedby="inputGroupPrepend" required>
            <div class="invalid-feedback">
              Please choose a username.
            </div>
          </div>
        </div>
      </div>
      <button class="btn btn-primary" type="submit">Search!</button>
    </form>
    <!-- コーディネート一覧 -->
    <div class="card-columns p-5">
      <div id="show-modal" @click="emitModal" v-for="coordinate in coordinates" class="card d-inline-block">
        <img class="card-img-top" v-bind:src=coordinate.image alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">{{ coordinate.name }}</h5>
          <p class="card-text"><small class="text-muted">{{ coordinate.updated_at }}</small></p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    // コンポーネントのデータは関数型でなければならない
    data: function() {
      return {
        coordinates: [],
        gender_id: 1,
        color_tag: '',
        category_tag: ''
      }
    },
    mounted: function() {
      this.fetchCoordenates();
    },
    methods: {
      fetchCoordenates: function() {
        axios.get('/coordinates')
        .then((response) => {
          for(var i = 0; i < response.data.coordinates.length; i++) {
            this.coordinates.push(response.data.coordinates[i]);
          }
        }, (error) => {
          console.log(error);
        });
      },
      searchCoordinates: function() {
        if (this.color_tag == '' && this.category_tag == '') {
          return;
        }

        axios.get('/coordinates', {
          params: {
            gender_id: this.gender_id,
            color_tag: this.color_tag,
            category_tag: this.category_tag
          }
        }).then((response) => {
          this.coordinates.length = 0;
          for(var i = 0; i < response.data.coordinates.length; i++) {
              this.coordinates.push(response.data.coordinates[i]);
          }
          this.gender_id = 1;
          this.color_tag = '';
          this.category_tag = '';
        }, (error) => {
          console.log(error);
        });
      },
      show: function() {
      },
      emitModal: function(e) {
        // idをパラメータとして送る  ->  coordinates#showを動かす ->  emitで情報をオブジェクト式で渡す

        this.$emit('show');
      }
    }
  }
</script>
