<script setup>
import DefaultTheme from 'vitepress/theme'
import GiscusComments from './components/GiscusComments.vue'
import ReadingProgress from './components/ReadingProgress.vue'
</script>

<template>
  <div class="layout-wrapper">
    <!-- 阅读进度条（固定在顶部） -->
    <ReadingProgress />
    
    <!-- 默认主题布局 -->
    <DefaultTheme.Layout>
      <!-- 文章底部评论区 -->
      <template #doc-after>
        <GiscusComments />
      </template>
    </DefaultTheme.Layout>
  </div>
</template>

<style scoped>
.layout-wrapper {
  position: relative;
}
</style>
