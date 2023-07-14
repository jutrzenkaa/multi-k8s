# docker build -t jasiek129908/multi-client:latest -t jasiek129908/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jasiek129908/multi-client:latest -t jasiek129908/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jasiek129908/multi-server:latest -t jasiek129908/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jasiek129908/multi-worker:latest -t jasiek129908/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jasiek129908/multi-client:latest
docker push jasiek129908/multi-server:latest
docker push jasiek129908/multi-worker:latest

docker push jasiek129908/multi-client:$SHA
docker push jasiek129908/multi-server:$SHA
docker push jasiek129908/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jasiek129908/multi-server:$SHA
kubectl set image deployments/client-deployment client=jasiek129908/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jasiek129908/multi-worker:$SHA
