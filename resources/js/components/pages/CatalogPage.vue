<template>
    <div class="container">
        <div class="breadcrumbs">
            <a href="/" class="breadcrumbs-item">Главная</a>
            <span>></span>
            <a href="/catalog" class="breadcrumbs-item">Каталог</a>
            <span v-if="category.slug">></span>
            <a :href="'/catalog/' + category.slug" class="breadcrumbs-item" v-if="category.slug">{{ category.name }}</a>
            <span v-if="category === 1">></span>
            <a href="/catalog/new" class="breadcrumbs-item" v-if="category === 1">Новинки</a>
        </div>
        <div class="products">
            <div class="products__list" v-if="products.length > 0">
                <div class="products__list-item" v-for="product in products">
                    <a :href="'/product/' + product.slug" class="products__list-item-img">
                        <img :src="'/storage/products/' + product.images.img1" :alt="product.name" class="products__list-item-img-image">
                    </a>
                    <div class="products__list-item-info">
                        <a :href="'/product/' + product.slug" class="products__list-item-info-title">
                            <h3 class="products__list-item-info-title-name">{{ product.name }}</h3>
                            <p class="products__list-item-info-title-color" v-if="product.color">{{ product.color }}</p>
                        </a>
                        <p class="products__list-item-info-price">
                            <span class="products__list-item-info-price-old" v-if="product.old_price">{{ product.old_price }}₽ </span>
                            {{ product.price }}₽
                        </p>
                    </div>
                </div>
            </div>
            <button class="btn-black products-more" :class="{hide: end}" @click="page++;getProducts()" v-if="products.length !== 0 && update === false">Показать ещё</button>
            <preloader v-if="update"></preloader>
            <div class="products__empty" v-if="products.length === 0 && update === false">
                <h3 class="products__empty-text">ничего не найдено</h3>
                <a href="/catalog" class="products__empty-link">Вернуться в каталог</a>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "CatalogPage",

    props: [
        'category',
    ],

    data(){
        return {
            products: [],
            page: 0,
            update: false,
            end: false
        }
    },

    methods: {
        getProducts(){
            this.update = true
            let category

            if (this.category == 0){
                category = 0
            } else if (this.category == 1){
                category = 1
            } else {
                category = this.category.id
            }

            axios
                .get('/api/get-products/' + category + '/' + this.page)
                .then((data) => {
                    if (data.data.length === 0){
                        this.end = true
                    }

                    this.products = [...this.products, ...data.data]
                })
                .then(() => this.update = false)
        }
    },

    beforeMount() {
        this.getProducts()
    }
}
</script>

<style lang="scss" scoped>
    .hide{
        display: none;
    }

    .products{
        margin-bottom: 40px;

        &__empty{
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            &-text{
                color: #1A1A1A;
                font-size: 32px;
                font-variation-settings: 'wght' 700;
                text-align: center;
                margin-bottom: 16px;
                text-transform: uppercase;
            }

            &-link{
                color: #1A1A1A;
                font-size: 18px;
                text-align: center;
            }
        }

        &__list{
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 24px;

            @media (max-width: 600px){
                grid-template-columns: 100%;
            }

            &-item{
                &-img{
                    &-image{
                        height: 500px;
                        width: 100%;
                        object-fit: cover;
                        margin-bottom: 12px;
                    }
                }

                &:nth-child(5n + 1){
                    grid-column: 1/3;
                }
                &:nth-child(5n + 2){
                    grid-column: 3/5;
                }
                &:nth-child(5n + 3){
                    grid-column: 5/7;
                }
                &:nth-child(5n + 4){
                    grid-column: 1/4;

                    img{
                        height: 700px;
                    }
                }
                &:nth-child(5n + 5){
                    grid-column: 4/7;

                    img{
                        height: 700px;
                    }
                }

                @media (max-width: 991px){
                    &:nth-child(6n + 1){
                        grid-column: 1/4;
                    }
                    &:nth-child(6n + 2){
                        grid-column: 4/7;
                    }
                    &:nth-child(6n + 3){
                        grid-column: 1/4;
                    }
                    &:nth-child(6n + 4){
                        grid-column: 4/7;

                        img{
                            height: 500px;
                        }
                    }
                    &:nth-child(6n + 5){
                        grid-column: 1/4;

                        img{
                            height: 500px;
                        }
                    }
                    &:nth-child(6n + 6){
                        grid-column: 4/7;
                    }
                }

                @media (max-width: 600px){
                    &:nth-child(1n + 1){
                        grid-column: 1/2;
                    }
                }

                &-info{
                    display: grid;
                    grid-template-columns: 1fr 100px;
                    gap: 8px;

                    &-title{
                        &-name{
                            text-transform: uppercase;
                            color: #1A1A1A;
                            font-size: 16px;
                            font-variation-settings: 'wght' 700;
                            margin-bottom: 4px;

                            @media (max-width: 1199px){
                                font-size: 14px;
                            }
                        }
                        &-color{
                            text-transform: uppercase;
                            color: #1A1A1A;
                            font-size: 16px;
                            font-variation-settings: 'wght' 300;
                            margin-bottom: 4px;

                            @media (max-width: 1199px){
                                font-size: 14px;
                            }
                        }
                    }

                    &-price{
                        align-self: center;
                        color: #1A1A1A;
                        text-align: right;
                        font-size: 22px;
                        font-variation-settings: 'wght' 300;

                        @media (max-width: 1199px){
                            font-size: 20px;
                        }

                        &-old{
                            align-self: center;
                            color: gray;
                            text-decoration: line-through;
                            text-align: right;
                            font-size: 18px;
                            font-variation-settings: 'wght' 300;

                            @media (max-width: 1199px){
                                font-size: 20px;
                            }
                        }
                    }
                }
            }
        }

        &-more{
            margin: 40px auto 0;
        }
    }
</style>
