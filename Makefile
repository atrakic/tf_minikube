SHELL := /bin/bash

.PHONY: help
help:
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

include minikube-common.mk
include kubectl-common.mk
include terraform-common.mk
include docker-common.mk

.PHONY: k8s-deploy
k8s-deploy: ## Deploys this app on k8s with kubectl
	test -d manifests && kubectl create -f ./manifests

.PHONY: k8s-undeploy
k8s-undeploy: ## Undeploys this app from k8s with kubectl
	test -f manifests && kubectl delete -f ./manifests

.PHONY: yamllint
yamllint: ## Lint yaml manifests
	@yamllint -d relaxed .
