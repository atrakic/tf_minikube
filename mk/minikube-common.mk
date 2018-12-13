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

.PHONY: minikube-delete
minikube-delete: minikube-stop ##
	echo $(minikube) delete
	echo rm -rf ~/.minikube ~/.kube

.PHONY: minikube-logs
minikube-logs:
	$(minikube) logs

.PHONY: minikube-ip
minikube-ip: ##
	$(minikube) ip

.PHONY: minikube-addons-enable-ingress
minikube-addons-enable-ingress: ## Enables nginx ingress controller
	$(minikube) addons enable ingress

.PHONY: minikube-docker-env
minikube-docker-env: ## Use minikube docker env
	@eval $$(minikube docker-env)

.PHONY: minikube-docker-ps
minikube-docker-ps: minikube-docker-env ## Usage: ARG="-q -f 'status=exited'" make minikube-docker-ps
	docker ps $(ARG)
