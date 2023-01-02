<template>
    <div class="menu-table">
        <div class="table">
            <i v-if="icon" class="left">
                <img class="table-icons" :src="require(`@/assets/table.png`)" alt="">
            </i>
            <span>{{ nom }}</span>
        </div>
    </div>
</template>

<script>
export default {
    name: 'menu-table',
}
</script>

<style>

.table-icons {
    width: 30px;
}

</style>