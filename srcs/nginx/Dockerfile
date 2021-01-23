FROM nginx:alpine

RUN apk add --update openssh

#ADD ssl/nginx.crt /etc/nginx/ssl/nginx.crt
#ADD ssl/nginx.key /etc/nginx/ssl/nginx.key
#ADD ssh/id_rsa /etc/ssh/ssh_host_rsa_key
#ADD ssh/id_rsa.pub /authorized_keys
#ADD ssh/sshd_config /etc/ssh/sshd_config
ADD nginx.conf /etc/nginx/nginx.conf
ADD entrypoint /entrypoint

ENTRYPOINT sh /entrypoint

WORKDIR /bin
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 \
	&& mv mkcert-v1.4.1-linux-amd64 mkcert \
	&& chmod +x mkcert \
	&& mkcert -install \
	&& mkcert localhost

EXPOSE 443 80 30322
