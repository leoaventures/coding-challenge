<template>
  <div>
    <div class='status-message'>{{ message }}</div>
    <ul>
      <li class="title">
        <div>Actions</div>
        <div>Carrier</div>
        <div>Origin</div>
        <div>Destination</div>
        <div>Rate</div>
        <div>Currency</div>
        <div>Common Rate</div>
      </li>
      <li v-for="rate in rates" :key="rate.id">
        <div v-if="!rate.edit" class="edit-button" v-on:click="$set(rate, 'edit', !rate.edit)">Edit</div>
        <div v-if="rate.edit">
          <span class="save-button" v-on:click="updateRate(rate);$set(rate, 'edit', !rate.edit)">Save </span> |
          <span class="cancel-button" v-on:click="$set(rate, 'edit', !rate.edit)"> Cancel</span>
        </div>
        <div>{{ rate.name }}</div>
        <div v-if="!rate.edit">{{ rate.origin }}</div>
        <div v-if="rate.edit">
          <input v-model="rate.origin ">
        </div>
        <div v-if="!rate.edit">{{ rate.destination }}</div>
        <div v-if="rate.edit">
          <input v-model="rate.destination ">
        </div>
        <div v-if="!rate.edit">{{ rate.rate }}</div>
        <div v-if="rate.edit">
          <input v-model="rate.rate ">
        </div>
        <div v-if="!rate.edit">{{ rate.currency }}</div>
        <div v-if="rate.edit">
          <input v-model="rate.currency ">
        </div>
        <div>{{ rate.common_rate }} USD</div>
      </li>
    </ul>
  </div>
</template>

<script>
import {getAllRates, updateRate} from '../services/RateService.js'
export default {
  name: 'Rates',
  data () {
    return {
      rates: [],
      message: ''
    }
  },
  methods: {
    getAllRates() {
      getAllRates().then(response => {
        console.log(response);
        this.rates = response.rates;
      })
    },
    updateRate(rate) {
      updateRate(rate).then(response => {
        console.log(response);
        this.message = "Update " + response.status;
      })
    }
  },
  beforeMount(){
      this.getAllRates()
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: flex;
  justify-content: space-between;
  margin: 10px 10px;
}
.title {
  font-weight: bold;
  border-bottom: 1px solid #c0c0c0;
  margin-bottom: 10px;
  text-transform: uppercase;
}
.edit-button, .save-button, .cancel-button{
  color: blue;
  cursor: pointer;
}

.status-message {
  color: grey;
  font-weight: bold;
  font-size: 20px;
}
</style>
