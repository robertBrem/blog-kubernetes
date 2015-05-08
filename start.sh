#!/bin/bash

docker run --net=host -d kubernetes/etcd:2.0.5.1 /usr/local/bin/etcd --addr=127.0.0.1:4001 --bind-addr=0.0.0.0:4001 --data-dir=/var/etcd/data
docker run --net=host -d -v /var/run/docker.sock:/var/run/docker.sock  gcr.io/google_containers/hyperkube:v0.14.2 /hyperkube kubelet --api_servers=http://localhost:8080 --v=2 --address=0.0.0.0 --enable_server --hostname_override=127.0.0.1 --config=/etc/kubernetes/manifests
docker run -d --net=host --privileged gcr.io/google_containers/hyperkube:v0.14.2 /hyperkube proxy --master=http://127.0.0.1:8080 --v=2

kubectl create -f /home/user/kubernetes-settings/blog-db/blog-db-master-controller.json
kubectl create -f /home/user/kubernetes-settings/blog-db/blog-db-master-service.json

kubectl create -f /home/user/kubernetes-settings/blog-blogservice/blog-blogservice-master-controller.json
kubectl create -f /home/user/kubernetes-settings/blog-blogservice/blog-blogservice-master-service.json

kubectl create -f /home/user/kubernetes-settings/blog-frontend/blog-frontend-controller.json
kubectl create -f /home/user/kubernetes-settings/blog-frontend/blog-frontend-service.json

kubectl create -f /home/user/kubernetes-settings/blog-frontend-admin/blog-frontend-admin-controller.json
kubectl create -f /home/user/kubernetes-settings/blog-frontend-admin/blog-frontend-admin-service.json