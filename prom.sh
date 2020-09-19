#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
--set grafana.ingress.enabled=true \
--set grafana.ingress.hosts={kubernetes2.docker.internal}

#host above relies on a manual host entry:
#$ grep kubernetes2 /etc/hosts
#127.0.0.1 kubernetes2.docker.internal # manually added by me

#kubectl port-forward $(kubectl get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090
#open http://kubernetes.docker.internal:9090/targets
