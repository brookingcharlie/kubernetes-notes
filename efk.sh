helm repo add elastic https://helm.elastic.co
helm install elasticsearch elastic/elasticsearch --set replicas=1 --set resources=null
kubectl apply -f ingress.yaml # /elasticsearch/(.*) -> elasticsearch-master:9200
helm upgrade kibana elastic/kibana --set resources=null --set 'extraEnvs[0].name=SERVER_BASEPATH,extraEnvs[0].value=/kibana'
kubectl apply -f ingress.yaml # /kibana/(.*) -> kibana-kibana:5601
#helm install fluentd stable/fluentd --set output.host=elasticsearch-master
helm install fluent-bit stable/fluent-bit --set backend.type=es --set backend.es.host=elasticsearch-master
