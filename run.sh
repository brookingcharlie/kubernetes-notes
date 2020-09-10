#!/bin/bash

./create-secret.sh
kubectl apply -f configmap.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.35.0/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f ingress.yaml
./check-config.sh
./check-secret.sh
