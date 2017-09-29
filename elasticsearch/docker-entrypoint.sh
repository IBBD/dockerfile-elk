#!/bin/bash
# 
# 
# Author: alex
# Created Time: 2017年09月29日 星期五 15时51分53秒
set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
    set -- elasticsearch "$@"
fi

if [ "$(id -u)" = '0' ]; then
    echo "root is ok"
else
    echo "You must run by root!"
    exit 1
fi

# Change the ownership of user-mutable directories to elasticsearch
for path in \
    /usr/share/elasticsearch/data \
    /usr/share/elasticsearch/logs \
    ; do
    if [ -d "$path" ]; then
        echo "change $path to elasticsearch"
        chown -R elasticsearch:elasticsearch "$path"
    fi
done

# 使用特定的用户运行
set -- gosu elasticsearch "$@"

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
