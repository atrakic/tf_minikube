# TF Minikube

This repository demostrates deploying a simple nginx application with terraform or kubectl on minikube.

# Usage

First things first:
- install kubectl
- install minikube
- install terraform

## Start minikube

```sh
make minikube start
```

## (Optional) build container

```sh
make docker-build
make docker-tag
make docker-push
```

## Deploy with terraform

```sh
make terraform-init    # get latest k8s tf provider
edit variables.tf      # optionally adjust value with your own image on var.container_image
make terraform-plan    # review what would be deployed on minikube
make terraform-apply   # deploy container with terraform
make terraform-destroy # deploy container with terraform
```

## Deploy with kubectl

Place your yaml,json on manifests directory

```sh
make k8s-deploy
make k8s-undeploy    # teardown
```

# Help

How to access app, and explain other options, simply just:

```sh
make
```
