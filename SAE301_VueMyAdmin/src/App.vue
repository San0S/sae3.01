<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <div>
    <ShowDBTables />
  </div>
</template>

<script>
import ShowDBTables from './components/ShowDBTables.vue';

export default {
  name: 'App',
  components: {
    ShowDBTables
  }
}
</script>
