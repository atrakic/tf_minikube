minikube-start:
	minikube start

minikube-stop:
	echo minikube stop

minikube-status:
	minikube status

minikube-logs:
	minikube logs

minikube-ip:
	minikube ip

minikube-docker-ps:
	eval $$(minikube docker-env); docker ps $(ARG)
