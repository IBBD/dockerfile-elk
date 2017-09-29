#!/bin/bash
# 
# 
# Author: alex
# Created Time: 2017年09月29日 星期五 15时51分53秒
set -e

# remove x-pack
if 
    elasticsearch-plugin list|grep x-pack;
then
    elasticsearch-plugin remove x-pack || true
else
    echo "x-pack is not installed."
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
