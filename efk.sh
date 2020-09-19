helm repo add elastic https://helm.elastic.co

helm install elasticsearch elastic/elasticsearch \
--set replicas=1 \
--set resources=null

helm install kibana elastic/kibana \
--set resources=null \
--set 'extraEnvs[0].name=SERVER_BASEPATH,extraEnvs[0].value=/kibana'

#helm install fluentd stable/fluentd --set output.host=elasticsearch-master

helm install fluent-bit stable/fluent-bit \
--set backend.type=es \
--set backend.es.host=elasticsearch-master \
--set metrics.enabled=true

# /elasticsearch/(.*) -> elasticsearch-master:9200
# /kibana/(.*) -> kibana-kibana:5601
kubectl apply -f ingress.yaml
kubectl apply -f ingress.yaml
