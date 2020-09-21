# Kubernetes notes

## Todo

* Get Prometheus scraping pod metrics (didn't find them)
* Fix path prefix for Grafana, which prevents it being rewritten by ingress
* Find cleaner, automated solution to allowing ingress for helm-installed services (e.g. use their ingress templates, working around need to manually add to localhost's /etc/hosts)

## Prometheus references

* <https://blog.gojekengineering.com/diy-how-to-set-up-prometheus-and-ingress-on-kubernetes-d395248e2ba>
* <https://medium.com/@ystataws/install-prometheus-and-grafana-using-helm-b83b5018a1c4>
