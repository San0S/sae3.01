<template>
  <a-layout-sider v-model:collapsed="collapsed" :trigger="null" :style="{ overflow: 'auto', height: '100vh', position: 'fixed', left: 0, top: 0, bottom: 0 }" collapsible>
    <div class="logo" />
    <a-menu v-model:selectedKeys="selectedKeys" theme="dark" mode="inline">

      <img v-if="collapsed" src="../assets/Vue_js_logo.png" class="vue_logo" alt="">
      <img v-else src="../assets/log_menu.PNG" class="vue_logo" alt="">

      <!-- <div class="databases"> -->
      <a-sub-menu v-for="database in databases" :key="database.Database" v-on:click="showTables(database.Database)">
        <template #title>
          <span>
            <DatabaseOutlined />
            <span>{{ database.Database }}</span>
          </span>
        </template>
        <a-menu-item v-for="(table, key) in tables[database.Database]" :key="key">
            <TableOutlined />
            <span>{{ table[0] }}</span>
        </a-menu-item>
      </a-sub-menu>
      <!-- </div> -->

      <menu-unfold-outlined v-if="collapsed" class="trigger" @click="() => (collapsed = !collapsed)" />
      <menu-fold-outlined v-else class="trigger" @click="() => (collapsed = !collapsed)" />

    </a-menu>
  </a-layout-sider>
</template>

<script>
import axios from 'axios';
import { DatabaseOutlined, TableOutlined, MenuFoldOutlined, MenuUnfoldOutlined } from '@ant-design/icons-vue';
import { defineComponent, ref } from 'vue';

export default defineComponent({
  components: {
    DatabaseOutlined,
    TableOutlined,
    MenuUnfoldOutlined,
    MenuFoldOutlined
},
  data() {
    return {
      selectedKeys: ref(['1']),
      collapsed: ref(false),
      haveTables: false,
      databases: [],
      tables: [],
      tableColumns: [],
      tableRows: [],
    };
  },
  computed: {
    haveTables() {

    }
  },
  methods: {
    getDatabases() {
      axios.get('http://localhost/db.php').then(response => {
        this.databases = response.data;
      })
      .catch(error => {
        console.error(error);
      });
    },
    showTables(databaseName) {
      this.selectedDatabase = databaseName;
      axios.get(`http://localhost/db.php?database=${databaseName}`)
        .then(response => {
          this.tables[databaseName]= response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    showTableData(tableName) {
      axios.get(`http://localhost/db.php?database=${this.selectedDatabase}&table=${tableName}`)
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
  created() {
    this.getDatabases()
  },
});



</script>


<style>
#components-layout-demo-side .logo {
  height: 32px;
  margin: 16px;
  background: rgba(255, 255, 255, 0.3);
}

.site-layout .site-layout-background {
  background: #fff;
}
[data-theme='dark'] .site-layout .site-layout-background {
  background: #141414;
}

#components-layout-demo-custom-trigger .trigger {
  font-size: 18px;
  line-height: 64px;
  padding: 0 24px;
  cursor: all-;
  transition: color 0.3s;
}

.ant-menu-item-selected {
    background-color: #41b883 !important;
}

.trigger {
  font-size: 25px;
  margin: 25px auto 0 25px;
  position: fixed;
  bottom: 5vh;
}

.vue_logo {
  margin: 25px auto 50px 15px;
  height: 40px;

}

.databases {
  overflow: auto;
  height: 80vh;
}

</style>