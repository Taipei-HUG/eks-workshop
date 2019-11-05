#!/bin/bash

mkdir ~/bin

echo "Get binaries ..."

curl --silent -Lo kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl ~/bin/
echo 'kubectl Done.'

curl --silent -Lo aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator && chmod +x aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/bin
echo 'aws-iam-authenticator Done.'

curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
echo 'eksctl Done.'

curl --silent --location "https://github.com/txn2/kubefwd/releases/download/v1.9.3/kubefwd_linux_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/kubefwd /usr/bin
echo 'kubefwd Done.'

curl --silent -Lo kubebox https://github.com/astefanutti/kubebox/releases/download/v0.6.1/kubebox-linux && chmod +x kubebox
sudo mv kubebox /usr/local/bin
echo 'kubebox Done.'

curl --silent -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x skaffold
sudo mv skaffold /usr/local/bin
echo 'skaffold Done.'

sudo yum install jq
