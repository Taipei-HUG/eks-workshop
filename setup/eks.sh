#!/bin/bash
cluster_name=workshop${RANDOM}

# Create eks cluster using eksctl
echo "Creating eks cluster and node group with two t3.large instances ..."
sed -i "s/@workshop@/${cluster_name}/" eks.yaml
eksctl create cluster -f eks.yaml

# Setup OIDC ID provider
eksctl utils associate-iam-oidc-provider --name ${cluster_name} --approve

# Test if kubernate cluster works good
kubectl get all

echo 'Done setting EKS.'
