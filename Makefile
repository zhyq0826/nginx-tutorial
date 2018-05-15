access_log:
	tail -f /usr/local/Cellar/nginx/1.10.2_1/logs/access.log
error_log:
	tail -f /usr/local/Cellar/nginx/1.10.2_1/logs/error.log
nginx_01:
	echo $PWD/conf/nginx_01.conf | xargs sudo nginx -c
