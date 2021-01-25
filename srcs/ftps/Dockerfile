FROM alpine:3.12.3

RUN	apk add openrc vsftpd openssl

ADD	srcs/. .

RUN mv vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key.pem -out /etc/ssl/private/vsftpd.cert.pem

EXPOSE 21 20

CMD		[ "/bin/ash", "/launch.sh" ]
