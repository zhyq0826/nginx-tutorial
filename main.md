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


## nginx 的 configure 

nginx 默认启用了一大堆常用的 module，以及默认禁用一大堆不常用的 module，可以根据自己的需要进行配置。

configure 时可以选择合适的路径 `--prefix` 进行安装，默认是 /usr/local/nginx。

推荐安装方式是每一个版本指定一个带版本号的目录，然后把 /usr/local/sbin/nginx 进行软连接，方便升级和回滚。

configure 主要依赖的是 GCC、PCRE、zlib、OpenSSL


## nginx 的启动和关闭

启动 nginx 很简单，`sudo nginx -c nginx.conf` 即可，只要没有任何输出就说明成功启动，如果出错会有对应的错误信息输出。

nginx 的 master 使用 root 启动，这样可以让 nginx 监听低于 1024 的端口号，比如 80 和 443 ，nginx 提供了 `user` directive 来指定 worker 的用户和用户组，如果不指定使用的 nobody。

常用 nginx 命令

```bash
nginx -s stop
nginx -s quit
nginx -s reopen
nginx -s reload

```

任何时候对 nginx 进行重启或退出，nginx 都会检查 configure file 是否是正确的，否则 nginx 将拒绝执行指令。

生成环境建议新建配置目录，使用 nginx -t -c test.conf 检测完毕之后再进行 replace

## nginx module 检测

nginx -V 命令可以检测 nginx 使用的 module 和 prefix

```shell
nginx version: nginx/1.10.2
built by clang 8.0.0 (clang-800.0.42.1)
built with OpenSSL 1.1.0c  10 Nov 2016
TLS SNI support enabled
configure arguments: --prefix=/usr/local/Cellar/nginx/1.10.2_1 --with-http_ssl_module --with-pcre --sbin-path=/usr/local/Cellar/nginx/1.10.2_1/bin/nginx --with-cc-opt='-I/usr/local/opt/pcre/include -I/usr/local/opt/openssl@1.1/include' --with-ld-opt='-L/usr/local/opt/pcre/lib -L/usr/local/opt/openssl@1.1/lib' --conf-path=/usr/local/etc/nginx/nginx.conf --pid-path=/usr/local/var/run/nginx.pid --lock-path=/usr/local/var/run/nginx.lock --http-client-body-temp-path=/usr/local/var/run/nginx/client_body_temp --http-proxy-temp-path=/usr/local/var/run/nginx/proxy_temp --http-fastcgi-temp-path=/usr/local/var/run/nginx/fastcgi_temp --http-uwsgi-temp-path=/usr/local/var/run/nginx/uwsgi_temp --http-scgi-temp-path=/usr/local/var/run/nginx/scgi_temp --http-log-path=/usr/local/var/log/nginx/access.log --error-log-path=/usr/local/var/log/nginx/error.log --with-http_gzip_static_module --with-ipv6
```


## nginx 配置语法

- 所有指令以 `;` 结尾
- 指令可以继承
- module block 可以 nested
- the same block the same directive 不能重复出现，个别 directive 例外

### variable

variable startwith $

### string value 

一般字符串可以直接作为 value，如果有特殊字符使用 " 或 ' ，


### 单位


- ms
- s
- m minutes
- M month
- y
- d
- h
- w
- k | K
- m | M
- g | G


```

client_body_timeout '1m 30s 500ms'
```


### 配置文件分类

- nginx.conf
- mime.types
- fastcgi_params
- proxy.conf
- sites.conf virtual host


### include 

include 指令类似 c 语言的 include，把特定的内容插入到 include 的位置，include 




