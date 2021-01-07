kubectl delete deploymebt nginx-deployment
kubectl delete svc nginx-svc
docker image rm nginx_image
docker build -t nginx_image .
kubectl apply -f nginx.yaml