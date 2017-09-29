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

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
    set -- gosu elasticsearch "$@"
    #exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
