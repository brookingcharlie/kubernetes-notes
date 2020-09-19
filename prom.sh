#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
--set grafana.ingress.enabled=true \
--set grafana.ingress.hosts={kubernetes2.docker.internal}

#kubectl port-forward prometheus-kube-prometheus-stack-prometheus-0 9090:9090
#open http://kubernetes.docker.internal:9090/targets
