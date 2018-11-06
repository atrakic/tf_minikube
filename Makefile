SHELL := /bin/bash
.PHONY: help

help:
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

TAG	:= latest
APP	:= nginx
USER	:= library
IMAGE	:= $(USER)/$(APP)

run-docker: ## runs this app locally
	docker run -it -d --rm\
	   --name $(APP) \
	   $(USER)/$(APP):$(TAG)

include minikube-common.mk
include kubectl-common.mk
include terraform-common.mk
include docker-common.mk

.PHONY: k8s-deploy
k8s-deploy: ## Deploys this app on k8s
	kubectl create -f ./manifests

.PHONY: k8s-undeploy
k8s-undeploy: ## Undeploys this app from k8s
	kubectl delete -f ./manifests

.PHONY: k8s-run-app
k8s-run-app: ## Runs this app on k8s
	minikube service docker-homework-2-svc

.PHONY: yamllint
yamllint: ## Lint yaml manifests
	@yamllint -d relaxed .
