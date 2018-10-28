TAG	:= latest
APP	:= nginx
USER	:= library
IMAGE	:= $(USER)/$(APP)

include $(shell git rev-parse --show-toplevel)/k8s-common.mk
include $(shell git rev-parse --show-toplevel)/minikube-common.mk
include $(shell git rev-parse --show-toplevel)/terraform-common.mk

# __DEBUG__:

yamllint:
	@yamllint -d relaxed .
