<script>
    import * as Api from '@/utils/apis';
    export default{
        data(){
            return{
                destination: '',
                price: 1,
                departure: new Date().toISOString().slice(0, 10),
                info: '',
                days: 1,
            }
        },
        methods:{
            async addHolidayPackage(){
                const data = await Api.addHolidayPackage(this.destination, this.price, this.departure, this.info, this.days);
                if(data){
                    alert('Holiday Package added correctly');
                    this.$router.push('/holidayPackage');
                } else {
                    alert('error');
                }
            }
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
            <input type="text" name="destination" v-model="destination"/>

            <br>
            <br>

            <label for="price">Costo: </label>
            <input type="number" name="price" min="1" max="10000" v-model="price">

            <br>
            <br>

            <label for="departure">Data di partenza: </label>
            <input type="date" name="departure" v-model="departure">

            <br>
            <br>

            <label for="info">Info: </label>
            <textarea name="info" v-model="info"></textarea>

            <br>
            <br>

            <label for="days">Giorni di soggiorno: </label>
            <input type="number" name="days" min="1" max="31" v-model="days">

            <br>
            <br>

            <input type="submit" value="aggiungi" @click.stop.prevent="addHolidayPackage()">

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

    #formHolidayPackage input[type="submit"] {
        background: rgba(255, 255, 255, 0.489);
        color: var(--white);
        font-weight: bold;
        cursor: pointer;

        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-top: 20px;
        width: 68%;
    }

    #formHolidayPackage input[type="submit"]:hover {
        background: rgba(255, 255, 255, 0.343);
        color: var(--white);
    }

    #headerForm img{
        float: left;
    }
</style>