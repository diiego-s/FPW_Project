<script setup>
    import { RouterLink } from 'vue-router';
</script>

<template>
    <div id="infobar" class="col-1">
         <p>Indice</p>
         <ul id="indice">
            <li><RouterLink to="/about">Informazioni sul sito</RouterLink></li>
            <li><RouterLink to="/who">Chi siamo?</RouterLink></li>
         </ul>
      </div>
</template>

<style>
    #infobar{
        background-color: var(--primary);
        color: var(--white);
        border-radius: 25px;
        margin-bottom: 5px;
        margin-top: 5px;
        padding-left: 70px;
        padding-right: 70px;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #infobar a{
        color: var(--white);
    }
</style>