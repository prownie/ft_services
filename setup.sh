#!/bin/sh
minikube start --vm-driver=virtualbox \
        --cpus 3 --disk-size=19080mb --memory=1908mb \
        --extra-config=apiserver.service-node-port-range=1-32767
eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
docker build -t my-nginx ./srcs/nginxtest
docker build -t mysql-image ./srcs/mysql
docker build -t wordpress-image ./srcs/wordpress
#docker build -t my-nginx-phpmyadmin ./srcs/phpmyadmin
kubectl apply -k ./srcs
minikube dashboard
