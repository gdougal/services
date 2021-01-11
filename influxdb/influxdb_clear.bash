#docker-machine restart default
#eval "$(minikube docker-env)"
kubectl delete deployment influx-deploy
docker rmi -f influxdb_image
docker build -t influxdb_image .
kubectl apply -f influxdb.yaml
