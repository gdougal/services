kubectl delete deployment mysql
kubectl delete pods mysql-7cc7f9884d-b7shc
docker image rm mysql
docker build -t mysql .
kubectl apply -f mysql.yaml