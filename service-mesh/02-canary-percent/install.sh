#!/bin/sh

kubectl delete svc reviews
kubectl apply -R -f .
