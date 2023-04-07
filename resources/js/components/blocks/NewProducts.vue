<template>
    <div class="new">
        <div class="new__header">
            <h2 class="new__header-title">новинки</h2>
            <div class="new__header-nav">
                <div class="new__header-nav-item" @click="slideRight">
                    <img src="/img/icons/arrowLeft.svg" alt="prev">
                </div>
                <div class="new__header-nav-item" @click="slideLeft">
                    <img src="/img/icons/arrowRight.svg" alt="next">
                </div>
            </div>
        </div>
        <div class="new-viewport" id="new-viewport">
            <div class="new__products" :style="{transform: 'translateX(-' + translate + 'px)'}" id="new__products">
                <a
                    class="new__products-item"
                    v-for="(product, index) in products"
                    :href="'/product/' + product.slug"
                    :class="{odd: (index + 1) % 2 === odd}"
                    id="product"
                >
                    <img :src="'/storage/products/' + product.images.img1" :alt="product.name" class="new__products-item-img">
                    <div class="new__products-item-block">
                        <div class="new__products-item-block-title">
                            <h3 class="new__products-item-block-title-name">{{ product.name }}</h3>
                            <p class="new__products-item-block-title-color">{{ product.color }}</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "NewProducts",

    data(){
        return{
            products: [],
            translate: 0,
            odd: 1,
            step: 1
        }
    },

    methods:{
        getNewProducts(){
            axios
                .get('/api/get-new-products')
                .then((data) => this.products = data.data)
        },

        slideLeft(){
            let step = document.getElementById('product').clientWidth
            let slideOnScreen = Math.floor(document.getElementById('new-viewport').clientWidth / step)
            if (this.step <= this.products.length - slideOnScreen){
                if (this.odd === 1){
                    this.odd = 0
                } else {
                    this.odd = 1
                }
                this.step ++
                this.translate += step + 12
            }
        },

        slideRight(){
            let step = document.getElementById('product').clientWidth
            if (this.translate !== 0){
                if (this.odd === 1){
                    this.odd = 0
                } else {
                    this.odd = 1
                }
                this.step --
                this.translate -= step + 12
            }
        }
    },

    beforeMount(){
        this.getNewProducts()
    }
}
</script>

<style lang="scss" scoped>
.new{
    position: relative;
    margin-top: 40px;
    margin-left: 30px;
    margin-right: 30px;

    &__header{
        position: absolute;
        width: 100%;
        display: grid;
        grid-template-columns: repeat(4, calc(25% - 36px / 4));
        gap: 12px;
        height: 130px;
        user-select: none;

        @media (max-width: 991px){
            grid-template-columns: repeat(2, calc(50% - 6px));
            height: 90px;
        }

        &-title{
            position: relative;
            z-index: 10;
            grid-column: 2/3;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 40px;
            color: #000;
            font-variation-settings: 'wght' 700;
            text-transform: uppercase;
            text-align: center;

            @media (max-width: 991px){
                grid-column: 1/2;
            }

            @media (max-width: 600px){
                font-size: 24px;
            }
        }

        &-nav{
            position: relative;
            z-index: 10;
            grid-column: 4/5;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;

            @media (max-width: 991px){
                grid-column: 2/3;
            }

            &-item{
                height: 100%;
                width: calc(50% - 6px);
                background: #333333;
                cursor: pointer;
                display: flex;
                justify-content: center;
                align-items: center;

                img{
                    width: 30px;
                    transform: scale(1);
                    transition: transform .3s ease;

                    @media (max-width: 991px){
                        width: 15px;
                    }
                }

                &:hover img{
                    transform: scale(.9);
                }
            }
        }
    }

    &-viewport{
        width: 100%;
        overflow: hidden;
    }

    &__products{
        padding-top: 142px;
        display: grid;
        grid-template-columns: repeat(16, calc(25% - 9px));
        gap: 12px;
        transition: transform .3s ease;

        @media (max-width: 991px){
            padding-top: 102px;
            grid-template-columns: repeat(16, calc(50% - 6.3px));
        }

        &-item{
            height: 600px;
            display: grid;
            grid-template-columns: 100%;
            grid-template-rows: 500px 1fr;
            gap: 16px;
            transform: translateY(0);
            transition: transform .3s ease;

            @media (max-width: 991px){
                height: 400px;
                grid-template-rows: 300px 1fr;
            }

            &.odd{
                transform: translateY(-142px);

                @media (max-width: 991px){
                    transform: translateY(0);
                }
            }

            &-img{
                height: 100%;
                width: 100%;
                object-fit: cover;
            }

            &-block{
                display: flex;
                justify-content: space-between;
                align-items: flex-start;

                &-title{
                    display: flex;
                    flex-direction: column;
                    align-items: flex-start;
                    justify-content: flex-start;

                    &-name{
                        font-size: 16px;
                        text-transform: uppercase;
                        color: #232323;
                        font-variation-settings: 'wght' 700;
                        margin-bottom: 8px;
                    }

                    &-color{
                        font-size: 16px;
                        text-transform: uppercase;
                        color: #232323;
                        font-variation-settings: 'wght' 300;
                    }
                }
            }
        }
    }
}
</style>
