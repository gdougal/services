#minikube stop ; \
#minikube delete ; \
minikube start --vm-driver=virtualbox && \
minikube addons enable dashboard && \
minikube addons enable metallb && \
kubectl apply -f configmap.yaml && \
eval $(minikube docker-env) && \
docker build -t mysql mysql/. && \
docker build -t wordpress_image wordpress/. && \
docker build -t php_image phpmyadmin/. && \
docker build -t nginx_image nginx/. && \
kubectl apply -f mysql/mysql.yaml && \
kubectl apply -f wordpress/wordpress.yaml && \
kubectl apply -f phpmyadmin/phpmyadmin.yaml && \
kubectl apply -f nginx/nginx.yaml && \
minikube dashboard &

#Удаление пода:
# kubectl delete pods nginx

# kubectl delete svc nginx-svc
#Информация о подах:
# kubectl get pods

#docker-machine create --driver virtualbox default