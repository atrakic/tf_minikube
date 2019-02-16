# TF Minikube

This repository demostrates deploying a simple nginx application with terraform on minikube.

# Usage

First things first:
- install terraform
- install minikube

## Start minikube

```sh
make minikube-start
```


```sh
make docker-build
```

## (Optional) pust container
make docker-tag
make docker-push
```

## Deploy with terraform

```sh
make terraform-init    # get latest k8s tf provider
edit variables.tf      # optionally adjust value with your own image
make terraform-plan    # review what would be deployed on minikube
make terraform-apply   # deploy container with terraform
make terraform-destroy # deploy container with terraform
```

# Help

How to access app, and explain other options, simply just:

```sh
make
```
