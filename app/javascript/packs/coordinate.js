import Vue from 'vue/dist/vue.esm.js'
import Router from './router/router'
import Header from './components/header.vue'
import ShowModal from './components/show-modal.vue'

var app = new Vue({
  router: Router,
  el: '#app',
  data: {
    showModal: false,
    coordinateInfo: ""
  },
  components: {
    'navbar': Header,
    'modal': ShowModal
  },
  methods: {
    flowCoordinate: function(data) {
      this.showModal = true;
      return;
    }
  }
});
