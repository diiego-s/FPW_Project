<script>
     export default{
        props: {
            name: {
                type: String,
                required: true
            },
            surname: {
                type: String,
                required: true
            },
            description :{
                type: String,
                required: true
            },
            photo: {
                type: String,
                required: true
            }
        },
        methods: {
            getUrlImage() {
                return new URL(`../assets/img/${this.photo}`, import.meta.url);
            }
        }
    }
</script>

<template>
    <div id="admincard">
        <img :src="getUrlImage()" alt="Foto dell'admin" width="200">
        <p><b>{{ name }} {{ surname }}</b>: {{ description }}</p>
    </div>
</template>

<style>
    @media only screen and (min-width: 768px){
        #admincard{
            display: flex;
            align-items: center;
            margin: 10px;
        }
        #admincard p{
            margin-left: 15px;
        }
    }

    @media only screen and (max-width: 768px){
        #admincard{
            display: block;
        }
    }    


</style>