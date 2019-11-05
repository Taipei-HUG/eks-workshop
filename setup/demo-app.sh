
#!/bin/sh
AccountID=$(aws sts get-caller-identity | jq .Account | tr -d '"')
Registry=${AccountID}.dkr.ecr.us-west-2.amazonaws.com
aws ecr create-repository --repository-name eks-workshop-bookinfo-productpage
aws ecr create-repository --repository-name eks-workshop-bookinfo-ratings
aws ecr create-repository --repository-name eks-workshop-bookinfo-details
skaffold config set default-repo ${Registry}
$(aws ecr get-login --no-include-email)
