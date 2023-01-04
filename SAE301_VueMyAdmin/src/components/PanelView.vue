<template>
  <div>
    <div class="side-panel">
      <h3>Liste des bases de données</h3>
      <ul>
        <li v-for="database in databases" :key="database.Database" v-on:click="showTables(database.Database)">
          {{ database.Database }}
        </li>
      </ul>
      <h3>Table(s)</h3>
      <ul>
        <li v-for="(table, key) in tables" :key="key" v-on:click="showTableData(table[0])">{{ table[0] }}</li>
      </ul>
    </div>
    <div class="main-panel">
      <p>Structure de la table</p>
      <TableData :columns="tableColumns" :rows="tableRows"></TableData>
    </div>
  </div>
</template>
  
<style>
.main-panel {
  margin: 0 auto;
  width: 200px;
}

.side-panel {
  width: 200px;
  background-color: #f5f5f5;
  border-right: 1px solid #ddd;
  height: 60%;
  overflow-y: auto;
}

h3 {
  padding: 0px;
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
  
<script>
import axios from 'axios';
import TableData from './TableData.vue';

export default {
  data() {
    return {
      databases: [],
      tables: [],
      tableColumns: [],
      tableRows: [],
    };
  },
  methods: {
    showTables(databaseName) {
      this.selectedDatabase = databaseName;
      axios.get(`http://100.74.7.84/db.php?database=${databaseName}`)
        .then(response => {
          this.tables = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    showTableData(tableName) {
      axios.get(`http://100.74.7.84/db.php?database=${this.selectedDatabase}&table=${tableName}`)
        .then(response => {
          console.log('API response:', response);
          console.log('Table data:', response.data);
          this.tableColumns = Object.keys(response.data[0]);
          this.tableRows = response.data;
          this.displayTableData = true;

          // console.log('API response:', response);
          // console.log('Table data:', response.data);
        })
        .catch(error => {
          console.error(error);
        });
    },
  },
  components: {
    TableData,
    // MainDisplay, 
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

.main-panel {
  margin: 0 auto;
  width: 600px;
  text-align: center;
}

table {
  border-collapse: collapse;
}

th,
td {
  border: 1px solid #ddd;
  padding: 8px;
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
