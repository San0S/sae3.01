<template>
  <div>
    <ShowTables :database="selectedDatabase"/>
  </div>
</template>

<script>
import ShowTables from './ShowTables.vue'

export default {
  components: {
    ShowTables
  },
  data() {
    return {
      selectedDatabase: 'sae301_evaluation'
    }
  }
}
</script>