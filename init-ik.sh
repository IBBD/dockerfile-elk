#!/bin/bash

# 复制繁体词典
docker cp dict/big_chinese.dic ibbd-elasticsearch:/usr/share/elasticsearch/plugins/ik/config/ik/custom/

if [ ! -d tmp ]; then 
    mkdir tmp
fi

# 修改IK配置
cnf_file=IKAnalyzer.cfg.xml
docker cp ibbd-elasticsearch:/usr/share/elasticsearch/plugins/ik/config/ik/$cnf_file tmp/
if grep big_chinese.dic tmp/$cnf_file;
then
    echo 'big_chinese.dic in '$cnf_file
else
    sed -i 's/<entry key="ext_dict">/<entry key="ext_dict">custom\/big_chinese.dic;/' tmp/$cnf_file
    docker cp tmp/$cnf_file ibbd-elasticsearch:/usr/share/elasticsearch/plugins/ik/config/ik/$cnf_file
fi
echo '===> Over!!'
