
#!/bin/sh

helm repo add istio.io https://storage.googleapis.com/istio-release/releases/1.3.2/charts/

helm upgrade --install istio-init --namespace istio-system istio.io/istio-init --wait

sleep 10;

helm upgrade --install istio --namespace istio-system -f istio-customized.yaml istio.io/istio --wait

kubectl apply -f addon

kubectl label namespace default istio-injection=enabled --overwrite=true
