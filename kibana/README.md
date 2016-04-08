# ibbd/kibana

基于官方镜像进行构建。

## 问题

### 1. 替换logo

原来的logo是kibana，需要替换为自己的logo。目录：`/opt/kibana/optimize/bundles/src/ui/public/images/`

有两个文件：

- kibana.svg, 这是一个252*45的svg图片
- elk.ico，这是小图标

### 2. 增加http basic auth

see: https://www.ttlsa.com/nginx/nginx-basic-http-authentication/

### 3. 修改页面title

文件：`/opt/kibana/src/ui/views/chrome.jade`

