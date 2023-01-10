<!-- <template>
    <div>
      <table>
        <thead>
          <tr>
            <th v-for="column in columns" :key="column">{{ column }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="row in rows" :key="row.id">
            <td v-for="cell in row" :key="cell">{{ cell }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  export default {
    props: ['columns', 'rows'],
  };
  </script> -->


  <template>
    <div>
      <table class="ant-table">
        <thead>
          <tr>
            <th v-for="column in columns" :key="column" class="ant-table-thead-th">{{ column }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="row in rows" :key="row.id">
            <td v-for="cell in row" :key="cell" class="ant-table-tbody-td">{{ cell }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>

<script>
export default {
  props: ['columns', 'rows'],
}
</script>

<style>
.ant-table {
  width: 100%;
  border-collapse: collapse;
}

.ant-table-thead-th {
  font-weight: bold;
  background-color: #fafafa;
  text-align: left;
  padding: 8px;
}

.ant-table-tbody-td {
  border: 1px solid #e8e8e8;
  padding: 8px;
}
</style>