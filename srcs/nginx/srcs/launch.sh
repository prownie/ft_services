openrc
touch /run/openrc/softlevel

adduser -D "prownie" && echo "prownie:${SSH_PASSWORD}" | chpasswd
chown -R prownie:prownie /home/prownie
sed -i -e "s/LB_IP/${LB_IP}/g" /etc/nginx/nginx.conf
sed -i -e "s/WPPORT/${WPPORT}/g" /etc/nginx/nginx.conf
chmod 700 .ssh
chmod 644 .ssh/authorized_keys
service nginx start
service sshd start
tail -F /var/log/nginx/access.log
