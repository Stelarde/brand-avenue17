<template>
    <footer class="footer" id="footer">
        <div class="container">
            <div class="footer-body">
                <div class="footer__header">
                    <h2 class="footer__header-title">контакты</h2>
                    <div class="footer__header-line"></div>
                </div>
                <div class="footer__contacts">
                    <div class="footer__contacts-socials">
                        <a :href="settings.instagram" target="_blank" class="footer__contacts-socials-item" v-if="settings.instagram">
                            <img src="/img/icons/instagram-white.svg" alt="instagram" class="footer__contacts-socials-item-icon">
                        </a>
                        <a :href="settings.vk" target="_blank" class="footer__contacts-socials-item" v-if="settings.vk">
                            <img src="/img/icons/vk-white.svg" alt="vk" class="footer__contacts-socials-item-icon">
                        </a>
                        <a :href="settings.facebook" target="_blank" class="footer__contacts-socials-item" v-if="settings.facebook">
                            <img src="/img/icons/facebook-white.svg" alt="facebook" class="footer__contacts-socials-item-icon">
                        </a>
                        <a :href="settings.telegram" target="_blank" class="footer__contacts-socials-item" v-if="settings.telegram">
                            <img src="/img/icons/tg-white.svg" alt="telegram" class="footer__contacts-socials-item-icon">
                        </a>
                    </div>
                    <div class="footer__contacts-list">
                        <p class="footer__contacts-list-title">адрес магазина</p>
                        <p class="footer__contacts-list-value">{{settings.address}}</p>
                        <p class="footer__contacts-list-title">телефон</p>
                        <p class="footer__contacts-list-value">{{settings.phone}}</p>
                        <p class="footer__contacts-list-title">почта</p>
                        <p class="footer__contacts-list-value">{{settings.email}}</p>
                    </div>
                </div>
                <div class="footer__header">
                    <h2 class="footer__header-title-requisites">реквизиты компании</h2>
                </div>
                <div class="footer__contacts">
                    <div class="footer__contacts-list-requisites">
                        <p class="footer__contacts-list-requisites-title">Полное наименование</p>
                        <p class="footer__contacts-list-requisites-value">Общество с ограниченной ответственностью "Авеню 17"</p>
                        <p class="footer__contacts-list-requisites-title">ИНН</p>
                        <p class="footer__contacts-list-requisites-value">7726479033</p>
                        <p class="footer__contacts-list-requisites-title">ОГРН</p>
                        <p class="footer__contacts-list-requisites-value">1217700300410</p>
                        <p class="footer__contacts-list-requisites-title">Адрес регистрации</p>
                        <p class="footer__contacts-list-requisites-value">115191 г Москва пер Духовской, 17 / стр 18 этаж 4,5</p>
                        <p class="footer__contacts-list-requisites-title">Расчетный счет</p>
                        <p class="footer__contacts-list-requisites-value">40702810302720005509</p>
                        <p class="footer__contacts-list-requisites-title">банк</p>
                        <p class="footer__contacts-list-requisites-value">АО "АЛЬФА-БАНК"</p>
                        <p class="footer__contacts-list-requisites-title">БИК</p>
                        <p class="footer__contacts-list-requisites-value">044525593</p>
                        <p class="footer__contacts-list-requisites-title">Корреспондентский счет</p>
                        <p class="footer__contacts-list-requisites-value">30101810200000000593</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</template>

<script>
export default {
    name: "Footer",

    data(){
        return {
            settings: []
        }
    },

    methods: {
        getSettings() {
            axios
                .get('/api/get-settings')
                .then((data) => this.settings = data.data)
        }
    },

    beforeMount() {
        this.getSettings()
    }
}
</script>

<style lang="scss" scoped>
    .footer{
        background: #1A1A1A;
        padding: 40px 0;
        margin-top: 40px;

        &__header{
            display: grid;
            grid-template-columns: 260px 1fr;
            margin-bottom: 24px;

            @media (max-width: 991px){
                display: flex;
                justify-content: center;
                align-items: center;
            }

            &-title{
                font-size: 40px;
                font-variation-settings: 'wght' 700;
                color: #fff;
                text-transform: uppercase;
                text-align: left;

                @media (max-width: 991px){
                    font-size: 30px;
                    text-align: center;
                }

                &-requisites{
                    font-size: 24px;
                    margin-top: 30px;
                    font-variation-settings: 'wght' 700;
                    color: #fff;
                    text-transform: uppercase;
                    text-align: left;

                    @media (max-width: 991px){
                        font-size: 30px;
                        text-align: center;
                    }
                }
            }

            &-line{
                width: 100%;
                height: 1px;
                background: #fff;
                align-self: end;

                @media (max-width: 991px){
                    display: none;
                }
            }
        }

        &__contacts{
            position: relative;
            display: flex;
            flex-direction: column-reverse;
            justify-content: center;
            align-items: center;

            &-socials{
                position: absolute;
                top: 0;
                left: 0;
                display: flex;
                justify-content: flex-start;
                align-items: center;

                @media (max-width: 991px){
                    position: relative;
                    justify-content: center;
                    margin-top: 16px;
                }

                &-item{
                    margin-right: 12px;
                    transition: opacity .3s ease;

                    &:hover{
                        opacity: .6;
                    }

                    &:last-child{
                        margin-right: 0;
                    }

                    &-icon{
                        height: 30px;
                        width: 30px;
                    }
                }
            }

            &-list{
                margin-top: 40px;
                display: grid;
                grid-template-columns: 240px 1fr;
                gap: 12px;

                @media (max-width: 991px){
                    grid-template-columns: 120px 1fr;
                    margin-top: 0;
                }

                &-title{
                    color: #fff;
                    font-size: 16px;
                    font-variation-settings: 'wght' 400;
                    text-align: right;
                    text-transform: uppercase;
                    align-self: center;

                    @media (max-width: 991px){
                        font-size: 12px;
                    }
                }

                &-value{
                    align-self: center;
                    color: #fff;
                    font-size: 20px;
                    font-variation-settings: 'wght' 500;
                    text-align: left;
                    text-transform: uppercase;

                    @media (max-width: 991px){
                        font-size: 12px;
                    }
                }

                &-requisites{
                    display: grid;
                    grid-template-columns: 240px 1fr;
                    gap: 12px;

                    @media (max-width: 991px){
                        grid-template-columns: 120px 1fr;
                        margin-top: 0;
                    }

                    &-title{
                        color: #fff;
                        font-size: 14px;
                        font-variation-settings: 'wght' 400;
                        text-align: left;
                        text-transform: uppercase;
                        align-self: center;

                        @media (max-width: 991px){
                            font-size: 12px;
                        }
                    }

                    &-value {
                        align-self: center;
                        color: #fff;
                        font-size: 14px;
                        font-variation-settings: 'wght' 500;
                        text-align: left;
                        text-transform: uppercase;

                        @media (max-width: 991px) {
                            font-size: 12px;
                        }
                    }
                }
            }
        }
    }
</style>
