# TF Minikube
[![CircleCI](https://circleci.com/gh/atrakic/tf_minikube.svg?style=svg)](https://circleci.com/gh/atrakic/tf_minikube)

This repository demostrates deploying a simple nginx application with terraform on minikube.

# Usage
- Install terraform
- Install minikube

# Build sample container
```sh
make docker-build
```

## (Optional) push container
```sh
make docker-tag
make docker-push
```

## Start minikube
```sh
make minikube-start
```

## Deploy with terraform

```sh
make tf-init    # get tf providers
make tf-plan    # review what would be deployed on minikube
make tf-apply   # deploy container with terraform
make tf-destroy # deploy container with terraform
```

# Help
How to access app, and other options, simply just:

```sh
make
```
