## mac nginx

nginx 通过 brew 安装之后目录结构如下：

```shell
/usr/local/Cellar/nginx/1.10.2_1/
/usr/local/etc/nginx/nginx.conf

```
分别是安装目录和配置目录


nginx 命令是安装目录 bin 的软连接。
```
ls -lh  /usr/local/bin/nginx
lrwxr-xr-x  1 zhaoyongqiang  admin    34B Jan 12  2017 /usr/local/bin/nginx -> ../Cellar/nginx/1.10.2_1/bin/nginx

```

启动 nginx 可以直接是 `sudo nginx -c /usr/local/etc/nginx/nginx.conf`，日志如果是默认都在安装目录的 log 目录。

