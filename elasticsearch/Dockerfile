#
# ElasticSearch Dockerfile with IK plugin for chinese
#
# https://github.com/ibbd/dockerfile-elk/elasticsearch
#
#

# Pull base image.
FROM elasticsearch:2.3.1

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 安装插件
# ElasticSearch IK for chinese
ENV ELASTICSEARCH_IK_MAJOR 1.9.1
RUN apt-get update && \
    apt-get install -y --no-install-recommends --force-yes maven openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*
ADD https://github.com/medcl/elasticsearch-analysis-ik/archive/v$ELASTICSEARCH_IK_MAJOR.tar.gz /tmp/elasticsearch-analysis-ik.tar.gz
RUN tar -xvf /tmp/elasticsearch-analysis-ik.tar.gz -C /tmp && \
    cd /tmp/elasticsearch-analysis-ik-$ELASTICSEARCH_IK_MAJOR && \
    vn package && \
    unzip target/releases/elasticsearch-analysis-ik-$ELASTICSEARCH_IK_MAJOR.zip -d /usr/share/elasticsearch/plugins/ik && \
    cd / && \
    rm -rf /tmp/elasticsearch-analysis-ik*

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
ENV TERM xterm


EXPOSE 9200
