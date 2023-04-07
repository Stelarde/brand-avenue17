<template>
    <div class="container">
        <div class="breadcrumbs">
            <a href="/" class="breadcrumbs-item">Главная</a>
            <span>></span>
            <a href="/catalog" class="breadcrumbs-item">Каталог</a>
            <span>></span>
            <a :href="'/catalog/' + category.slug" class="breadcrumbs-item">{{ category.name }}</a>
            <span>></span>
            <a :href="'/product/' + product.slug" class="breadcrumbs-item">{{ product.name }}</a>
        </div>
        <div class="product">
            <div class="product__images">
                <div class="product__images-nav">
                    <img
                        v-for="(img, index) in images"
                        v-if="img"
                        @click="image = img; currentImage = index"
                        :src="'/storage/products/' + img"
                        :alt="product.name"
                        class="product__images-nav-item"
                        :class="{selected: currentImage === index}"
                    >
                </div>
                <img @click="nextImage" :src="'/storage/products/' + image" :alt="product.name" class="product__images-selected">
            </div>
            <div class="product__info">
                <h1 class="product__info-title">{{ product.name }}</h1>
                <p class="product__info-color" v-if="product.color">{{ product.color }}</p>
                <p class="product__info-price">{{ product.price }} ₽</p>
                <div class="product__info-size">
                    <p class="product__info-size-text">Подберите свой точный размер</p>
                    <input type="hidden" :value="selectedSize">
                    <dropdown @dropdown="dropdown" :data="product.sizes"></dropdown>
                    <button class="product__info-size-addcart" @click="addCart">ДОБАВИТЬ В КОРЗИНУ</button>
                </div>
                <div class="product__info-desc">
                    <h3 class="product__info-desc-title">Детали</h3>
                    <p class="product__info-desc-text" v-if="product.article">Артикул: {{ product.article }}</p>
                    <p class="product__info-desc-text" v-if="product.desc">{{ product.desc }}</p>
                </div>
            </div>
        </div>
        <div class="product__popup" v-if="popup">
            <div class="product__popup-bg"></div>
            <div class="product__popup-body">
                <h3 class="product__popup-title">Товар добавлен в корзину</h3>
                <div class="product__popup-actions">
                    <a href="/cart" class="btn-black product__popup-actions-btn">Перейти в корзину</a>
                    <button class="btn-black product__popup-actions-btn" @click="popup = !popup">Продолжить покупки</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "ProductPage",

    props: ['product'],

    data(){
        return {
            category: {},
            images: [
                this.product.images.img1,
                this.product.images.img2,
                this.product.images.img3,
                this.product.images.img4,
                this.product.images.img5,
                this.product.images.img6,
                this.product.images.img7,
                this.product.images.img8,
                this.product.images.img9,
                this.product.images.img10
            ],
            image: this.product.images.img1,
            currentImage: 0,
            selectedSize: "",
            popup: false
        }
    },

    methods: {
        getCategory(){
            axios
                .get('/api/get-category/' + this.product.categories[0].category_id)
                .then((data) => this.category = data.data)
        },

        nextImage(){
            if (this.currentImage !== 9){
                this.currentImage ++
            } else {
                this.currentImage = 0
            }
            if (this.images[this.currentImage]){
                this.image = this.images[this.currentImage]
            } else {
                this.nextImage()
            }
        },

        dropdown(size){
            this.selectedSize = size
        },

        addCart(){
            if (this.selectedSize === ""){
                alert("Необходимо выбрать размер")
                return
            }
            let cart = localStorage.getItem('cart')
            const cartItem = {
                product: this.product,
                size: this.selectedSize,
                quantity: 1
            }

            if (cart){
                let check = false
                cart = JSON.parse(cart)
                cart.forEach((item) => {
                    if (item.product.id === cartItem.product.id && item.size === this.selectedSize){
                        check = true
                        item.quantity ++
                    }
                })

                if (check === false){
                    cart.push(cartItem)
                }
                localStorage.setItem('cart', JSON.stringify(cart))
            } else {
                localStorage.setItem('cart', '[' + JSON.stringify(cartItem) + ']')
            }

            this.popup = !this.popup
        }
    },

    beforeMount() {
        this.getCategory()
    }
}
</script>

<style lang="scss" scoped>
    .product{
        display: grid;
        grid-template-columns: 1fr 300px;
        gap: 16px;

        @media (max-width: 991px){
            grid-template-columns: 100%;
            gap: 40px;
        }

        &__popup{
            left: 0;
            top: 0;
            z-index: 100000;
            position: fixed;
            height: 100vh;
            width: 100vw;
            display: flex;
            justify-content: center;
            align-items: center;

            &-bg{
                position: fixed;
                height: 100vh;
                width: 100vw;
                left: 0;
                top: 0;
                background: rgba(0, 0, 0, .8);
            }

            &-body{
                z-index: 999999999;
                background: #fff;
                padding: 16px 8px;
            }

            &-title{
                font-size: 24px;
                font-variation-settings: 'wght' 200;
                text-align: center;
                margin-bottom: 16px;
            }

            &-actions{
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;

                @media (max-width: 600px){
                    flex-direction: column;
                }
            }
        }

        &__images{
            display: grid;
            grid-template-columns: 100px 1fr;
            height: 600px;
            gap: 16px;

            @media (max-width: 991px){
                height: 400px;
            }

            @media (max-width: 400px){
                grid-template-columns: 1fr;
            }

            &-nav{
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                overflow: auto;
                height: 600px;
                gap: 16px;

                @media (max-width: 991px){
                    height: 400px;
                }

                @media (max-width: 400px){
                    flex-direction: row;
                    height: 100px;
                    grid-row: 2/3;
                }

                &::-webkit-scrollbar{
                    display: none;
                }

                &-item{
                    cursor: pointer;
                    width: 100px;
                    object-fit: cover;

                    @media (max-width: 400px){
                        height: 100px;
                        width: auto;
                    }

                    &.selected{
                        border: 2px solid #E83C6B;
                    }
                }
            }

            &-selected{
                cursor: pointer;
                object-fit: cover;
                height: 600px;

                @media (max-width: 991px){
                    height: 400px;
                }

                @media (max-width: 400px){
                    height: 300px;
                    margin: 0 auto;
                }
            }
        }

        &__info{
            &-title{
                font-size: 18px;
                font-variation-settings: 'wght' 300;
                text-transform: uppercase;
            }
            &-color{
                font-size: 14px;
                font-variation-settings: 'wght' 300;
                text-transform: uppercase;
            }
            &-price{
                margin-top: 24px;
                margin-bottom: 8px;
                font-variation-settings: 'wght' 700;
            }
            &-size{
                margin-bottom: 40px;
                &-text{
                    font-size: 16px;
                    font-variation-settings: 'wght' 300;
                    margin-bottom: 8px;
                }
                &-addcart{
                    height: 40px;
                    text-align: center;
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background: #1A1A1A;
                    color: #fff;
                    margin-top: 8px;
                }
            }
            &-desc{
                &-title{
                    margin-bottom: 16px;
                    font-variation-settings: 'wght' 700;
                }
                &-text{
                    white-space: pre-wrap;
                    line-height: 24px;
                    font-variation-settings: 'wght' 300;
                }
            }
        }
    }
</style>
