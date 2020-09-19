#!/bin/bash

kubectl apply -f dockercoins.yaml
kubectl port-forward --namespace default dockercoins 8081:80
open http://localhost:8081/swagger-stats/metrics
