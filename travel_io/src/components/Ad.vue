<script>
 export default{
    methods:{
        randInt(){
            let i = Math.floor(Math.random() * 100)+1;
            return i%2===0;
        }
    }
 }
</script>

<template>
    <div class="col-3">
        <div id="boxAd">
            <img v-if="randInt()" src="../assets/img/ad/ad_en.png" alt="english advertisement">
            <img v-else src="../assets/img/ad/ad_it.png" alt="publicita italiana">
        </div>
      </div>
</template>

<style>

    #boxAd{
        margin-top: 5px;
    }

    #boxAd img{
        width: 100%;
        border-radius: 25px;
    }

    @media only screen and (min-width: 768px){
        #boxAd img{
            height: 682px;
        }
    }

    @media only screen and (max-width: 768px){
        #boxAd img{
            height: 700px;
            
        }
    }
</style>