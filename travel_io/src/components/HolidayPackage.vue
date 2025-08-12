<script>
     export default{
        props: {
            destination: {
                type: String,
                required: true
            },
            price: {
                type: Number,
                required: true
            },
            departure :{
                type: String,
                required: true
            },
            info :{
                type: String,
                required: true,
            },
            days: {
                type: Number,
                required: true
            },
            photo :{
                type: String,
                required: true,
            },
        },
        methods: {
            getUrlImage() {
                return new URL(`../assets/img/city/${this.photo}`, import.meta.url);
            }
        }
    }
</script>

<template>

    <br>
    <div id="holidayPackage">
        <img :src="getUrlImage()" alt="Foto della destinazione" width="500">
        <div>
            <h1>{{ destination }}</h1>
            <p> {{ info }} <br><br>Durata: <b>{{ days }} giorni</b><br>Data partenza: <b>{{ departure }}</b><br><b>€{{ price }}</b></p>
        </div>
    </div>

    <br>

    <hr>

</template>

<style>
    @media only screen and (min-width: 768px){
        #holidayPackage{
            display: flex;
            align-items: center;
            margin: 10px;
        }
        #holidayPackage p, #holidayPackage h1{
            margin-left: 15px;
        }
    }

    @media only screen and (max-width: 768px){
        #holidayPackage{
            display: block;
        }

        #holidayPackage img{
            width: 100%;
        }
    }    

    #holidayPackage img{
        border-radius: 25px;
    }


</style>