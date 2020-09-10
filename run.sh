#!/bin/bash

kubectl apply -f configmap.yaml
./create-secret.sh
kubectl apply -f deployment.yaml
./check-config.sh
./check-secret.sh

kubectl apply -f service.yaml

brew install helm
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm search repo metabase
helm install metabase stable/metabase

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.35.0/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f ingress.yaml
