#!/bin/sh
minikube start --vm-driver=virtualbox \
        --cpus 3 --disk-size=19080mb --memory=2300mb \
        --extra-config=apiserver.service-node-port-range=1-32767
eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
docker build -t my-nginx ./srcs/nginx
docker build -t mysql-image ./srcs/mysql
docker build -t wordpress-image ./srcs/wordpress
docker build -t phpmyadmin-image ./srcs/phpmyadmin
docker build -t ftps-image ./srcs/ftps
docker build -t grafana-image ./srcs/grafana
docker build -t influxdb-image ./srcs/influxdb
docker build -t telegraf-image ./srcs/telegraf
kubectl apply -k ./srcs
minikube dashboard
