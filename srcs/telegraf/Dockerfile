FROM alpine:3.12.3

RUN	apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf

ADD srcs/launch.sh .
ADD srcs/telegraf.conf /etc/telegraf.conf

EXPOSE 8080

CMD [ "/bin/ash", "launch.sh" ]
