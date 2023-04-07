<template>
    <header class="header">
        <div class="container">
            <div class="header-body">
                <div class="header__top">
                    <div class="header__top-social">
                        <a :href="settings.instagram" target="_blank" class="header__top-social-item" v-if="settings.instagram">
                            <img src="/img/icons/instagram.svg" alt="instagram" class="header__top-social-item-icon">
                        </a>
                        <a :href="settings.vk" target="_blank" class="header__top-social-item" v-if="settings.vk">
                            <img src="/img/icons/vk.svg" alt="vk" class="header__top-social-item-icon">
                        </a>
                        <a :href="settings.facebook" target="_blank" class="header__top-social-item" v-if="settings.facebook">
                            <img src="/img/icons/facebook.svg" alt="facebook" class="header__top-social-item-icon">
                        </a>
                        <a :href="settings.telegram" target="_blank" class="header__top-social-item" v-if="settings.telegram">
                            <img src="/img/icons/tg.svg" alt="telegram" class="header__top-social-item-icon">
                        </a>
                    </div>
                    <a href="/" class="header__top-logo">
                        <img src="/img/logo.svg" alt="VICOLO" class="header__top-logo-img">
                    </a>
                    <div class="header__top-contact">
                        <a :href="'tel:'+settings.phone" class="header__top-contact-item">{{settings.phone}}</a>
                        <a :href="'mailto:'+settings.email" class="header__top-contact-item">{{settings.email}}</a>
                    </div>
                </div>
                <header-nav></header-nav>
                <header-mobile-nav></header-mobile-nav>
            </div>
        </div>
    </header>
</template>

<script>
export default {
    name: "Header",

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
    .header{
        padding: 40px 0;
        background: #fff;
        position: relative;

        &__top{
            display: flex;
            justify-content: space-between;
            align-items: center;

            &-social{
                display: flex;
                align-items: center;
                justify-content: flex-start;

                @media (max-width: 992px){
                    display: none;
                }

                &-item{
                    cursor: pointer;
                    opacity: 1;
                    transition: opacity .3s;

                    &:hover{
                        opacity: .6;
                    }

                    &:not(:last-child){
                        margin-right: 13px;
                    }

                    img{
                        width: 30px;
                        height: 30px;
                    }
                }
            }

            &-logo{
                position: absolute;
                left: 50%;
                transform: translateX(-50%);

                &-img{
                    width: 240px;

                    @media (max-width: 992px) {
                        width: 120px;
                    }
                }
            }

            &-contact{
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                justify-items: center;

                @media (max-width: 992px){
                    display: none;
                }

                &-item{
                    font-variation-settings: 'wght' 300;
                    font-size: 20px;
                    color: #000;
                    opacity: 1;
                    transition: opacity .3s;

                    &:hover{
                        opacity: .6;
                    }
                }
            }
        }
    }
</style>
