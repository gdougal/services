#eval "$(minikube docker-env)"
kubectl delete deployment php-deployment
kubectl delete svc php-svc
docker rmi -f php_image
docker build -t php_image .
kubectl apply -f phpmyadmin.yaml