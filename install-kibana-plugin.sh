#!/bin/bash
# 

cd /opt/kibana
bin/kibana plugin -i heatmap -u https://github.com/stormpython/heatmap/archive/master.zip
bin/kibana plugin -i tagcloud -u https://github.com/stormpython/tagcloud/archive/master.zip
bin/kibana plugin -i kibi_radar_vis -u  https://github.com/sirensolutions/kibi_radar_vis/archive/0.1.0.zip
bin/kibana plugin -i kibana-html-plugin -u https://github.com/raystorm-place/kibana-html-plugin/archive/master.zip

