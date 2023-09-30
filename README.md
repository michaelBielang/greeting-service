# greeting-service

## Build Image

./gradlew clean build

docker build -t greeting-service:0.0.1 .

## Test Imagine

docker run -d -p 8080:8080 greeting-service

localhost:8080/api/v1/greeting

## Setup minikube

docker context use default

minikube start

Check if ingress addon is enabled
minikube addons list

If the Ingress addon is not enabled, enter the following command to enable it:
minikube addons enable ingress

minikube stop

minikube delete

minikube image load greeting-service:0.0.1

minikube image ls

kubectl config set-context --current --namespace=greeting-ns

## To remove any stopped containers and all unused images.

docker system prune -a

## To delete unused images, containers and volumes then run the following command

docker system prune -a -f

# Init services in k8s

kubectl apply -f .\k8s-native\namespace.yml
kubectl apply -f .\k8s-native\deployment.yml
kubectl apply -f .\k8s-native\service.yml

kubectl config set-context --current --namespace=greetings-ns

kubectl expose deployment greeting-deployment --type=LoadBalancer --port=8090

minikube tunnel

localhost:8080/api/greeting

# NodePort variant

kubectl port-forward service/greeting-service 8080:8090

## With Helm

helm install with-helm --namespace hello-world --create-namespace .\with-helm\

helm install with-helm --namespace greeting-ns .\with-helm\

helm install hello-world-prod — namespace hello-world-prod — create-namespace ./helm -f ./helm/values-prod.yaml

## Sources

https://siweheee.medium.com/deploy-your-programs-onto-minikube-with-docker-and-helm-a68097e8d545

