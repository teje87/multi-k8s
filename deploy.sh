docker build -t teje87/multi-client -f ./client/Dockerfile ./client
docker build -t teje87/multi-server -f ./server/Dockerfile ./server
docker build -t teje87/multi-worker -f ./worker/Dockerfile ./worker
docker push teje87/multi-client
docker push teje87multi-server
docker push teje87/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=teje87/multi-server