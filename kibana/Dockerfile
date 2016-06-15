#
# Kibana Dockerfile
#
# https://github.com/ibbd/dockerfile-elk/kibana
#
#

# Pull base image.
FROM kibana:4.5.1

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 安装必要的插件
# 热力图：https://github.com/stormpython/heatmap
# 词云：
# 雷达图：https://github.com/sirensolutions/kibi_radar_vis
    #&& bin/kibana plugin -i kbn_sankey_vis -u https://github.com/chenryn/kbn_sankey_vis/archive/master.zip 
    #&& bin/kibana plugin -i metric-vis-colors -u https://github.com/oxalide/kibana_metric_vis_colors/archive/master.zip \
    #&& bin/kibana plugin -i prelert_swimlane_vis -u https://github.com/prelert/kibana-swimlane-vis/archive/v0.1.0.tar.gz 
RUN \
    cd /opt/kibana \
    && bin/kibana plugin -i heatmap -u https://github.com/stormpython/heatmap/archive/master.zip \
    && bin/kibana plugin -i tagcloud -u https://github.com/stormpython/tagcloud/archive/master.zip \
    && bin/kibana plugin -i kibi_radar_vis -u  https://github.com/sirensolutions/kibi_radar_vis/archive/0.1.0.zip 

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
ENV TERM xterm


EXPOSE 5601
