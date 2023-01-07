<template>
  <a-layout style="min-height: 100vh" has-sider>
    
    <MenuVertical></MenuVertical>

    <a-layout :style="{ marginLeft: '200px' }">

      <a-layout-header style="background: #fff; padding: 0" >
        <a-tabs v-model:activeKey="activeKey" style="margin-left: 20px; margin-right: 20px;">
          <a-tab-pane key="1" tab="Parcourir">
            <a-layout-content :style="{ margin: '24px 16px', padding: '24px', background: '#fff' }">
              <a-breadcrumb style="margin: 16px 0">
                <a-breadcrumb-item>Database</a-breadcrumb-item>
                <a-breadcrumb-item>Table</a-breadcrumb-item>
              </a-breadcrumb>
              <div :style="{ padding: '24px', background: '#fff', minHeight: '360px' }">
                Contenu de la table...
              </div>
            </a-layout-content>
          </a-tab-pane>
          <a-tab-pane key="2" tab="Structure">
            <a-layout-content :style="{ margin: '24px 16px', padding: '24px', background: '#fff' }">
              <a-breadcrumb style="margin: 16px 0">
                <a-breadcrumb-item>Database</a-breadcrumb-item>
                <a-breadcrumb-item>Table</a-breadcrumb-item>
              </a-breadcrumb>
              <div :style="{ padding: '24px', background: '#fff', minHeight: '360px' }">
                Structure de la table...
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
import MenuVertical from './components/MenuVertical.vue';
import { defineComponent, ref } from 'vue';
export default ({
  components: {
    MenuVertical,
  },
  setup() {
    return {
      activeKey: ref('1'),
    };
  }
});
</script>