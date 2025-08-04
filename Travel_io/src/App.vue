<script setup>
  import {RouterView } from 'vue-router'
  import Header from '@/components/Header.vue'
  import Footer from './components/Footer.vue'
  import InfoBar from './components/InfoBar.vue'
  import Ad from '@/components/Ad.vue'
</script>

<template>
  <div id="box">
    <Header></Header>
      <div class="cols">
        <InfoBar></InfoBar>
        <RouterView />
        <Ad></Ad>
      </div>
      <Footer></Footer>
  </div>
</template>

<style>
.cols {
  overflow: hidden;
}
#box{
  margin-left: 30px;
  margin-right: 30px;
}
</style>

