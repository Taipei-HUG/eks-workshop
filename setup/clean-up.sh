
#!/bin/sh

helm delete istio-init --purge

helm delete istio --purge

# Remove EKS cluster
eksctl delete cluster -f eks.yaml