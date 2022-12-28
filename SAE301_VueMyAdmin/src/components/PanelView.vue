<template>
  <div class="side-panel">
    <h3>Liste des bases de données</h3>
    <ul>
      <li v-for="database in databases" :key="database.Database" v-on:click="showTables(database.Database)">
        {{ database.Database }}
      </li>
    </ul>
    <h3>Table(s)</h3>
    <ul>
     <!-- <li v-for="table in tables" :key="table.Name">{{ table.Name }}</li> --> 
     <li v-for="(table,key) in tables" :key="key">{{ table[0] }}</li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      databases: [],
      tables: [],
    };
  },
  methods: {
    showTables(databaseName) {
      axios.get(`http://100.74.7.84/db.php?database=${databaseName}`)
        .then(response => {
         // console.log(response.data);
          this.tables = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
  },
  created() {
    axios.get('http://100.74.7.84/db.php')
      .then(response => {
        this.databases = response.data;
      })
      .catch(error => {
        console.error(error);
      });
  },
};
</script>

<style>
.side-panel {
  width: 200px;
  background-color: #f5f5f5;
  border-right: 1px solid #ddd;
  height: 100%;
  overflow-y: auto;
}

h3 {
  padding: 10px;
  margin: 0;
  font-size: 14px;
  font-weight: bold;
  background-color: #eee;
  border-bottom: 1px solid #ddd;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

li {
  margin: 10px;
  padding: 10px;
  cursor: pointer;
}

li:hover {
  background-color: #eee;
}
</style>
