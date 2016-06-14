# ibbd/kibana

基于官方镜像进行构建。

## 插件

- [x] heatmap：https://github.com/stormpython/heatmap 
- [x] Tag Cloud: https://github.com/stormpython/tagcloud
- [x] Radar: https://github.com/sirensolutions/kibi_radar_vis
- [ ] HTML: https://github.com/raystorm-place/kibana-html-plugin
- Sankey Diagram: https://github.com/chenryn/kbn_sankey_vis 
- Circles Packing Visualization: https://github.com/JuanCarniglia/kbn_circles_vis
- https://github.com/raystorm-place/kibana-slider-plugin
- https://github.com/minewhat/es-csv-exporter
- https://github.com/stormpython/vectormap
- https://github.com/hmalphettes/kibana-auth-plugin

```sh
cd /opt/kibana
bin/kibana plugin -i heatmap -u https://github.com/stormpython/heatmap/archive/master.zip
bin/kibana plugin -i tagcloud -u https://github.com/stormpython/tagcloud/archive/master.zip
bin/kibana plugin -i kibi_radar_vis -u  https://github.com/sirensolutions/kibi_radar_vis/archive/0.1.0.zip

# 安装有问题
bin/kibana plugin -i kibana-html-plugin -u https://github.com/raystorm-place/kibana-html-plugin/archive/master.zip
```

### Kibana Colored Metric

彩色指标可视化

```sh

cd $KIBANA_HOME/src/plugins
git clone https://github.com/oxalide/kibana_metric_vis_colors.git
zip -r kibana_metric_vis_colors kibana_metric_vis_colors
bin/kibana plugin --install metric-vis-colors -u file:///$KIBANA_HOME/src/plugins/kibana_metric_vis_colors.zip

# 
bin/kibana plugin -i metric-vis-colors -u https://github.com/oxalide/kibana_metric_vis_colors/archive/master.zip
```

### vectormap

该插件有问题！

```sh
bin/kibana plugin -i vectormap -u https://github.com/stormpython/vectormap/archive/master.zip
```

### Sankey Diagram

```sh
git clone https://github.com/chenryn/kbn_sankey_vis.git
cd kbn_sankey_vis
npm install
npm run build
cp -R build/kbn_sankey_vis KIBANA_FOLDER_PATH/installedPlugins/
```

### Health Metric

```sh
bin/kibana plugin -i health_metric_vis -u https://github.com/DeanF/health_metric_vis/archive/master.zip
```

### Sunburst Visualization

```sh
git clone https://github.com/JuanCarniglia/kbn_sunburst_vis.git 
cd kbn_sunburst_vis
npm install
npm run build
cp -R build/kbn_sunburst_vis/ KIBANA_HOME/installedPlugins
```

### Circles Packing Visualization

```sh
git clone https://github.com/JuanCarniglia/kbn_circles_vis.git 
cd kbn_circles_vis
npm install
npm run build
cp -R build/kbn_circles_vis/ KIBANA_HOME/installedPlugins
```

### Timeline

```sh
git clone https://github.com/sirensolutions/kibi_timeline_vis.git
cd kibi_timeline_vis
npm install
npm run build
cp -R build/kibi_timeline_vis KIBANA_FOLDER_PATH/installedPlugins/
```

### BoxPlot Visualization

```sh
git clone https://github.com/JuanCarniglia/kbn_boxplot_violin_vis.git 
cd kbn_boxplot_violin_vis
npm install
npm run build
cp -R build/kbn_boxplot_violin_vis/ KIBANA_HOME/installedPlugins
```

### Swimlane visualization

```sh
bin/kibana plugin -i prelert_swimlane_vis -u https://github.com/prelert/kibana-swimlane-vis/archive/v0.1.0.tar.gz
```

### Slider Plugin Widget

可以用于类似价格区间选取的插件

```sh
bin/kibana plugin -i kibana-slider-plugin -u https://github.com/raystorm-place/kibana-slider-plugin/releases/download/v0.0.2/kibana-slider-plugin-v0.0.2.tar.gz
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


