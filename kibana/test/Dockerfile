#
# Kibana Test Dockerfile
#
# https://github.com/ibbd/dockerfile-elk/kibana/test
#
#

# Pull base image.
FROM ibbd/kibana

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN cd /opt/kibana

RUN bin/kibana plugin -i metric-vis-colors -u https://github.com/oxalide/kibana_metric_vis_colors/archive/master.zip





EXPOSE 5601
