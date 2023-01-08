<template>
  <a-layout style="min-height: 100vh" has-sider>
    

    <!-- ################################################################### -->
                                <!-- Menu -->
    <!-- ################################################################### -->


    <a-layout-sider v-model:collapsed="collapsed" :trigger="null" :style="{ overflow: 'auto', height: '100vh', position: 'fixed', left: 0, top: 0, bottom: 0 }" collapsible>
      <div class="logo" />
      <a-menu v-model:selectedKeys="selectedKeys" theme="dark" mode="inline">

        <img v-if="collapsed" src="./assets/Vue_js_logo.png" class="vue_logo" alt="">
        <img v-else src="./assets/log_menu.PNG" class="vue_logo" alt="">

        <!-- <div class="databases"> -->
        <a-sub-menu v-for="database in databases" :key="database.Database" v-on:click="showTables(database.Database)">
          <template #title>
            <span>
              <DatabaseOutlined />
              <span>{{ database.Database }}</span>
            </span>
          </template>
          <a-menu-item v-for="(table, key) in tables[database.Database]" :key="table[0]" v-on:click="showTableData(table[0]), showStructure(table[0])">
              <TableOutlined />
              <span>{{ table[0] }}</span>
          </a-menu-item>
        </a-sub-menu>
        <!-- </div> -->

        <menu-unfold-outlined v-if="collapsed" class="trigger" @click="() => (collapsed = !collapsed)" />
        <menu-fold-outlined v-else class="trigger" @click="() => (collapsed = !collapsed)" />

      </a-menu>
  </a-layout-sider>

    <!-- ################################################################### -->
                                <!-- Contenu -->
    <!-- ################################################################### -->

    <a-layout :style="{ marginLeft: '200px' }">

    <!-- ################################################################### -->
                                <!-- Onglets --> 
    <!-- ################################################################### -->

      <a-layout-header style="background: #fff; padding: 0" >
        <a-tabs v-model:activeKey="activeKey" style="margin-left: 20px; margin-right: 20px;">
          
          
          <a-tab-pane key="1" tab="Parcourir">
            <a-layout-content :style="{ margin: '24px 16px', padding: '24px', background: '#fff' }">
              <a-breadcrumb style="margin: 16px 0">
                <a-breadcrumb-item>{{ currentDb }}</a-breadcrumb-item>
                <a-breadcrumb-item>{{ currentTable }}</a-breadcrumb-item>
              </a-breadcrumb>
              <div :style="{ padding: '24px', background: '#fff', minHeight: '360px' }">
                <!-- Contenu de la table... -->
                <ContenuTable :columns="tableColumns" :rows="tableRows"></ContenuTable>
              </div>
            </a-layout-content>
          </a-tab-pane>


          <a-tab-pane key="2" tab="Structure">
            <a-layout-content :style="{ margin: '24px 16px', padding: '24px', background: '#fff' }">
              <a-breadcrumb style="margin: 16px 0">
                <a-breadcrumb-item>{{ currentDb }}</a-breadcrumb-item>
                <a-breadcrumb-item>{{ currentTable }}</a-breadcrumb-item>
              </a-breadcrumb>
              <div :style="{ padding: '24px', background: '#fff', minHeight: '360px' }">
                <!-- Structure de la table... -->
                <ContenuTable :columns="structureColumns" :rows="structureRows"></ContenuTable>
              </div>
            </a-layout-content>
          </a-tab-pane>
          
          
          <a-tab-pane key="3" tab="SQL">
            <a-layout-content :style="{ margin: '24px 16px', padding: '24px', background: '#fff' }">
              <a-breadcrumb style="margin: 16px 0">
                <a-breadcrumb-item>Database</a-breadcrumb-item>
                <a-breadcrumb-item>Table</a-breadcrumb-item>
              </a-breadcrumb>
              <div :style="{ padding: '24px', background: '#fff', minHeight: '360px' }">
                Requête SQL...
              </div>
            </a-layout-content>
          </a-tab-pane>
        
        
        </a-tabs>
      </a-layout-header>  


    </a-layout>
  </a-layout>
</template>

<script>
import axios from 'axios';
import ContenuTable from './components/ContenuTable.vue';

import { DatabaseOutlined, TableOutlined, MenuFoldOutlined, MenuUnfoldOutlined } from '@ant-design/icons-vue';
import { defineComponent, ref } from 'vue';
export default defineComponent({
  components: {
    DatabaseOutlined,
    TableOutlined,
    MenuUnfoldOutlined,
    MenuFoldOutlined,
    ContenuTable,
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
      structureColumns: [],
      structureRows: [],
      currentDb: '',
      currentTable: ''
    };
  },
  setup() {
    return {
      activeKey: ref('1'),
    };
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
          this.currentDb = databaseName;
        })
        .catch(error => {
          console.error(error);
        });
    },
    showStructure(tableName) {
      axios.get(`http://localhost/db.php?database=${this.selectedDatabase}&table=${tableName}&structure=true`)
      .then(response => {
        console.log('API response:', response);
        console.log('Table data:', response.data);
        this.structureColumns = Object.keys(response.data[0]);
        this.structureRows = response.data;
        this.displayTableData = true;

        // console.log('API response:', response);
        // console.log('Table data:', response.data);
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
          this.currentTable = tableName;

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
  }
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


table {
  border-collapse: collapse;
}

th,
td {
  border: 1px solid #ddd;
  padding: 8px;
}

</style>