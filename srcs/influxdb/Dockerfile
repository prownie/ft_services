FROM alpine:3.12.3

ADD srcs/launch.sh .

RUN apk add openrc influxdb

EXPOSE 8086 8083

CMD [ "/bin/ash", "launch.sh" ]
