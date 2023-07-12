#!/bin/bash

git clone git@github.com:cta-epfl/downloadservice.git hub_image/downloadservice
git clone git@github.com:cta-epfl/ctadata.git user_image/ctadata

minikube image build -t k8s-hub:0.0.1-dev ./hub_image
minikube image build -t datascience-notebook:0.0.1-dev ./user_image
