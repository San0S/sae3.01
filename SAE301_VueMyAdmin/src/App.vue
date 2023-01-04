<template>
  <a-layout style="min-height: 100vh" has-sider>
    <a-layout-sider v-model:collapsed="collapsed" :trigger="null" :style="{ overflow: 'auto', height: '100vh', position: 'fixed', left: 0, top: 0, bottom: 0 }" collapsible>
      <div class="logo" />
      <a-menu v-model:selectedKeys="selectedKeys" theme="dark" mode="inline">

        <img v-if="collapsed" src="./assets/Vue_js_logo.png" class="vue_logo" alt="">
        <img v-else src="./assets/log_menu.png" class="vue_logo" alt="">

        <a-menu-item key="1" style="margin-top: 50px">
          <DatabaseOutlined />
          <span>Option 1</span>
        </a-menu-item>
        
        <a-menu-item key="2">
          <DatabaseOutlined />
          <span>Option 2</span>
        </a-menu-item>
        
        <a-sub-menu key="sub1">
          <template #title>
            <span>
              <DatabaseOutlined />
              <span>User</span>
            </span>
          </template>
          <a-menu-item key="3"> <TableOutlined /> Tom</a-menu-item>
          <a-menu-item key="4">Bill</a-menu-item>
          <a-menu-item key="5">Alex</a-menu-item>
        </a-sub-menu>

        <a-sub-menu key="sub2">
          <template #title>
            <span>
              <DatabaseOutlined />
              <span>Team</span>
            </span>
          </template>
          <a-menu-item key="6">Team 1</a-menu-item>
          <a-menu-item key="8">Team 2</a-menu-item>
        </a-sub-menu>
        

        <menu-unfold-outlined v-if="collapsed" class="trigger" @click="() => (collapsed = !collapsed)" />
        <menu-fold-outlined v-else class="trigger" @click="() => (collapsed = !collapsed)" />

      </a-menu>
    </a-layout-sider>
    <a-layout :style="{ marginLeft: '200px' }">

      <a-layout-header style="background: #fff; padding: 0" >

      </a-layout-header>  

      <a-layout-content :style="{ margin: '24px 16px', padding: '24px', background: '#fff' }">
        <a-breadcrumb style="margin: 16px 0">
          <a-breadcrumb-item>User</a-breadcrumb-item>
          <a-breadcrumb-item>Bill</a-breadcrumb-item>
        </a-breadcrumb>
        <div :style="{ padding: '24px', background: '#fff', minHeight: '360px' }">
          Bill is a cat.
        </div>
      </a-layout-content>
    </a-layout>
  </a-layout>
</template>
<script>
import { DatabaseOutlined, TableOutlined, MenuFoldOutlined, MenuUnfoldOutlined, FileOutlined } from '@ant-design/icons-vue';
import { defineComponent, ref } from 'vue';
export default defineComponent({
  components: {
    DatabaseOutlined,
    TableOutlined,
    MenuUnfoldOutlined,
    MenuFoldOutlined,
  },
  data() {
    return {
      selectedKeys: ref(['1']),
      collapsed: ref(false),
    };
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

#components-layout-demo-custom-trigger .trigger:hover {
  color: #1890ff;
}

.trigger {
  font-size: 25px;
  margin: 25px auto 0 25px;
  position: fixed;
  bottom: 5vh;
}

.vue_logo {
  margin: 25px auto 0 15px;
  height: 40px;
}

</style>