kubectl delete svc nginx-svc
kubectl delete deployment nginx-deployment
docker image rm -f nginx_image
docker build -t nginx_image .
kubectl apply -f nginx.yaml