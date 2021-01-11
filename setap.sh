minikube start --vm-driver=virtualbox && \
minikube addons enable dashboard && \
minikube addons enable metallb && \
kubectl apply -f configmap.yaml && \
eval $(minikube docker-env) && \
docker build -t mysql_image mysql/. && \
docker build -t wordpress_image wordpress/. && \
docker build -t php_image phpmyadmin/. && \
docker build -t nginx_image nginx/. && \
docker build -t ftps_image ftps/. && \
docker build -t grafana_image grafana/. && \
docker build -t influx_image influxdb/. && \
kubectl apply -f mysql/mysql.yaml && \
kubectl apply -f wordpress/wordpress.yaml && \
kubectl apply -f phpmyadmin/phpmyadmin.yaml && \
kubectl apply -f nginx/nginx.yaml && \
kubectl apply -f ftps/ftps.yaml && \
kubectl apply -f grafana/grafana.yaml && \
kubectl apply -f influxdb/influxdb.yaml && \
minikube dashboard &