<template>
  <div>
    <table>
      <thead>
        <tr>
          <th v-for="column in columns" :key="column.name">{{ column.name }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="row in rows" :key="row.id">
          <td v-for="column in columns" :key="column.name">{{ row[column.name] }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>



<script>
// version 1 : en précisant en dur la db dans db.php (pas d'utilisation de parent container)
// import axios from 'axios';
// export default {
//   data() {
//     return {
//       tables: []
//     }
//   },
//   created() {
//     this.fetchTables()
//   },
//   methods: {
//     async fetchTables() {
//       try {
//         const response = await axios.get('http://localhost/db.php')
//         this.tables = response.data.tables
//       } catch (error) {
//         console.error(error)
//       }
//     }
//   }
// }

// version 2 : en utilisant le parent container (donc on récupère la db grâce à props et $_GET['database'] dans db.php)

// import axios from 'axios';
// export default {
//   props: {
//     database: {
//       type: String,
//       required: true
//     }
//   },
//   table: {
//     type: String,
//     required: true
//   },
//   data() {
//     return {
//       tables: []
//     }
//   },
//   created() {
//     axios.get(`http://localhost/db.php`, { params: { database: this.database, table: this.table} })
//       .then(response => {
//         // this.tables = response.data.tables;
//         this.tables = response.data.tables;
//       })
//   }
// }


import axios from 'axios';
export default {
  props: {
    database: {
      type: String,
      required: true
    },
    table: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      columns: [],
      rows: []
    }
  },
  created() {
    axios.get(`http://localhost/db.php`, { params: { database: this.database, table: this.table } })
      .then(response => {
        this.columns = response.data.columns;
        this.rows = response.data.rows;
      })
  }
}
</script>
