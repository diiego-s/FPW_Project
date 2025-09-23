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

    

    #boxAd img{
        border-radius: 25px;
        margin-bottom: 5px;
        margin-top: 5px;
        width: 90%;
    }

    @media only screen and (min-width: 768px){
        #boxAd img{
            height: 745px;
        }
    }

    @media only screen and (max-width: 768px){
        #boxAd img{
            height: 600px;
            
        }
    }
</style>