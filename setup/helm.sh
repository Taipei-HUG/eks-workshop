#!/bin/bash

# Get helm into instance
echo 'Installing helm to this instance and into Kubernetes ...'
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

# Install tiller for helm and set tiller role to cluster-admin
kubectl apply -f helm-sa-rolebinding.yaml

# Initial helm into kubernetes
helm init --service-account tiller --upgrade

echo 'Done helm installation.'
