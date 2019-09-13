#!/usr/bin/env bash

set -x pipefail

# kubectl --namespace nginx-ns get services
IP=$(minikube ip)
NODEPORT=$(kubectl --namespace nginx-ns get -o jsonpath="{.spec.ports[0].nodePort}" services nginx-srv | xargs)
URL=${IP}:${NODEPORT}
curl -LI -s $URL -o /dev/null -w '%{http_code}\n'
