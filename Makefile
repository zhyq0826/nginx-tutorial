access_log:
	tail -f /usr/local/Cellar/nginx/1.10.2_1/logs/access.log
error_log:
	tail -f /usr/local/Cellar/nginx/1.10.2_1/logs/error.log
nginx_01:
	echo $PWD/conf/nginx_01_simple.conf | xargs sudo nginx -c
nginx_02:
	echo $PWD/conf/nginx_02_listen.conf | xargs sudo nginx -c
nginx_03:
	echo $PWD/conf/nginx_03_ssl.conf | xargs sudo nginx -c
stop:
	sudo nginx -s quit
gssh:
	openssl genrsa –out myhost.com.key 2048
	openssl req -new -key myhost.com.key -out myhost.com.csr
