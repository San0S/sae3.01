<!-- 
// label -> db
// material-icons -> db-icons
// item-container -> table-container
 -->

<template>
    <div class="menu-db" :class="{ expanded : expanded }">
        <div class="db"
            @click="showTables()"
        >
            <i v-if="icon" class="left">
                <img class="db-icons" :src="require(`@/assets/database.png`)" alt="">
            </i>
            <span>{{ database.Database }}</span>
            <i v-if="tables" class="right">
                <img class="db-icons" :src="require(`@/assets/down.png`)" alt="">
            </i>
        </div>
    </div>

    <div 
        v-if="tables" 
        v-show="show" 
        class="table-container" 
        ref="container" 
        :style="{height: tableHeight}"
    >
        <Tables
            v-for="(item, index) in tables"
            :key="index"
            :nom="item.nom"
        />
    </div>
</template>


<script>
import axios from 'axios';
import Tables from './Tables.vue';

export default {
    name: 'menu-db',
    data: () => ({
        show: false,
        expanded: false,
        tableHeight: 0
    }),
    methods: {
        showTables(databaseName) {
            this.selectedDatabase = databaseName;
            axios.get(`http://localhost/db.php?database=${databaseName}`)
            .then(response => {
                this.tables = response.data;
            })
            .catch(error => {
                console.error(error);
            });
            this.expanded = !this.expanded;
            if(!this.show) {
                this.show = true;
                this.$nextTick(() => {
                    this.tableHeight = this.$refs["container"].scrollHeight + "px";
                    setTimeout(() => {
                        this.tableHeight = "fit-content";
                        this.$refs["container"].style.overflow = "visible";
                    }, 300)
                })
            } else {
                this.tableHeight = this.$refs["container"].scrollHeight + "px";
                this.$refs["container"].style.overflow = "hidden";
                setTimeout(() => {
                    this.tableHeight = 0 + "px";
                }, 10);
                setTimeout(() => {
                    this.show = false;
                }, 300);
            } 
        }
    },
    components: {
        Tables,
    }
}
</script>


<style lang="scss" scoped>

.menu-db {
    position: relative;
    width: 100%;
    .nom {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        white-space: nowrap;
        user-select: none;
        height: 50px;
        padding: 0 20px;
        box-sizing: border-box;
        transition: all .3s ease;
        > div {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        i {
            font-size: 20px;
            transition: all .3s ease;
            &.expand {
                font-size: 16px;
                &.expanded {
                    transform: rotate(180deg);
                }
            }
        }
        &.hover {
            background-color: beige;
            cursor: pointer;
        }
    }
    .table-container {
        width: 100%;
        overflow: hidden;
        transition: height .3s ease;
    }
    
}
.db-icons {
    width: 30px;
}

</style>