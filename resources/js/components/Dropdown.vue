<template>
    <div class="dropdown" @click="show = !show">
        <span class="dropdown-value">{{ selected }}</span>
        <img class="dropdown-arrow" src="/img/icons/arrowDown.svg" alt="dropdown arrow">
        <ul class="dropdown__list" v-show="show">
            <li class="dropdown__list-item" v-for="item in data" @click="select(item.name)">{{ item.name }}</li>
        </ul>
    </div>
</template>

<script>
export default {
    name: "Dropdown",

    props: ['data'],

    data(){
        return {
            selected: "Выбрать размер",
            show: false
        }
    },

    methods: {
        select(value){
            this.selected = value

            this.$emit("dropdown", value)
        }
    }
}
</script>

<style lang="scss" scoped>
    .dropdown{
        width: 100%;
        height: 40px;
        border: 1px solid #1A1A1A;
        border-radius: 2px;
        position: relative;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        cursor: pointer;

        &-value{
            font-size: 12px;
            font-variation-settings: 'wght' 500;
            padding-left: 12px;
        }

        &-arrow{
            position: absolute;
            right: 12px;
            height: 8px;
        }

        &__list{
            border: 1px solid #1a1a1a;
            background: #fff;
            z-index: 10;
            position: absolute;
            height: 60px;
            bottom: -60px;
            overflow: auto;
            width: 100%;
            left: 0;

            &-item{
                font-size: 12px;
                padding: 4px 12px;
                cursor: pointer;
                transition: background .3s ease;

                &:hover{
                    background: rgba(0, 0, 0, .2);
                }

                &:not(:last-child){
                    border-bottom: 1px solid #1a1a1a;
                }
            }
        }
    }
</style>
