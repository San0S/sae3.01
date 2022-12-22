<template>
  <div>
    <ShowStructTables :selectedTable="selectedTable"/>
  </div>
</template>

<script>
import ShowStructTables from './components/ShowStructTables.vue'

export default {
  components: {
    ShowStructTables
  },
  data() {
    return {
      selectedTable: 'partiel2a'
    }
  }
}
</script>
