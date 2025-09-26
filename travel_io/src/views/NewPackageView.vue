<script>
    import * as Api from '@/utils/apis';
    import { useSessionStore } from '@/stores/session';
    export default{
        data(){
            return{
                destination: '',
                price: 1,
                departure: new Date().toISOString().slice(0, 10),
                info: '',
                days: 1,
                maxCharDestination: 25,
                maxPrice: 10000,
                maxCharInfo: 200,
                maxDays: 31,
                priceStyle: {
                    color: 'black'
                },
                daysStyle: {
                    color: 'black'
                }
            }
        },
        methods:{

            checkCharDestination() {
                if(this.destination.length > this.maxCharDestination){
                    this.destination = this.destination.substring(0, this.maxCharDestination);
                }
            },
            checkCharInfo() {
                if(this.info.length > this.maxCharInfo){
                    this.info = this.info.substring(0, this.maxCharInfo);
                }
            },

            checkPrice() {
                if(this.price > this.maxPrice || this.price < 1){
                    this.priceStyle.color = 'red';
                    return true;
                } else {
                    this.priceStyle.color = 'black';
                    return false;
                }
            },

            checkDays() {
                if(this.days > this.maxDays || this.days < 1){
                    this.daysStyle.color = 'red';
                    return true;
                } else {
                    this.daysStyle.color = 'black';
                    return false;
                }
            },
            async addHolidayPackage(){
                const data = await Api.addHolidayPackage(this.destination, this.price, this.departure, this.info, this.days);
                if(data){
                    alert('Holiday Package added correctly');
                    this.$router.push('/holidayPackage');
                } else {
                    alert('error');
                }
            },
            allowButton(){
                return this.destination  === '' || this.checkPrice()  || this.info === '' || this.checkDays();
            },
            checkLogin(){
                if(!useSessionStore().getUser()) this.$router.push('/login');
            }
        },
        mounted(){
            this.allowButton();
            this.checkLogin();
        }
    }
</script>

<template>
    <div>
        
        <form id="formHolidayPackage" action="newHolidayPackage">
            <div id="headerForm">
                <img src="../assets/img/onlylogo.png" alt="logo di travel_io senza scritta" width="50">
                <br>
                <br>
                <h1 style="color: var(--white);">Crea un nuovo pacchetto di viaggio</h1>
            </div>

            <br>

            <label for="destination">Destinazione: </label>
            <input type="text" name="destination" v-model="destination" @input="checkCharDestination()"/> <span class="counter"> {{destination.length}}/{{maxCharDestination}} </span>

            <br>
            <br>

            <label for="price">Costo: </label>
            <input type="number" name="price" min="1" max="10000" v-model="price" :style="priceStyle"><br> <span v-if="checkPrice()">Devi inserire un prezzo compreso tra 1 e 10000 </span>

            <br>
            <br>

            <label for="departure">Data di partenza: </label>
            <input type="date" name="departure" v-model="departure">

            <br>
            <br>

            <label for="info">Info: </label>
            <textarea name="info" v-model="info" @input="checkCharInfo()"></textarea><span class="counter"> {{info.length}}/{{maxCharInfo}} </span>

            <br>
            <br>

            <label for="days">Giorni di soggiorno: </label>
            <input type="number" name="days" min="1" max="31" v-model="days" :style="daysStyle"> <span v-if="checkDays()"> Devi inserire una data compresa tra 1 e 31 </span>


            <br>
            <br>

            <input class="btn-submit" type="submit" value="aggiungi" @click.stop.prevent="addHolidayPackage()" :disabled="allowButton()" >

        </form>

    </div>
</template>

<style>
    #formHolidayPackage{
        background: linear-gradient(180deg, var(--primary) 10%, var(--tertiary));
        color: var(--white);
        border-radius: 25px;
        text-align: center;
        width: fit-content;
        padding: 15px;

        margin: auto;
        margin-bottom: 26px;
        margin-top: 15%;
    }

    

    #headerForm img{
        float: left;
    }
</style>