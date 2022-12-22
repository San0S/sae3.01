<template>
  <div>
    <!-- <ShowTables :database="selectedDatabase"/> -->
    <ShowStructTables :selectedTable="selectedTable"/>
  </div>
</template>

<script>
import ShowStructTables from './ShowStructTables.vue'

export default {
  components: {
    ShowStructTables
  },
  data() {
    return {
    }
  }
}
</script>