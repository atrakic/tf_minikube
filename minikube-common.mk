minikube := $(shell command -v minikube 2> /dev/null)

ifndef minikube
    $(error "'minikube' is not available please install")
endif

.PHONY: minikube-service-list
minikube-service-list: ##
	$(minikube) service list

.PHONY: minikube-status
minikube-status: ##
	$(minikube) status

.PHONY: minikube-start
minikube-start: ##
	$(minikube) start

.PHONY: minikube-stop
minikube-stop: ##
	echo $(minikube) stop

.PHONY: minikube-logs
minikube-logs:
	$(minikube) logs

.PHONY: minikube-ip
minikube-ip: ##
	$(minikube) ip

.PHONY: minikube-addons-enable-ingress
minikube-addons-enable-ingress: ## Enables nginx ingress controller
	$(minikube) addons enable ingress

.PHONY: minikube-docker-ps
minikube-docker-ps: ##
	eval $$(minikube docker-env); docker ps $(ARG)
