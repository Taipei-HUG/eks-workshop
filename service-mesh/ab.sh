  
#!/bin/sh

ep=$(kubectl get svc istio-ingressgateway  -n istio-system -o jsonpath="{.status.loadBalancer.ingress[0].hostname}")

watch -n 1 curl -o /dev/null -s -w %{http_code} http://${ep}/$1 