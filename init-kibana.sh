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

# 复制插件安装程序到容器内
docker cp install-kibana-plugin.sh ibbd-kibana:/root/

echo 'Over!!'
