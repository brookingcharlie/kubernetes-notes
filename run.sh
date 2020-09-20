#!/bin/bash

kubectl apply -f configmap.yaml
kubectl create secret generic app-secret --from-literal=password=helloWorld42+
kubectl apply -f deployment.yaml
kubectl exec deploy/web -- bash -c 'echo $APP_NAME'
kubectl exec deploy/web -- bash -c 'echo $PASSWORD'
kubectl exec deploy/web -- bash -c 'cat /etc/config/password'

kubectl apply -f service.yaml

#brew install helm
#helm repo add stable https://kubernetes-charts.storage.googleapis.com
#helm search repo metabase
#helm install metabase stable/metabase

# Installing ingress-nginx (see https://kubernetes.github.io/ingress-nginx/deploy/)
# If on Docker for Mac:
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.35.0/deploy/static/provider/cloud/deploy.yaml
# If on minikube:
minikube addons enable ingress
# Using Helm:
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx

kubectl apply -f ingress.yaml

## to see metrics
#kubectl port-forward -n ingress-nginx $(kubectl get pod -n ingress-nginx -l app.kubernetes.io/component=controller -o jsonpath='{.items[0].metadata.name}') 10254:10254
#curl http://kubernetes.docker.internal:10254/metrics
