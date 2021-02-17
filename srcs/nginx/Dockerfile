FROM    alpine:3.12.3

RUN     apk add nginx openrc openssl openssh
RUN		openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
ADD srcs/nginx.conf /etc/nginx/nginx.conf
ADD srcs/launch.sh /launch.sh
ADD	srcs/index.html /www/index.html
ADD srcs/livenessprobe.sh	/
EXPOSE  80 443 30322
CMD             [ "/bin/ash", "/launch.sh" ]
