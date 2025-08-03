<script setup>
  import {RouterView } from 'vue-router'
  import Header from '@/components/Header.vue'
  import Footer from './components/Footer.vue'
</script>

<template>
  <Header></Header>
  <div class="cols">
    <RouterView />
  </div>
  <Footer></Footer>
</template>

<style>
.cols {
  overflow: hidden;
}
</style>

