TAG	:= latest
APP	:= nginx
USER	:= library
IMAGE	:= $(USER)/$(APP)

include minikube-common.mk
include kubectl-common.mk
include terraform-common.mk

yamllint:
	@yamllint -d relaxed .
