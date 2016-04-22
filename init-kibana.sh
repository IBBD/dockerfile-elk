#!/bin/bash
# 
# 初始化kibana

# logo
docker cp kibana/logo/favicon.ico ibbd-kibana:/opt/kibana/optimize/bundles/src/ui/public/images/elk.ico 
docker cp kibana/logo/kibana.svg ibbd-kibana:/opt/kibana/optimize/bundles/src/ui/public/images/kibana.svg
docker cp kibana/logo/favicon.ico ibbd-kibana:/opt/kibana/src/ui/public/images/elk.ico 
docker cp kibana/logo/kibana.svg ibbd-kibana:/opt/kibana/src/ui/public/images/kibana.svg

if [ ! -d tmp/ ]; then
    mkdir tmp
fi

# 在文件中进行字符串替换
# @param string filename 
# @param string search_str
# @param string replace_str
str_replace() {
    sed -i "s/$2/$3/" "$1"
}

# title
docker cp ibbd-kibana:/opt/kibana/src/ui/views/chrome.jade tmp/
#sed -i "s/    title Kibana/    title EyeInsight-火眼洞察/" tmp/chrome.jade
str_replace "tmp/chrome.jade" "    title Kibana" "    title EyeInsight-火眼洞察"
docker cp tmp/chrome.jade ibbd-kibana:/opt/kibana/src/ui/views/chrome.jade

# 启动信息
docker cp ibbd-kibana:/opt/kibana/src/ui/views/ui_app.jade tmp/
#sed -i "s/      strong Kibana/      strong EyeInsight/" tmp/ui_app.jade
str_replace "tmp/ui_app.jade" "      strong Kibana" "      strong EyeInsight"
docker cp tmp/ui_app.jade ibbd-kibana:/opt/kibana/src/ui/views/ui_app.jade

# 替换导航菜单
docker cp ibbd-kibana:/opt/kibana/src/plugins/kibana/public/kibana.js tmp/
str_replace "tmp/kibana.js" "title: 'Discover'" "title: '搜索'"
str_replace "tmp/kibana.js" "title: 'Visualize'" "title: '可视化'"
str_replace "tmp/kibana.js" "title: 'Dashboard'" "title: '仪表盘'"
str_replace "tmp/kibana.js" "title: 'Settings'" "title: '设置'"
docker cp tmp/kibana.js ibbd-kibana:/opt/kibana/src/plugins/kibana/public/kibana.js
docker cp ibbd-kibana:/opt/kibana/optimize/bundles/kibana.bundle.js tmp/

# 修改导航
str_replace "tmp/kibana.bundle.js" "title: 'Discover'" "title: '搜索'"
str_replace "tmp/kibana.bundle.js" "title: 'Visualize'" "title: '可视化'"
str_replace "tmp/kibana.bundle.js" "title: 'Dashboard'" "title: '仪表盘'"
str_replace "tmp/kibana.bundle.js" "title: 'Settings'" "title: '设置'"

# 翻译
str_replace "tmp/kibana.bundle.js" "Create a new visualization" "创建新的可视化展示形式"
str_replace "tmp/kibana.bundle.js" "Or, open a saved visualization" "打开一个已有的展示形式"

# 修改图表类型
str_replace "tmp/kibana.bundle.js" "title: 'Area chart'" "title: '堆叠区域图'"
str_replace "tmp/kibana.bundle.js" "title: 'Data table'" "title: '数据表'"
str_replace "tmp/kibana.bundle.js" "title: 'Heatmap'" "title: '热力图'"
str_replace "tmp/kibana.bundle.js" "title: 'Html widget'" "title: 'HTML格式'"
str_replace "tmp/kibana.bundle.js" "title: 'Line chart'" "title: '折线图'"
str_replace "tmp/kibana.bundle.js" "title: 'Markdown widget'" "title: 'Markdown格式'"
str_replace "tmp/kibana.bundle.js" "title: 'Metric'" "title: '指标'"
str_replace "tmp/kibana.bundle.js" "title: 'Pie chart'" "title: '饼图'"
str_replace "tmp/kibana.bundle.js" "title: 'Radar chart'" "title: '雷达图'"
str_replace "tmp/kibana.bundle.js" "title: 'Tag cloud'" "title: '词云'"
str_replace "tmp/kibana.bundle.js" "title: 'Tile map'" "title: '地图'"
str_replace "tmp/kibana.bundle.js" "title: 'Vertical bar chart'" "title: '柱形图'"

docker cp tmp/kibana.bundle.js ibbd-kibana:/opt/kibana/optimize/bundles/kibana.bundle.js

# 复制插件安装程序到容器内
docker cp install-kibana-plugin.sh ibbd-kibana:/root/

echo 'Over!!'
