#!/bin/bash

kubectl apply -f dockercoins.yaml
kubectl port-forward --namespace default dockercoins 8081:80
open http://localhost:8081/swagger-stats/metrics

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack

kubectl port-forward $(kubectl get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090
open http://localhost:9090/targets

kubectl port-forward $(kubectl get pod -l app.kubernetes.io/name=grafana -o jsonpath='{.items[0].metadata.name}') 9091:3000
open http://localhost:9091/
