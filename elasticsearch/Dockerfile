#
# ElasticSearch Dockerfile with IK plugin for chinese
#
# https://github.com/ibbd/dockerfile-elk/elasticsearch
#
#

# Pull base image.
FROM ibbd/elasticsearch:base

# 安装插件
# ElasticSearch IK for chinese
# 注意检查版本：https://github.com/medcl/elasticsearch-analysis-ik
# BUG：需要修改/usr/share/elasticsearch/logs目录用户
ENV IK_VERSION 5.4.3
ADD https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v$IK_VERSION/elasticsearch-analysis-ik-$IK_VERSION.zip /tmp/analysis-ik.zip
RUN mkdir -p /usr/share/elasticsearch/plugins/ik \
    && unzip /tmp/analysis-ik.zip -d /usr/share/elasticsearch/plugins/ik \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch \
    && rm /tmp/analysis-ik.zip \
    && cd /usr/share/elasticsearch
