# https://kubernetes.io/docs/reference/kubectl/cheatsheet/

k8s-get-ep:
	kubectl get ep

k8s-get-all-wide:
	kubectl get all -o wide

k8s-get-all:
	kubectl get all

k8s-get-all-export-yaml:
	kubectl get all --export=true -o yaml

k8s-get-rs:
	kubectl get rs

k8s-get-deployments:
	kubectl get deployments

k8s-get-pods-show-labels:
	kubectl get po

k8s-get-pods:
	kubectl get po --show-labels

k8s-get-services:
	kubectl get services

k8s-get-namespaces:
	kubectl get namespaces

k8s-get-ingress:
	kubectl get ingress

k8s-get-events:
	kubectl get events

k8s-system-status-all:
	kubectl -n kube-system get all

k8s-cluster-info:
	kubectl cluster-info

k8s-current-context:
	kubectl config current-context

k8s-describe-svc:
	kubectl describe svc

k8s-describe-nodes:
	kubectl describe nodes

k8s-describe-all:
	kubectl describe all

k8s-describe-node-minikube:
	kubectl describe node minikube

#kubectl get deployment,rc,rs,ds,no,job -o yaml

###
# CONFIG
###

k8s-config-current-context:
	kubectl-current-context

k8s-config-view:
	kubectl config view
