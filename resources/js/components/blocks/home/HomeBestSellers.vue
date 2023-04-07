<template>
    <div class="bestsellers">
        <preloader v-if="categories.length === 0"></preloader>
        <a
            class="bestsellers__item"
            v-for="category in categories"
            :href="'/catalog/' + category.slug"
            :style="{backgroundImage: 'url(/storage/categories/' + category.img + ')'}"
            v-if="categories.length > 0"
        >
            <button class="btn-white bestsellers__item-btn">{{ category.name }}</button>
        </a>
        <div class="bestsellers__text" v-if="categories.length > 0">
            <a :href="'/catalog/' + categories[0].slug">BEST</a>
            <span>SELLER’S</span>
            <p>Мы заботимся о качетсве и производим только лучшую одежду для вашей жизни</p>
        </div>
        <a href="/catalog" class="btn-black bestsellers-btn" v-if="categories.length > 0">Посмотреть все</a>
    </div>
</template>

<script>
export default {
    name: "HomeBestSellers",

    data(){
        return {
            categories: []
        }
    },

    methods: {
        getCategories(){
            axios
                .get('/api/get-top-categories')
                .then((data) => this.categories = data.data)
        }
    },

    beforeMount() {
        this.getCategories()
    }
}
</script>

<style lang="scss" scoped>
.bestsellers{
    position: relative;
    display: grid;
    grid-template-columns: 35% 30% 35%;
    grid-template-rows: 400px 400px 600px;
    padding-bottom: 80px;

    @media (max-width: 992px){
        grid-template-columns: 45% 55%;
        grid-template-rows: 250px 250px 250px;
    }

    &__item{
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        display: flex;
        justify-content: center;
        align-items: flex-end;

        &:nth-child(1){
            grid-column: 1/2;
            grid-row: 1/2;
        }

        &:nth-child(2){
            grid-column: 1/2;
            grid-row: 2/3;
        }

        &:nth-child(3){
            grid-column: 2/3;
            grid-row: 2/3;
        }

        &:nth-child(4){
            grid-column: 3/4;
            grid-row: 2/3;

            @media (max-width: 992px){
                grid-column: 1/2;
                grid-row: 3/4;
            }
        }

        &:nth-child(5){
            grid-column: 1/2;
            grid-row: 3/4;

            @media (max-width: 992px){
                grid-column: 2/3;
                grid-row: 3/4;
            }
        }

        &:nth-child(6){
            grid-column: 2/4;
            grid-row: 3/4;

            @media (max-width: 992px){
                display: none;
            }
        }

        &-btn{
            margin-bottom: 40px;

            @media (max-width: 600px){
                width: 80%;
            }
        }
    }

    &__text{
        position: absolute;
        width: 100%;
        top: 0;
        height: 400px;
        display: flex;
        user-select: none;

        @media (max-width: 992px){
            height: 250px;
        }

        span, a{
            font-size: 180px;
            font-variation-settings: 'wght' 700;

            @media (max-width: 1400px){
                font-size: 120px;
            }

            @media (max-width: 992px){
                font-size: 80px;
            }

            @media (max-width: 700px){
                font-size: 40px;
            }
        }

        a:first-child{
            color: #fff;
            width: 35%;
            display: flex;
            justify-content: flex-end;

            @media (max-width: 992px){
                width: 45%;
            }
        }

        span:nth-child(2){
            color: #000;
            display: flex;
            justify-content: flex-start;
        }

        p{
            position: absolute;
            right: 15%;
            bottom: 40px;
            max-width: 400px;
            font-size: 20px;
            text-align: right;
            font-variation-settings: 'wght' 100;

            @media (max-width: 992px){
                font-size: 14px;
                right: 15px;
                max-width: 200px;
            }

            @media (max-width: 600px){
                right: 4px;
                max-width: 50%;
            }
        }
    }

    &-btn{
        position: absolute;
        bottom: 15px;
        left: 50%;
        transform: translateX(-50%);
    }
}
</style>
