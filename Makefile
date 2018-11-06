TAG	:= latest
APP	:= nginx
USER	:= library
IMAGE	:= $(USER)/$(APP)


.PHONY: help
help:
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

include minikube-common.mk
include kubectl-common.mk
include terraform-common.mk

yamllint:
	@yamllint -d relaxed .
