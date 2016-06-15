#!/bin/bash
# 
# 初始化kibana

# logo
#docker cp kibana/logo/favicon.ico ibbd-kibana:/opt/kibana/optimize/bundles/src/ui/public/images/elk.ico 
#docker cp kibana/logo/kibana.svg ibbd-kibana:/opt/kibana/optimize/bundles/src/ui/public/images/kibana.svg
#docker cp kibana/logo/favicon.ico ibbd-kibana:/opt/kibana/src/ui/public/images/elk.ico 
#docker cp kibana/logo/kibana.svg ibbd-kibana:/opt/kibana/src/ui/public/images/kibana.svg

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
str_replace "tmp/ui_app.jade" "is loading. Give me a moment here. I'm loading a whole bunch of code. Don't worry, all this good stuff will be cached up for next time!" "系统正在加载中，请稍候！如果是第一次启动，可能需要多一点点耐心。"
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
str_replace "tmp/kibana.bundle.js" ">No results found" ">没有找到相关结果"
str_replace "tmp/kibana.bundle.js" "Expand your time range" "注意选择你的时间范围"
str_replace "tmp/kibana.bundle.js" "Refine your query" "重新设置你的查询条件"
str_replace "tmp/kibana.bundle.js" "Examples:" "例如："
str_replace "tmp/kibana.bundle.js" "Find requests that contain the number 200, in any field" "查找包含数字“200”的相关信息，你可以在搜索框里输入"
str_replace "tmp/kibana.bundle.js" "Or we can search in a specific field. Find 200 in the status field" "或者你想某个指定的字段，例如“status”"
str_replace "tmp/kibana.bundle.js" "Find all status codes between 400-499" "查找status字段的值在400到499之间的所有记录"
str_replace "tmp/kibana.bundle.js" "Find status codes 400-499 with the extension php" "查找status值在400与499之间，并且extension值为“php”的所有记录"
str_replace "tmp/kibana.bundle.js" "Or HTML" "或者extension值为“html”"
str_replace "tmp/kibana.bundle.js" "Unfortunately I could not find any results matching your search. I tried really hard. I looked all over the place and frankly, I just couldn't find anything good. Help me, help you. Here are some ideas" "当前的查询没有匹配到任何结果，下面的提示也许能帮到你"
str_replace "tmp/kibana.bundle.js" "I see you are looking at an index with a date field. It is possible your query does not match anything in the current time range, or that there is no data at all in the currently selected time range. Click the button below to open the time picker. For future reference you can open the time picker by clicking the" "可能是因为在你设置的时间段内，没有满足你的查询条件的数据，或者在这段时间按内根本没有数据。你可以点击屏幕右上角的这个小按钮来重设时间段："
str_replace "tmp/kibana.bundle.js" "in the top right corner of your screen." ""
str_replace "tmp/kibana.bundle.js" "The search bar at the top uses Elasticsearch's support for Lucene" "头部的搜索框支持Lucene"
str_replace "tmp/kibana.bundle.js" "Query String syntax" "查询语法"
str_replace "tmp/kibana.bundle.js" "Let's say we're searching web server logs that have been parsed into a few fields." "下面是几个简单的例子："
str_replace "tmp/kibana.bundle.js" "Ready to get started" "准备开始建立仪表盘了吗"
str_replace "tmp/kibana.bundle.js" "Selected Fields" "已选择字段"
str_replace "tmp/kibana.bundle.js" "Available Fields" "可选择字段"
str_replace "tmp/kibana.bundle.js" ">Popular<" ">字段列表<"
str_replace "tmp/kibana.bundle.js" "Select a search source" "选择一个数据源"
str_replace "tmp/kibana.bundle.js" "From a new search" "选择已有索引作为数据源"
str_replace "tmp/kibana.bundle.js" "From a saved search" "选择保存好的搜索结果作为数据源"
str_replace "tmp/kibana.bundle.js" "Select an index pattern" "从下拉框选择一个索引"
#str_replace "tmp/kibana.bundle.js" "This field is present in your elasticsearch mapping but not in any documents in the search results. You may still be able to visualize or search on it." "这个字段只会在mapping的配置文件中，而不会出现在搜索结果上。不过你依然可以看到它或者搜索它。"

# 修改图表类型
str_replace "tmp/kibana.bundle.js" "title: 'Area chart'" "title: '堆叠区域图'"
str_replace "tmp/kibana.bundle.js" "title: 'Data table'" "title: '数据表'"
str_replace "tmp/kibana.bundle.js" "title: 'Heatmap'" "title: '热力图'"
#str_replace "tmp/kibana.bundle.js" "title: 'Html widget'" "title: 'HTML格式'"
str_replace "tmp/kibana.bundle.js" "title: 'Line chart'" "title: '折线图'"
str_replace "tmp/kibana.bundle.js" "title: 'Markdown widget'" "title: 'Markdown格式'"
str_replace "tmp/kibana.bundle.js" "title: 'Metric'" "title: '指标'"
str_replace "tmp/kibana.bundle.js" "title: 'Metric with Colors'" "title: '彩色指标'"
str_replace "tmp/kibana.bundle.js" "title: 'Pie chart'" "title: '饼图'"
str_replace "tmp/kibana.bundle.js" "title: 'Radar chart'" "title: '雷达图'"
str_replace "tmp/kibana.bundle.js" "title: 'Tag cloud'" "title: '词云'"
str_replace "tmp/kibana.bundle.js" "title: 'Tile map'" "title: '地图'"
str_replace "tmp/kibana.bundle.js" "title: 'Vertical bar chart'" "title: '柱形图'"
str_replace "tmp/kibana.bundle.js" "<h1>Kibana<\/h1>" "<h1>EyeInsight<\/h1>"
str_replace "tmp/kibana.bundle.js" "2015 All Rights Reserved - Elasticsearch" "2016 All Rights Reserved"

docker cp tmp/kibana.bundle.js ibbd-kibana:/opt/kibana/optimize/bundles/kibana.bundle.js

# 复制插件安装程序到容器内
docker cp install-kibana-plugin.sh ibbd-kibana:/root/

echo 'Over!!'
