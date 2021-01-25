openrc
touch /run/openrc/softlevel
service php-fpm7 start
service nginx start

tail -F /var/log/nginx/access.log
