# ibbd/elasticsearch

## 计划安装插件

- 安全插件
- [x] IK中文分词: https://github.com/medcl/elasticsearch-analysis-ik
- MongoDB数据导入插件: https://github.com/richardwilly98/elasticsearch-river-mongodb/ （支持的es版本有点低）
- CSV数据导入插件: https://github.com/xxBedy/elasticsearch-river-csv （版本支持低）
- Hadoop插件：https://github.com/elasticsearch/elasticsearch-hadoop
- 关系型数据库同步插件：https://github.com/jprante/elasticsearch-river-jdbc

关于安全插件的分析：http://drops.wooyun.org/tips/8129

## IK配置

- ik_max_word 会将文本做最细粒度的拆分，比如会将“中华人民共和国国歌”拆分为“中华人民共和国,中华人民,中华,华人,人民共和国,人民,人,民,共和国,共和,和,国国,国歌”，会穷尽各种可能的组合；
- ik_smart 会做最粗粒度的拆分，比如会将“中华人民共和国国歌”拆分为“中华人民共和国,国歌”。

