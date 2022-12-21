<template>
  <div>
    <ul>
      <li v-for="table in tables" :key="table">{{ table }}</li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  props: {
    database: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      tables: []
    }
  },
  created() {
    axios.get(`http://100.74.7.84/db.php`, { params: { database: this.database } })
      .then(response => {
        this.tables = response.data.tables;
      })
  }
}</script>
