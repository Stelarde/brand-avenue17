<template>
    <div class="container">
        <div class="breadcrumbs">
            <a href="/" class="breadcrumbs-item">Главная</a>
            <span>></span>
            <a href="/cart" class="breadcrumbs-item">Корзина</a>
        </div>
        <div class="cart" v-if="cart">
            <div class="cart__list">
                <div class="cart__list-item" v-for="(item, index) in cart">
                    <a :href="'/product/' + item.product.slug" class="cart__list-item-img">
                        <img :src="'/storage/products/' + item.product.images.img1" :alt="item.product.name" class="cart__list-item-img-image">
                    </a>
                    <div class="cart__list-item-info">
                        <p class="cart__list-item-info-article" v-if="item.product.article">Артикул: {{ item.product.article }}</p>
                        <p class="cart__list-item-info-title">{{ item.product.name }}</p>
                        <p class="cart__list-item-info-color" v-if="item.product.color">{{ item.product.color }}</p>
                    </div>
                    <p class="cart__list-item-size">Размер: {{ item.size }}</p>
                    <input type="hidden" :value="item.quantity">
                    <div class="cart__list-item-quantity">
                        <p class="cart__list-item-quantity-minus" @click="() => {
                            if (item.quantity > 1){
                                item.quantity --
                                updateCart()
                            }
                        }">-</p>
                        <span class="cart__list-item-quantity-value">{{ item.quantity }}</span>
                        <p class="cart__list-item-quantity-plus" @click="() => {
                            item.quantity++
                            updateCart()
                        }">+</p>
                    </div>
                    <p class="cart__list-item-price">{{ item.product.price * item.quantity }} ₽</p>
                    <img src="/img/icons/delete.svg" alt="" class="cart__list-item-del" @click="delItem(index)">
                </div>
            </div>
            <div class="cart__info">
                <div class="cart__info-promocode">
                    <p class="cart__info-promocode-title" @click="promocodeShow = !promocodeShow">ввести промокод</p>
                    <input type="text" class="input cart__info-promocode-input" placeholder="Промокод" v-model="promocodeInput" v-if="promocodeShow">
                    <p class="cart__info-promocode-error" v-if="promocodeError && promocodeShow">Введен недействительный промокод</p>
                    <button class="btn-black cart__info-promocode-btn" @click="getPromocode" v-if="promocodeShow">Применить</button>
                </div>
                <div class="cart__info-calculate">
                    <div class="cart__info-calculate-col">
                        <p class="cart__info-calculate-col-title">Доставка</p>
                        <p class="cart__info-calculate-col-value">0 ₽</p>
                    </div>
                    <div class="cart__info-calculate-col" v-if="promocode">
                        <p class="cart__info-calculate-col-title">Скидка ({{promocode.discount}}%)</p>
                        <p class="cart__info-calculate-col-value">{{ cartPrice / 100 * promocode.discount }} ₽</p>
                    </div>
                    <div class="cart__info-calculate-col" v-if="promocode">
                        <p class="cart__info-calculate-col-title">Итого</p>
                        <p class="cart__info-calculate-col-value">{{ cartPrice - (cartPrice / 100 * promocode.discount) }} ₽</p>
                    </div>
                    <div class="cart__info-calculate-col" v-else>
                        <p class="cart__info-calculate-col-title">Итого</p>
                        <p class="cart__info-calculate-col-value">{{ cartPrice }} ₽</p>
                    </div>
                </div>
            </div>
            <h3 class="cart-title">Оформление заказа</h3>
            <div class="cart__order">
                <div class="cart__order-form">
                    <div class="cart__order-form-group">
                        <label for="email" class="cart__order-form-group-label">E-mail*</label>
                        <input type="text" id="email" class="input cart__order-form-group-input" v-model="email">
                    </div>
                    <div class="cart__order-form-group">
                        <label for="name" class="cart__order-form-group-label">Имя*</label>
                        <input type="text" id="name" class="input cart__order-form-group-input" v-model="name">
                    </div>
                    <div class="cart__order-form-group">
                        <label for="phone" class="cart__order-form-group-label">Телефон*</label>
                        <input type="text" id="phone" class="input cart__order-form-group-input" v-model="phone">
                    </div>
                    <div class="cart__order-form-group-radio">
                        <label for="delivery" class="cart__order-form-group-label">Способ доставки*</label>
                        <div class="cart__order-form-group-radio-group">
                            <input type="radio" name="delivery" id="delivery1" value="Курьер" class="cart__order-form-group-radio-group-input" v-model="delivery">
                            <label for="delivery1" class="cart__order-form-group-radio-group-label">
                                Доставка от 10000р. бесплатно
                            </label>
                        </div>
                        <div class="cart__order-form-group-radio-group">
                            <input type="radio" name="delivery" id="delivery2" value="Самовывоз" class="cart__order-form-group-radio-group-input" v-model="delivery">
                            <label for="delivery2" class="cart__order-form-group-radio-group-label">
                                Самовывоз из магазина
                            </label>
                        </div>
                    </div>
                    <div class="cart__order-form-group">
                        <label for="street" class="cart__order-form-group-label">Улица*</label>
                        <input type="text" id="street" class="input cart__order-form-group-input" v-model="street">
                    </div>
                    <div class="cart__order-form-group">
                        <label for="home" class="cart__order-form-group-label">Дом*</label>
                        <input type="text" id="home" class="input cart__order-form-group-input" v-model="home">
                    </div>
                    <div class="cart__order-form-group">
                        <label for="room" class="cart__order-form-group-label">Квартира / офис*</label>
                        <input type="text" id="room" class="input cart__order-form-group-input" v-model="room">
                    </div>
                    <div class="cart__order-form-group">
                        <label for="comment" class="cart__order-form-group-label">Коментарий</label>
                        <textarea id="comment" class="input cart__order-form-group-input" v-model="comment"></textarea>
                    </div>
                    <div class="cart__order-form-group-radio">
                        <label for="payment" class="cart__order-form-group-label">Способ оплаты*</label>
                        <div class="cart__order-form-group-radio-group">
                            <input type="radio" name="payment" id="payment1" value="Банковской картой" class="cart__order-form-group-radio-group-input" v-model="payment">
                            <label for="payment1" class="cart__order-form-group-radio-group-label">
                                Банковской картой
                            </label>
                        </div>
                        <div class="cart__order-form-group-radio-group">
                            <input type="radio" name="payment" id="payment2" value="Наличными при получении" class="cart__order-form-group-radio-group-input" v-model="payment">
                            <label for="payment2" class="cart__order-form-group-radio-group-label">
                                Наличными при получении
                            </label>
                        </div>
                    </div>
                </div>
                <div class="cart__order-submit" v-if="payment === 'Наличными при получении'">
                    <button class="btn-black cart__order-submit-btn" @click="createOrder">Создать заказ</button>
                    <p class="cart__order-submit-text">
                        Нажимая на кнопку «создать заказ», Вы принимаете условия публичной оферты и политики конфиденциальности
                    </p>
                </div>
                <div class="cart__order-submit" v-if="payment === 'Банковской картой'">
                    <form name="TinkoffPayForm" @submit="createPay">
                        <button class="btn-black cart__order-submit-btn" type="submit">Оплатить заказ</button>
                    </form>
                    <p class="cart__order-submit-text">
                        Нажимая на кнопку «оплатить заказ», Вы принимаете условия публичной оферты и политики конфиденциальности
                    </p>
                </div>
            </div>
        </div>
        <div class="cart__empty" v-else>
            <h2 class="cart__empty-text">Тут пока пусто</h2>
        </div>
        <div class="cart__popup" v-if="popup">
            <div class="cart__popup-bg" @click="popup = false"></div>
            <div class="cart__popup-body">
                <h3 class="cart__popup-title">Спасибо за заказ!</h3>
                <p class="cart__popup-text">Скоро с Вами свяжется менеджер для подтверждения заказа</p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "CartPage",

    data(){
        return {
            cart: [],
            promocodeInput: "",
            promocodeError: false,
            promocodeShow: false,
            promocode: null,
            delivery: "Курьер",
            email: "",
            name: "",
            phone: "",
            street: "",
            home: "",
            room: "",
            comment: "",
            payment: "Банковской картой",
            popup: false
        }
    },

    methods: {
        getCart(){
            this.cart = JSON.parse(localStorage.getItem('cart'))
        },

        updateCart(){
            const cart = JSON.stringify(this.cart)
            localStorage.setItem('cart', cart)
        },

        delItem(index){
            this.cart.splice(index, 1)
            this.updateCart()
        },

        getPromocode(){
            axios
                .get('/api/get-promo/' + this.promocodeInput)
                .then((data) => {
                    this.promocode = data.data
                    this.promocodeError = false
                })
                .catch(() => this.promocodeError = true)
        },

        createOrder(){
            let summ = this.cartPrice

            if (this.promocode){
                summ = summ - (summ / 100 * this.promocode.discount)
            }

            axios
                .post('/api/create-order', {
                    cart: JSON.stringify(this.cart),
                    delivery: this.delivery,
                    email: this.email,
                    name: this.name,
                    phone: this.phone,
                    street: this.street,
                    home: this.home,
                    room: this.room,
                    comment: this.comment,
                    payment: this.payment,
                    promocode_id: this.promocode,
                    summ: summ
                })
                .then(() => {
                    this.delivery = "Курьер"
                    this.email = ""
                    this.name = ""
                    this.phone = ""
                    this.street = ""
                    this.home = ""
                    this.room = ""
                    this.comment = ""
                    this.payment = "Банковской картой"
                    this.cart = null
                    localStorage.removeItem('cart')
                    this.popup = true
                })
        },

        createPay(){
            event.preventDefault()
            let summ = this.cartPrice

            if (this.promocode){
                summ = summ - (summ / 100 * this.promocode.discount)
            }

            axios
                .post('/api/create-order', {
                    cart: JSON.stringify(this.cart),
                    delivery: this.delivery,
                    email: this.email,
                    name: this.name,
                    phone: this.phone,
                    street: this.street,
                    home: this.home,
                    room: this.room,
                    comment: this.comment,
                    payment: this.payment,
                    promocode_id: this.promocode,
                    summ: summ
                })
                .then((data) => {
                    this.getPayLink(summ, data.data)
                })
                .catch(() => alert('Поля заполнены не верно'))
        },

        getPayLink(summ, orderId){
            axios
                .post('/api/get-payment-form', {
                    summ: summ * 100,
                    orderId: orderId,
                    phone: this.phone,
                    email: this.email
                })
                .then((data) => window.open(data.data))
                .then(() => {
                    this.delivery = "Курьер"
                    this.email = ""
                    this.name = ""
                    this.phone = ""
                    this.street = ""
                    this.home = ""
                    this.room = ""
                    this.comment = ""
                    this.payment = "Банковской картой"
                    this.cart = null
                    localStorage.removeItem('cart')
                    this.popup = true
                })
        }
    },

    computed: {
        cartPrice(){
            let price = 0
            this.cart.forEach((item) => {
                price += item.product.price * item.quantity
            })

            return price
        }
    },

    beforeMount() {
        this.getCart()
    }
}
</script>

<style lang="scss" scoped>
    .cart{
        &__popup{
            left: 0;
            top: 0;
            z-index: 1000;
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
                text-align: center;
                margin-bottom: 16px;
            }

            &-text{
                font-size: 16px;
                font-variation-settings: 'wght' 200;
                text-align: center;
            }
        }

        &__empty{
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;

            &-text{
                font-size: 24px;
                font-variation-settings: 'wght' 700;
                text-align: center;
            }
        }

        &__list{
            border-bottom: .5px solid #8D8D8D;

            &-item{
                display: grid;
                grid-template-columns: 100px 1fr 120px 120px 100px 40px;
                gap: 16px;
                padding-bottom: 16px;

                @media (max-width: 991px){
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }

                &:not(:last-child){
                    margin-bottom: 16px;
                }

                &-img{
                    width: 100%;
                    max-width: 200px;
                    justify-self: center;

                    &-image{
                        width: 100%;
                        object-fit: cover;
                    }
                }

                &-info{
                    align-self: center;

                    &-article{
                        font-size: 14px;
                        color: #1A1A1A;
                        font-variation-settings: 'wght' 300;

                        @media (max-width: 991px){
                            text-align: center;
                        }
                    }

                    &-title{
                        font-size: 18px;
                        font-variation-settings: 'wght' 400;
                        text-transform: uppercase;

                        @media (max-width: 991px){
                            text-align: center;
                        }
                    }

                    &-color{
                        font-variation-settings: 'wght' 300;
                        text-transform: uppercase;

                        @media (max-width: 991px){
                            text-align: center;
                        }
                    }
                }

                &-size{
                    font-variation-settings: 'wght' 300;
                    align-self: center;
                }

                &-quantity{
                    position: relative;
                    width: 120px;
                    height: 40px;
                    border: 1px solid #1A1A1A;
                    border-radius: 2px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    align-self: center;

                    &-minus, &-plus{
                        position: absolute;
                        font-size: 32px;
                        height: 40px;
                        font-variation-settings: 'wght' 300;
                        user-select: none;
                        cursor: pointer;
                    }

                    &-minus{
                        left: 4px;
                    }

                    &-plus{
                        right: 4px;
                    }
                }

                &-price{
                    align-self: center;
                    font-variation-settings: 'wght' 700;
                }

                &-del{
                    align-self: center;
                    height: 40px;
                    width: 40px;
                    user-select: none;
                    cursor: pointer;
                }
            }
        }

        &__info{
            margin-top: 40px;
            display: grid;
            grid-template-columns: 1fr 300px;

            @media (max-width: 991px) {
                grid-template-columns: 100%;
                gap: 16px;
            }

            &-promocode{
                &-title{
                    width: fit-content;
                    text-transform: uppercase;
                    text-decoration: underline;
                    cursor: pointer;
                }

                &-error{
                    color: #E83C6B;
                    margin-bottom: 8px;
                    margin-top: -4px;
                    font-variation-settings: 'wght' 300;
                }

                &-input{
                    width: 240px;
                    margin-top: 16px;
                    margin-bottom: 8px;
                }
            }

            &-calculate{
                &-col{
                    display: flex;
                    justify-content: space-between;
                    align-items: center;

                    &:not(:last-child){
                        margin-bottom: 24px;
                    }

                    &-value{
                        font-variation-settings: 'wght' 700;
                    }
                }
            }
        }

        &-title{
            margin-top: 40px;
            font-variation-settings: 'wght' 700;
            margin-bottom: 24px;
            text-transform: uppercase;
        }

        &__order{
            display: grid;
            grid-template-columns: 1fr 300px;
            gap: 16px;

            @media (max-width: 991px) {
                grid-template-columns: 100%;
            }

            &-form{
                &-group{
                    display: grid;
                    grid-template-columns: 200px 1fr;

                    @media (max-width: 600px){
                        grid-template-columns: 100%;
                        gap: 8px;
                    }

                    &:not(:last-child){
                        margin-bottom: 16px;
                    }

                    &-label{
                        align-self: center;
                    }

                    textarea{
                        resize: none;
                        height: 120px;
                    }
                }

                &-group-radio{
                    display: grid;
                    grid-template-columns: 200px 1fr;

                    @media (max-width: 600px){
                        grid-template-columns: 100%;
                        gap: 8px;
                    }

                    &:not(:last-child){
                        margin-bottom: 16px;
                    }

                    &-group{
                        grid-column: 2/3;
                        max-width: 340px;
                        display: flex;
                        justify-content: flex-start;
                        align-items: center;

                        @media (max-width: 600px){
                            grid-column: 1/2;
                        }

                        &:not(:last-child){
                            margin-bottom: 8px;
                        }

                        &-input{
                            margin-right: 16px;
                        }

                        &-label{
                            font-size: 14px;
                            line-height: 110%;
                        }
                    }
                }
            }

            &-submit{
                &-btn{
                    width: 100%;
                }

                &-text{
                    margin-top: 16px;
                    font-size: 12px;
                    font-variation-settings: 'wght' 300;
                }
            }
        }
    }
</style>
