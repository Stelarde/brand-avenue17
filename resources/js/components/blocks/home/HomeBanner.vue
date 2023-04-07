<template>
    <div class="banner" :style="{ backgroundImage: 'url(/storage/settings/' + settings.banner + ')' }">
        <preloader v-if="settings.length === 0"></preloader>
        <div class="banner-block" v-else>
            <h2 class="banner-block-title">Новая коллекция</h2>
            <a href="/catalog" class="btn-white banner-block-btn">Перейти в каталог</a>
        </div>
    </div>
</template>

<script>
export default {
    name: "HomeBanner",

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
.banner{
    height: 80vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;

    &-block{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;

        &-title{
            font-size: 40px;
            color: #fff;
            font-variation-settings: 'wght' 700;
            text-transform: uppercase;
            margin-bottom: 40px;
            text-align: center;

            @media (max-width: 600px){
                font-size: 32px;
            }
        }
    }
}
</style>
