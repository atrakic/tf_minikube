#!/usr/bin/env bash

set -xeo pipefail

IP=$(minikube ip)
NODEPORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services flask-app-api | xargs)
URL=$IP:$NODEPORT/get
curl -LI -s $URL -o /dev/null -w '%{http_code}\n'
