#!/bin/sh

aws ecr delete-repository --repository-name eks-workshop-bookinfo-productpage --force
aws ecr delete-repository --repository-name eks-workshop-bookinfo-ratings --force
aws ecr delete-repository --repository-name eks-workshop-bookinfo-details --force

kubectl delete svc --all
kubectl delete deploy --all

sleep 15 

helm delete istio-init --purge

sleep 15

helm delete istio --purge

del=1
# Remove EKS cluster
while [ $del -ne 0 ] ;
do
sleep 5 
echo 'try to delete eks'
eksctl delete cluster -f eks.yaml ; 
del=$?
done
echo 'Clean up Done. Please do not forget check at console.'
