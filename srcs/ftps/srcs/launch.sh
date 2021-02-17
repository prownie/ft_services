openrc
touch /run/openrc/softlevel
adduser -D "user42" && echo "user42:${FTPS_PASSWORD}" | chpasswd
chown -R user42:user42 /home/user42
touch /var/log/vsftpd.log

echo "user42" | tee -a /etc/vsftpd.userlist
mkdir /var/run/vsftpd
mkdir /var/run/vsftpd/empty
sed -i "s|skip-networking|skip-networking=false|" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|LB_IP|${LB_IP}|" /etc/vsftpd/vsftpd.conf
service vsftpd restart
tail -f /var/log/vsftpd.log
