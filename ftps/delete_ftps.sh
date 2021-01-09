#eval "$(minikube docker-env)"
kubectl delete deployment ftps-deployment
kubectl delete svc ftps-svc
docker rmi -f ftps_image
docker build -t ftps_image .
kubectl apply -f ftps.yaml