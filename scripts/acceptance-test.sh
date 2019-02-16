#!/usr/bin/env bash

set -xeo pipefail

kubectl --namespace nginx-ns get services

exit 0

IP=$(minikube ip)
NODEPORT=$(kubectl --namespace nginx-ns get -o jsonpath="{.spec.ports[0].nodePort}" services nginx-srv | xargs)
URL=$IP:$NODEPORT/get
curl -LI -s $URL -o /dev/null -w '%{http_code}\n'
