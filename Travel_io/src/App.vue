<script setup>
  import {RouterView } from 'vue-router'
  import Header from '@/components/Header.vue'
  import Footer from './components/Footer.vue'
  import InfoBar from './components/InfoBar.vue'
  import Ad from '@/components/Ad.vue'
</script>

<template>
  <Header></Header>
  <div class="cols">
    <InfoBar></InfoBar>
    <RouterView />
    <Ad></Ad>
  </div>
  <Footer></Footer>
</template>

<style>
.cols {
  overflow: hidden;
}
</style>

