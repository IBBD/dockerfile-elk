# ibbd/kibana

基于官方镜像进行构建。

## 插件

- heatmap：https://github.com/stormpython/heatmap 
- Tag Cloud: https://github.com/stormpython/tagcloud
- Radar: https://github.com/sirensolutions/kibi_radar_vis
- Sankey Diagram: https://github.com/chenryn/kbn_sankey_vis 
- Circles Packing Visualization: https://github.com/JuanCarniglia/kbn_circles_vis
- https://github.com/raystorm-place/kibana-slider-plugin
- https://github.com/raystorm-place/kibana-html-plugin
- https://github.com/minewhat/es-csv-exporter
- https://github.com/stormpython/vectormap
- https://github.com/hmalphettes/kibana-auth-plugin

```sh
cd /opt/kibana
bin/kibana plugin -i heatmap -u https://github.com/stormpython/heatmap/archive/master.zip
bin/kibana plugin -i tagcloud -u https://github.com/stormpython/tagcloud/archive/master.zip
bin/kibana plugin -i kibi_radar_vis -u  https://github.com/sirensolutions/kibi_radar_vis/archive/0.1.0.zip
bin/kibana plugin -i kibana-html-plugin -u https://github.com/raystorm-place/kibana-html-plugin/archive/master.zip
```

## 问题

### 1. 替换logo

原来的logo是kibana，需要替换为自己的logo。目录：`/opt/kibana/optimize/bundles/src/ui/public/images/`

有两个文件：

- kibana.svg, 这是一个252*45的svg图片
- elk.ico，这是小图标

### 2. 增加http basic auth

see: https://www.ttlsa.com/nginx/nginx-basic-http-authentication/

### 3. 修改页面title

文件：`/opt/kibana/src/ui/views/chrome.jade`

### 4. 启动界面信息

文件：`/opt/kibana/src/ui/views/ui_app.jade`


