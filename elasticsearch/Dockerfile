#
# ElasticSearch Dockerfile with IK plugin for chinese
#
# https://github.com/ibbd/dockerfile-elk/elasticsearch
#
#

# Pull base image.
FROM elasticsearch:2.3

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 安装插件
# ElasticSearch IK for chinese
# 注意检查版本：https://github.com/medcl/elasticsearch-analysis-ik
ENV ELASTICSEARCH_IK_MAJOR 1.9.4
ADD https://github.com/medcl/elasticsearch-analysis-ik/archive/v$ELASTICSEARCH_IK_MAJOR.tar.gz /tmp/elasticsearch-analysis-ik.tar.gz
RUN apt-get update && \
    apt-get install -y --no-install-recommends --force-yes maven openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/* && \
    tar -xvf /tmp/elasticsearch-analysis-ik.tar.gz -C /tmp && \
    cd /tmp/elasticsearch-analysis-ik-$ELASTICSEARCH_IK_MAJOR && \
    mvn package && \
    unzip target/releases/elasticsearch-analysis-ik-$ELASTICSEARCH_IK_MAJOR.zip -d /usr/share/elasticsearch/plugins/ik && \
    cd / && \
    rm -rf /tmp/elasticsearch-analysis-ik*
# 安装  elasticsearch-head 插件
RUN  plugin install mobz/elasticsearch-head

# 安装  elasticsearch-kopf 插件
RUN  plugin install lmenezes/elasticsearch-kopf
# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
ENV TERM xterm


EXPOSE 9200
