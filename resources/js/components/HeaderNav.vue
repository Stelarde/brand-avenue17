<template>
    <div class="header__nav">
        <a href="/catalog" class="header__nav-item" @mouseover="showCategory = true">Основная коллекция</a>
        <a href="/#philosophy" class="header__nav-item" @mouseover="showCategory = false">Философия</a>
        <a href="#footer" class="header__nav-item" @mouseover="showCategory = false">Контакты</a>
        <a href="/cart" class="header__nav-item header-cart" @mouseover="showCategory = false"><img src="/img/icons/cart.svg" alt="Корзина"><span>{{ getCartCount() }}</span></a>
        <div class="header__nav-categories" v-if="categories.length > 0" v-show="showCategory" @mouseleave="showCategory = false">
            <div class="container">
                <div class="header__nav-categories-body">
                    <div class="header__nav-categories-list">
                        <a href="/catalog/new" class="header__nav-categories-list-new">Новинки</a>
                        <a
                            class="header__nav-categories-list-item"
                            v-for="category in categories"
                            :href="'/catalog/' + category.slug"
                            @mouseover="categoryImg = category.img"
                        >
                            {{ category.name }}
                        </a>
                    </div>
                    <img
                        :src="'/storage/categories/' + categoryImg"
                        class="header__nav-categories-img"
                    >
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "HeaderNav",

    data(){
        return{
            showCategory: false,
            categories: [],
            categoryImg: false
        }
    },

    methods: {
        getCategories(){
            axios
                .get('/api/get-menu-categories')
                .then((data) => this.categories = data.data)
                .then(() => this.categoryImg = this.categories[0].img)
        },

        getCartCount(){
            let cart = localStorage.getItem('cart')
            cart = JSON.parse(cart)
            if (cart){
                return cart.length
            } else {
                return 0
            }
        }
    },

    beforeMount() {
        this.getCategories()
    }
}
</script>

<style lang="scss" scoped>
    .header__nav{
        margin-top: 24px;
        display: flex;
        justify-content: center;
        align-items: center;

        @media (max-width: 992px){
            display: none;
        }

        &-item{
            color: #000;
            font-size: 20px;
            font-variation-settings: 'wght' 800;

            &:not(:last-child){
                margin-right: 40px;
            }
        }

        &-categories{
            z-index: 10000;
            position: absolute;
            background: #fff;
            bottom: 0;
            transform: translateY(100%);
            padding: 44px 0 24px 0;
            width: 100%;

            &-body{
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 40px;
            }

            &-list{
                position: relative;
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 24px;
                height: fit-content;

                &-new{
                    position: absolute;
                    top: -40px;
                    left: 0;
                    color: #000;
                    font-size: 16px;
                    line-height: 16px;
                    font-variation-settings: 'wght' 800;
                }

                &-item{
                    width: fit-content;
                    color: #000;
                    font-size: 16px;
                    font-variation-settings: 'wght' 500;
                }
            }

            &-img{
                height: 240px;
                object-fit: cover;
            }
        }
    }

    .header-cart{
        position: relative;

        & span{
            position: absolute;
            right: 0;
            top: 0;
            transform: translateX(100%);
            font-size: 12px;
        }
    }
</style>
