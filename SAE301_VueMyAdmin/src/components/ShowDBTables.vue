<template>
    <div>
      <h1>Bases de données présentes sur le server localhost</h1>
      <ul>
        <li v-for="database in databases" :key="database">{{ database }}</li>
      </ul>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        databases: []
      }
    },
    mounted() {
      axios.get('http://100.74.7.84/db.php')
        .then(response => {
          this.databases = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    }
  }
  </script>
 
