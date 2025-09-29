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
        <img :src="getUrlImage()" alt="Foto della destinazione" width="300" height="400">
        <div>
            <h1>{{ destination }}</h1>
            <p> {{ info }} <br><br></p>
            <div>
                <div id="holidayDetails">
                    <div>
                        <h3>Durata: </h3><p><b>{{ days }} giorni</b></p><br><br>
                    </div>
                    <div>
                        <h3>Data partenza: &emsp;&emsp;</h3><p><b>{{ departure }}</b></p><br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br>
    
    
    <h3 style="float: right">€{{ price }}</h3>
    
    <br><br><br>

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
        #holidayPackage img{
            border-radius: 25px;
        }
        #holidayDetails{
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

   #holidayDetails {
        border-radius: 25px;
        padding: 15px;
        background-color: rgba(80, 76, 76, 0.125);
        width: auto;
    }

    #holidayDetails h3 {
        float: left;
        margin: 0;
    }

    #holidayDetails :last-child{
        padding-top: 15px;
    }

    #holidayDetails p {
        float: right;
        margin: 0;
    }

</style>