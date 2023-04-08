<template>
    <div class="container">
        <div class="return">
            <p class="return-info">
                Мы надеемся, что вы останетесь довольны покупкой, но, если понадобится, заказ можно полностью или частично вернуть в течение 14 дней со дня получения.
            </p>
            <p class="return-info">
                Не пользуйтесь изделием, которое планируете вернуть — оно должно оставаться новым*, сохраните все вшитые ярлыки и этикетки, а также чеки, подтверждающие покупку в нашем магазине.
            </p>
            <p class="return-info">
                Если вы сделали покупку в розничном магазине, оформить возврат можно только в том же магазине.
            </p>
            <p class="return-title">
                ВЕРНУТЬ В РОЗНИЧНЫЙ МАГАЗИН VICOLO
            </p>
            <ol class="return-list">
                <li class="return-list-item">
                    Упакуйте вещи в пакет и коробку и приложите заявление на возврат
                </li>
                <li class="return-list-item">
                    Доставьте коробку в любой магазин VICOLO
                </li>
            </ol>
            <p class="return-title">
                ВЫЗВАТЬ БЕСПЛАТНОГО КУРЬЕРА
            </p>
            <ol class="return-list">
                <li class="return-list-item">
                    В течение 14 дней после получения заказа зайдите в личный кабинет и выберите изделие для возврата. Дождитесь звонка от сотрудника отдела Дружбы с клиентами или свяжитесь с нами  <a class="return-list-item-link" href="#footer">самостоятельно</a>, чтобы договориться о приезде курьера. Курьеры приезжают в будние дни с 10:00 до 18:00
                </li>
                <li class="return-list-item">
                    Упакуйте вещи, которые хотите вернуть, в пакет или фирменную коробку, приложите к изделию заполненное заявление на возврат.
                </li>
                <li class="return-list-item">
                    Чтобы вернуть вещи из нескольких заказов, упакуйте их отдельно и заполните заявления на возврат для каждого заказа
                </li>
                <li class="return-list-item">
                    Если решение о возврате другого заказа вы приняли в последний момент и уже не успеваете заполнить заявление, попросите курьера вписать номер заказа в транспортную накладную
                </li>
            </ol>
            <p class="return-title">
                КАК И КОГДА ВЕРНУТСЯ ДЕНЬГИ
            </p>
            <ol class="return-list">
                <li class="return-list-item">
                    Мы перечислим деньги в течение 10 дней. Отсчет начинается на следующий день после того, как вы вернули изделие в магазин. Если вы вызывали курьера за возвратом, отсчет начинается на следующий день после поступления изделия на наш склад по адресу: 142121, г. Подольск, ул. Станционная, 26, стр. 1.
                </li>
                <li class="return-list-item">
                    Если вы оплачивали заказ при получении, мы переведем деньги по реквизитам в заявлении на возврат. Если вы оплачивали заказ банковской картой на сайте, деньги вернутся на ту же карту. Пожалуйста, учитывайте, что на карту деньги могут поступить позже — срок обработки платежа зависит от вашего банка.
                </li>
                <li class="return-list-item">
                    Если вы хотите получить информацию о статусе вашего возврата, свяжитесь с нами любым удобным <a class="return-list-item-link" href="#footer">способом</a>.
                </li>
            </ol>
            <p class="return-footnote">* Согласно пункту 1 статьи 25 Закона РФ «О защите прав потребителей» от 07.02.1992 № 2300-1</p>
        </div>
    </div>
</template>

<script>
export default {
    name: "ReturnPage"
}
</script>

<style lang="scss" scoped>
    .return{
        &-info{
            font-size: 16px;
            text-align: left;
            font-variation-settings: "wght" 300;
            margin-bottom: 16px;
        }
        &-title{
            text-transform: uppercase;
            font-size: 16px;
            text-align: left;
            font-variation-settings: "wght" 300;
            margin-top: 16px;
            margin-bottom: 16px;
        }
        &-list{
            list-style: disc;
            &-item{
                font-size: 16px;
                text-align: left;
                font-variation-settings: "wght" 300;
                margin-bottom: 16px;
                margin-left: 20px;
                &-link{
                    font-size: 16px;
                    font-variation-settings: "wght" 300;
                    text-decoration: underline;
                    color: #1a1a1a;
                    transition: all 0.3s ease;
                    &:hover{
                        text-decoration: none;
                    }
                }
            }
        }
        &-footnote{
            font-size: 16px;
            text-align: left;
            font-variation-settings: "wght" 300;
            margin-bottom: 16px;
        }
    }
</style>
