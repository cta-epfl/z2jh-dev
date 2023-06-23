#!/bin/bash

git clone git@github.com:cta-epfl/downloadservice.git hub_image/downloadservice
git clone git@github.com:cta-epfl/ctadata.git user_image/ctadata

minikube image build -t k8s-hub:latest ./hub_image
minikube image build -t minimal-notebook:latest ./user_image
