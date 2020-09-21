#!/bin/bash

kubectl apply -f counter.yaml
kubectl logs -f counter

helm repo add elastic https://helm.elastic.co

helm install elasticsearch elastic/elasticsearch \
--set replicas=1 \
--set resources=null

helm install kibana elastic/kibana \
--set resources=null \
--set 'extraEnvs[0].name=SERVER_BASEPATH,extraEnvs[0].value=/kibana'

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm install fluent-bit stable/fluent-bit \
--set backend.type=es \
--set backend.es.host=elasticsearch-master \
--set metrics.enabled=true

#helm install fluentd stable/fluentd --set output.host=elasticsearch-master

# /elasticsearch/(.*) -> elasticsearch-master:9200
# /kibana/(.*) -> kibana-kibana:5601
kubectl apply -f ../basics/ingress.yaml

kubectl port-forward $(kubectl get pod -l app=kibana -o jsonpath='{.items[0].metadata.name}') 5601:5601
open http://localhost:5601/

kubectl port-forward $(kubectl get pod -l app=elasticsearch-master -o jsonpath='{.items[0].metadata.name}') 9200:9200
open http://localhost:9200/
