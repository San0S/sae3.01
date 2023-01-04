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
      <li v-for="(table,key) in tables" :key="key" v-on:click="showTableData(table[0])">{{ table[0] }}</li>
    </ul>
    <TableData :columns="tableColumns" :rows="tableRows" />
  </div>
</template>

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
      axios.get(`http://localhost/db.php?database=${databaseName}`)
        .then(response => {
          this.tables = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    showTableData(tableName) {
      this.selectedDatabase = databaseName;
      axios.get(`http://localhost/db.php?database=${this.selectedDatabase}&table=${tableName}`)
        .then(response => {
          this.tableColumns = Object.keys(response.data[0]);
          this.tableRows = response.data;
          this.displayTableData = true;
        })
        .catch(error => {
          console.error(error);
        });
    },
  },
  components: {
    TableData,
  },
  created() {
  axios.get('http://localhost/db.php')
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



<!-- <template>
  <div class="side-panel">
    <h3>Liste des bases de données</h3>
    <ul>
      <li v-for="database in databases" :key="database.Database" v-on:click="showTables(database.Database)">
        {{ database.Database }}
      </li>
    </ul>
    <h3>Table(s)</h3>
    <ul> 
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
      axios.get(`http://localhost/db.php?database=${databaseName}`)
        .then(response => {
        console.log('API response:', response);
        console.log('Table data:', response.data);
          this.tables = response.data;
          console.log('Tables data:', this.tables);
        })
        .catch(error => {
          console.error(error);
        });
    },
  },
  created() {
    axios.get('http://localhost/db.php')
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
</style> -->
