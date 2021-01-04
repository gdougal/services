#docker-machine restart default
#eval "$(minikube docker-env)"
kubectl delete deployment mysql
docker rmi mysql
docker build -t mysql .
kubectl apply -f mysql.yaml