<script setup>
import DefaultTheme from 'vitepress/theme'
import GiscusComments from './components/GiscusComments.vue'
import ReadingProgress from './components/ReadingProgress.vue'
</script>

<template>
  <DefaultTheme.Layout>
    <!-- 阅读进度条（所有页面） -->
    <ReadingProgress />
    
    <!-- 文章评论区 -->
    <template #doc-after>
      <GiscusComments />
    </template>
  </DefaultTheme.Layout>
</template>

<style>
/* 全局样式已在 custom.css 中定义 */
</style>
