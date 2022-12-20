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
  data() {
    return {
      tables: []
    }
  },
  created() {
    this.fetchTables()
  },
  methods: {
    async fetchTables() {
      try {
        const response = await axios.get('http://localhost/db.php')
        this.tables = response.data.tables
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>
