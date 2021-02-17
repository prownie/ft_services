FROM alpine:3.12.3

RUN apk add mysql mysql-client openrc

ADD srcs/launch.sh .

RUN sed -i "s|skip-networking|skip-networking=false|" /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

CMD [ "/bin/ash", "launch.sh" ]
