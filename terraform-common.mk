terraform := $(shell command -v terraform 2> /dev/null)

ifndef terraform
    $(error "terraform is not available please install")
endif

terraform-init:
	$(terraform) init

terraform-validate:
	$(terraform) validate -check-variables=false .

terraform-state-list:
	$(terraform) state list

terraform-plan:
	$(terraform) plan

terraform-destroy:
	$(terraform) destroy

terraform-apply:
	$(terraform) apply

terraform-state-show-arg:
	$(terraform) state show $(ARG)
