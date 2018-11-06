# https://kubernetes.io/docs/reference/kubectl/cheatsheet/

kubectl := $(shell command -v kubectl 2> /dev/null)

ifndef kubectl
    $(error "kubectl is not available please install")
endif

kubectl-get-ep:
	$(kubectl) get ep

kubectl-get-all-wide:
	$(kubectl) get all -o wide

kubectl-get-all:
	$(kubectl) get all

kubectl-get-all-export-yaml:
	$(kubectl) get all --export=true -o yaml

kubectl-get-rs:
	$(kubectl) get rs

kubectl-get-deployments:
	$(kubectl) get deployments

kubectl-get-pods:
	$(kubectl) get po

kubectl-get-pods-show-labels:
	$(kubectl) get po --show-labels

kubectl-get-services:
	$(kubectl) get services

kubectl-get-namespaces:
	$(kubectl) get namespaces

kubectl-get-ingress:
	$(kubectl) get ingress

kubectl-get-events:
	$(kubectl) get events

kubectl-system-status-all:
	$(kubectl) -n kube-system get all

kubectl-cluster-info:
	$(kubectl) cluster-info

kubectl-current-context:
	$(kubectl) config current-context

kubectl-describe-svc:
	$(kubectl) describe svc

kubectl-describe-nodes:
	$(kubectl) describe nodes

kubectl-describe-all:
	$(kubectl) describe all

kubectl-describe-node-minikube:
	$(kubectl) describe node minikube

kubectl-get-deployment-rc-rs-ds-no-job:
	$(kubectl) get deployment,rc,rs,ds,no,job -o yaml

###
# CONFIG
###

kubectl-config-current-context:
	$(kubectl) current-context

kubectl-config-view:
	$(kubectl) config view
