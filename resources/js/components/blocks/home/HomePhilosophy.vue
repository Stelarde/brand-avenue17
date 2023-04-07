<template>
    <div class="banner" id="philosophy" :style="{ backgroundImage: 'url(/storage/settings/' + settings.philosophy + ')' }">
        <preloader v-if="settings.length === 0"></preloader>
        <div class="container" v-else>
            <div class="banner-block">
                <p class="banner-block-text">
                    Бренд ViCOLO (ранее Vicolo Northland) выбирают динамичные уверенные в себе женщины. Отличительная черта каждой коллекции – легкая небрежность, придающая элегантный вид.
                </p>
                <p class="banner-block-text">
                    В течение пятидесяти лет бренд завоевал любовь модниц в разных частях света. Бренд считается одним из лидеров фабрик пронто-мода.
                </p>
                <p class="banner-block-text">
                    VICOLO динамично развивается. Каждый год дизайнеры разрабатывают две новые коллекции, которые обновляются еженедельно.
                </p>
                <p class="banner-block-text">
                    Мы  являемся официальным представителем итальянской марки VICOLO в России.
                </p>
                <p class="banner-block-title">ФИЛОСОФИЯ</p>
            </div>
            <div class="banner-run">
                <img src="/img/VicoloStyle.svg" alt="#VicolosStyle" id="run1" class="banner-run-img">
                <img src="/img/VicoloStyle.svg" alt="#VicolosStyle" id="run2" class="banner-run-img">
                <img src="/img/VicoloStyle.svg" alt="#VicolosStyle" id="run3" class="banner-run-img">
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "HomePhilosophy",

    data(){
        return {
            settings: [],
        }
    },

    methods: {
        getSettings() {
            axios
                .get('/api/get-settings')
                .then((data) => this.settings = data.data)
        },
    },

    beforeMount() {
        this.getSettings()
    }
}
</script>

<style lang="scss" scoped>
.banner{
    position: relative;
    height: 80vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    overflow: hidden;

    &-block{
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        justify-content: center;

        &-text{
            color: #fff;
            font-size: 16px;
            text-align: right;
            font-variation-settings: 'wght' 300;
            margin-bottom: 16px;
            max-width: 500px;

            @media (max-width: 600px){
                font-size: 14px;
            }
        }

        &-title{
            color: #fff;
            font-size: 32px;
            text-align: right;
            font-variation-settings: 'wght' 500;

            @media (max-width: 600px){
                font-size: 24px;
            }
        }
    }

    &-run{
        z-index: 10;
        width: 4000px;
        position: absolute;
        bottom: 0;
        left: 0;
        display: flex;
        animation: run 30s infinite linear;

        &-img{
            width: 1652px;
            height: 57px;
            margin-left: 40px;
            user-select: none;
        }
    }
}

@keyframes run {
    0%{
        transform: translateX(0px);
    }
    100%{
        transform: translateX(-1691px);
    }
}
</style>
