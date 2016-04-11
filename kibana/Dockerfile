#
# Kibana Dockerfile
#
# https://github.com/ibbd/dockerfile-elk/kibana
#
#

# Pull base image.
FROM kibana:4.5.0

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 安装必要的插件
# 热力图，词云，雷达图，html
RUN \
    cd /opt/kibana \
    && bin/kibana plugin -i heatmap -u https://github.com/stormpython/heatmap/archive/master.zip
    && bin/kibana plugin -i tagcloud -u https://github.com/stormpython/tagcloud/archive/master.zip \
    && bin/kibana plugin -i kibi_radar_vis -u  https://github.com/sirensolutions/kibi_radar_vis/archive/0.1.0.zip \
    && bin/kibana plugin -i kibana-html-plugin -u https://github.com/raystorm-place/kibana-html-plugin/archive/master.zip

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
ENV TERM xterm


EXPOSE 5601
