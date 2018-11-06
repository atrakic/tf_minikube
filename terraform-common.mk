terraform := $(shell command -v terraform 2> /dev/null)

ifndef terraform
    $(error "terraform is not available please install")
endif

terraform-init: ## Initialize a Terraform working directory
	$(terraform) init

terraform-validate: ## Validates the Terraform file
	$(terraform) validate -check-variables=false .

terraform-state-list:
	$(terraform) state list

terraform-plan: ## Generate and show an execution plan
	$(terraform) plan

terraform-destroy: ## Destroy Terraform-managed infrastructure
	$(terraform) destroy

terraform-apply: ## Builds or changes infrastructure
	$(terraform) apply

terraform-refresh: ## Update local state file against real resources
	$(terraform) refresh

terraform-state-show-arg:
	$(terraform) state show $(ARG)
