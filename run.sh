#!/bin/bash

./create-secret.sh
kubectl apply -f configmap.yml
kubectl apply -f deployment.yml
kubectl apply -f service.yml
./check-config.sh
./check-secret.sh
