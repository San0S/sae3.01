<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <div>
    <ShowDatabases />
  </div>
</template>

<script>
import ShowDatabases from './components/ShowDatabases.vue';

export default {
  name: 'App',
  components: {
    ShowDatabases
  }
}
</script>
