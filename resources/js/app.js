/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('header-component', require('./components/Header.vue').default);
Vue.component('header-nav', require('./components/HeaderNav.vue').default);
Vue.component('header-mobile-nav', require('./components/HeaderMobileNav.vue').default);
Vue.component('preloader', require('./components/Preloader.vue').default);
Vue.component('dropdown', require('./components/Dropdown.vue').default);

Vue.component('footer-component', require('./components/Footer.vue').default);

// Pages
Vue.component('home-page', require('./components/pages/HomePage.vue').default);
Vue.component('catalog-page', require('./components/pages/CatalogPage.vue').default);
Vue.component('product-page', require('./components/pages/ProductPage.vue').default);
Vue.component('cart-page', require('./components/pages/CartPage.vue').default);
Vue.component('return-page', require('./components/pages/ReturnPage.vue').default);

// Blocks

Vue.component('home-banner', require('./components/blocks/home/HomeBanner.vue').default);
Vue.component('home-bestsellers', require('./components/blocks/home/HomeBestSellers.vue').default);
Vue.component('home-philosophy', require('./components/blocks/home/HomePhilosophy.vue').default);

Vue.component('new-products', require('./components/blocks/NewProducts.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});
