<template>
  <div>
    <ShowTables :database="selectedDatabase" :table="selectedTable"/>
  </div>
</template>

<script>
import ShowTables from './ShowTables.vue'

export default {
  components: {
    ShowTables
  },
  props: {
    selectedTable: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      selectedDatabase: 'sae301_evaluation'
    }
  }
}
</script>
