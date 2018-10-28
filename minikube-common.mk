minikube := $(shell command -v minikube 2> /dev/null)

ifndef minikube
    $(error "minikube is not available please install")
endif

minikube-service-list:
	$(minikube) service list

minikube-status:
	$(minikube) status

minikube-start:
	$(minikube) start

minikube-stop:
	echo $(minikube) stop

minikube-logs:
	$(minikube) logs

minikube-ip:
	$(minikube) ip

minikube-docker-ps:
	eval $$(minikube docker-env); docker ps $(ARG)
