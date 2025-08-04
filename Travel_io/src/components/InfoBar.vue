<script setup>
    import { RouterLink } from 'vue-router';
</script>

<template>
    <div class="col-1">
         <p>Indice</p>
         <ul id="indice">
            <li><RouterLink to="/about">Informazioni sul sito</RouterLink></li>
            <li><RouterLink to="/who">Chi siamo?</RouterLink></li>
         </ul>
      </div>
</template>