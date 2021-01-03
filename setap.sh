minikube delete &&
minikube start --vm-driver=virtualbox &&
docker-machine create lol
eval "$(minikube docker-env lol)"
minikube addons enable dashboard &&
minikube addons enable metallb &&
kubectl apply -f configmap.yaml &&
docker build -t nginx_image nginx/. &&
docker build -t mysql mysql/. &&
kubectl apply -f nginx/nginx.yaml &&
kubectl apply -f mysql/mysql.yaml
minikube dashboard

#Удаление пода:
# kubectl delete pods nginx

# kubectl delete svc nginx-svc
#Информация о подах:
# kubectl get pods