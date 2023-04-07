<template>
    <div class="header__mobile">
        <img src="/img/icons/burger.svg" alt="menu" class="header__mobile-burger" @click="showMenu = !showMenu">
        <div class="header__mobile-nav" v-show="showMenu">
            <div class="header__mobile-nav-bg" @click="showMenu = !showMenu"></div>
            <div class="header__mobile-nav-body">
                <img src="/img/logo.svg" alt="VICOLO" class="header__mobile-nav-logo">
                <div class="header__mobile-nav-list">
                    <p class="header__mobile-nav-list-item" @click="showCategories = !showCategories">Каталог <img src="/img/icons/arrowDown.svg" alt="arrow"></p>
                    <div class="header__mobile-nav-list-categories" v-show="showCategories">
                        <a href="/catalog" class="header__mobile-nav-list-categories-item">Все категории</a>
                        <a href="/catalog/new" class="header__mobile-nav-list-categories-item">Новинки</a>
                        <a
                            class="header__mobile-nav-list-categories-item"
                            v-for="category in categories"
                            :href="'/catalog/' + category.slug"
                        >
                            {{ category.name }}
                        </a>
                    </div>
                    <a href="/#philosophy" class="header__mobile-nav-list-item">История</a>
                    <a href="#footer" class="header__mobile-nav-list-item">Контакты</a>
                    <a href="/cart" class="header__mobile-nav-list-item">Корзина ({{ getCartCount() }})</a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "HeaderMobileNav",

    data(){
        return{
            showMenu: false,
            showCategories: false,
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
    .header__mobile{
        display: none;

        @media (max-width: 992px) {
            display: unset;

            &-burger{
                cursor: pointer;
                width: 32px;
                height: 32px;
                position: absolute;
                top: 50%;
                right: 15px;
                transform: translateY(-50%);
            }

            &-nav{
                z-index: 1000;
                position: fixed;
                height: 100vh;
                width: 100vw;
                left: 0;
                top: 0;

                &-bg{
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, .5);
                }

                &-body{
                    overflow: auto;
                    position: fixed;
                    height: 100vh;
                    width: 240px;
                    top: 0;
                    right: 0;
                    background: #fff;
                    padding: 40px 16px;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: flex-start;
                }

                &-logo{
                    width: 120px;
                    margin-bottom: 40px;
                }

                &-list{
                    width: 100%;
                    display: flex;
                    flex-direction: column;
                    align-items: flex-start;
                    justify-content: flex-start;

                    &-item{
                        font-size: 16px;
                        color: #000;
                        display: flex;
                        justify-content: flex-start;
                        align-items: center;

                        img{
                            margin-left: 4px;
                            width: 12px;
                        }

                        &:not(:last-child){
                            margin-bottom: 16px;
                        }
                    }

                    &-categories{
                        display: flex;
                        flex-direction: column;
                        align-items: flex-start;
                        justify-content: center;
                        margin-bottom: 16px;

                        &-item{
                            font-size: 16px;
                            color: #000;
                            margin-bottom: 16px;
                        }
                    }
                }
            }
        }
    }
</style>
