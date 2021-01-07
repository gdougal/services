#eval "$(minikube docker-env)"
kubectl delete deployment wp-deployment
kubectl delete svc wp-svc
docker rmi -f wordpress_image
docker build -t wordpress_image .
kubectl apply -f wordpress.yaml