<template>
  <div class="card-columns p-5">
    <div v-for="coordinate in coordinates" class="card d-inline-block">
      <img class="card-img-top" v-bind:src=coordinate.image alt="Card image cap">
      <div class="card-body">
        <h5 class="card-title">{{ coordinate.name }}</h5>
        <p class="card-text"><small class="text-muted">{{ coordinate.updated_at }}</small></p>
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
        newCoordinate: ''
      }
    },
    mounted: function() {
      this.fetchCoordenates();
    },
    methods: {
      fetchCoordenates: function() {
        axios.get('/coordinates').then((response) => {
          for(var i = 0; i < response.data.coordinates.length; i++) {
            this.coordinates.push(response.data.coordinates[i]);
          }
        }, (error) => {
          console.log(error);
        });
      }
    }
  }
</script>
