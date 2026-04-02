<script setup>
import DefaultTheme from 'vitepress/theme'
import GiscusComments from './components/GiscusComments.vue'
</script>

<template>
  <DefaultTheme.Layout>
    <template #doc-after>
      <GiscusComments />
    </template>
  </DefaultTheme.Layout>
</template>

<style>
/* 全局样式已在 custom.css 中定义 */
</style>
