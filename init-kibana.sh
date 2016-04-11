#!/bin/bash
# 

# logo
docker cp kibana/logo/favicon.ico ibbd-kibana:/opt/kibana/optimize/bundles/src/ui/public/images/elk.ico 
docker cp kibana/logo/kibana.svg ibbd-kibana:/opt/kibana/optimize/bundles/src/ui/public/images/kibana.svg

if [ ! -d tmp/ ]; then
    mkdir tmp
fi

# title
docker cp ibbd-kibana:/opt/kibana/src/ui/views/chrome.jade tmp/
sed -i "s/    title Kibana/    title EyeInsight-火眼洞察/" tmp/chrome.jade
docker cp tmp/chrome.jade ibbd-kibana:/opt/kibana/src/ui/views/chrome.jade

# 启动信息
docker cp ibbd-kibana:/opt/kibana/src/ui/views/ui_app.jade tmp/
sed -i "s/      strong Kibana/      strong EyeInsight/" tmp/ui_app.jade
docker cp tmp/ui_app.jade ibbd-kibana:/opt/kibana/src/ui/views/ui_app.jade

# 复制插件安装程序到容器内
docker cp install-kibana-plugin.sh ibbd-kibana:/root/

echo 'Over!!'
