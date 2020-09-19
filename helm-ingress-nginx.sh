helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# failed due to old version of kubernetes
helm install ingress-nginx ingress-nginx/ingress-nginx

# looking around instead
helm fetch --untar ingress-nginx/ingress-nginx
vim ingress-nginx/values.yaml
