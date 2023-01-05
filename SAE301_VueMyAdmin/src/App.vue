<template>
  <a-layout style="min-height: 100vh" has-sider>
    
    <MenuVertical></MenuVertical>

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
import MenuVertical from './components/MenuVertical.vue';
export default ({
  components: {
    MenuVertical,
  },
});
</script>