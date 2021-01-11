#docker-machine restart default
#eval "$(minikube docker-env)"
kubectl delete deployment mysql
docker rmi -f mysql
docker build -t mysql_image .
kubectl apply -f mysql.yaml
