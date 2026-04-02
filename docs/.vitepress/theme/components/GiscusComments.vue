<script setup>
import { onMounted, watch } from 'vue'
import { useRoute } from 'vitepress'

const route = useRoute()

// Giscus 配置
const giscusConfig = {
  src: 'https://giscus.app/client.js',
  'data-repo': 'nanfeng2021/ai-learning-journey',
  'data-repo-id': 'R_kgDORxSaKw',
  'data-category': 'General',
  'data-category-id': 'DIC_kwDORxSaK84C53CU',
  'data-mapping': 'pathname',
  'data-strict': '0',
  'data-reactions-enabled': '1',
  'data-emit-metadata': '0',
  'data-input-position': 'bottom',
  'data-theme': 'preferred_color_scheme',
  'data-lang': 'zh-CN',
  crossorigin: 'anonymous',
  async: true
}

// 加载 Giscus 脚本
const loadGiscus = () => {
  // 移除已存在的脚本和 iframe
  const existingScript = document.querySelector('script[src*="giscus.app"]')
  const existingIframe = document.querySelector('iframe.giscus-frame')
  
  if (existingScript) existingScript.remove()
  if (existingIframe) existingIframe.remove()
  
  // 创建新脚本
  const script = document.createElement('script')
  Object.entries(giscusConfig).forEach(([key, value]) => {
    if (value === true) {
      script.setAttribute(key, '')
    } else {
      script.setAttribute(key, value)
    }
  })
  
  // 添加到页面
  const container = document.getElementById('giscus-container')
  if (container) {
    container.appendChild(script)
  }
}

// 页面挂载时加载
onMounted(() => {
  // 只在文章页面加载
  if (route.path.startsWith('/posts/')) {
    // 等待 DOM 渲染
    setTimeout(loadGiscus, 100)
  }
})

// 路由变化时重新加载
watch(
  () => route.path,
  () => {
    if (route.path.startsWith('/posts/')) {
      setTimeout(loadGiscus, 100)
    }
  }
)
</script>

<template>
  <div v-if="route.path.startsWith('/posts/')" class="giscus-wrapper">
    <div id="giscus-container"></div>
  </div>
</template>

<style scoped>
.giscus-wrapper {
  margin-top: 3rem;
  padding-top: 2rem;
  border-top: 1px solid var(--vp-c-divider);
}

html.dark .giscus-wrapper {
  border-top-color: var(--vp-c-divider-dark);
}
</style>
