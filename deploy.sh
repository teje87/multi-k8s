docker build -t teje87/multi-client:latest -t teje87/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t teje87/multi-server:latest -t teje87/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t teje87/multi-worker:latest -t teje87/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push teje87/multi-client:latest
docker push teje87multi-server:latest
docker push teje87/multi-worker:latest

docker push teje87/multi-client:$SHA
docker push teje87multi-server:$SHA
docker push teje87/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=teje87/multi-server:$SHA
kubectl set image deployments/client-deployment client=teje87/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=teje87/multi-worker:$SHA