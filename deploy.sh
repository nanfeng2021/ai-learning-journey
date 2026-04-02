#!/bin/bash
# 博客自动部署脚本

echo "🔨 开始构建博客..."
cd /root/.openclaw/workspace/blog
npm run build

if [ $? -ne 0 ]; then
    echo "❌ 构建失败！"
    exit 1
fi

echo ""
echo "📦 复制文件到 Nginx 目录..."
sudo cp -r docs/.vitepress/dist/* /var/www/ainanfeng.cn/

echo ""
echo "✅ 部署完成！"
echo ""
echo "🌐 访问地址："
echo "   首页：https://ainanfeng.cn"
echo "   文章：https://ainanfeng.cn/posts/blog-transformation"
echo ""
echo "📊 查看访问日志："
echo "   sudo tail -f /var/log/nginx/ainanfeng.cn.access.log"
