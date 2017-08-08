#
# ElasticSearch Dockerfile with IK plugin for chinese
#
# https://github.com/ibbd/dockerfile-elk/elasticsearch
#
#

# Pull base image.
FROM elasticsearch:5.5.1

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 安装插件
# ElasticSearch IK for chinese
# 注意检查版本：https://github.com/medcl/elasticsearch-analysis-ik
ENV IK_VERSION 5.5.1

# install ik
RUN cd /usr/share/elasticsearch \
    && ./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v$IK_VERSION/elasticsearch-analysis-ik-$IK_VERSION.zip

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
ENV TERM xterm


EXPOSE 9200
EXPOSE 9300
