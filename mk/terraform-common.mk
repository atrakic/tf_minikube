terraform := $(shell command -v terraform 2> /dev/null)

ifndef terraform
    $(error "terraform is not available please install")
endif

ifndef tfdir
	tfdir := $(shell pwd)
endif

terraform-init: ## Initialize a Terraform working directory
	cd $(tfdir) && $(terraform) init

terraform-validate: ## Validates the Terraform file
	cd $(tfdir) && $(terraform) validate -check-variables=false .

terraform-state-list: terraform-apply ## Show current tf states
	cd $(tfdir) && $(terraform) state list

terraform-plan: terraform-init ## Generate and show an execution plan
	cd $(tfdir) && $(terraform) plan

terraform-destroy: terraform-apply ## Destroy Terraform-managed infrastructure
	cd $(tfdir) && $(terraform) destroy

terraform-apply: ## Builds or changes infrastructure
	cd $(tfdir) && $(terraform) apply

terraform-output: terraform-apply ## Output of Terraform working directory
	cd $(tfdir) && $(terraform) output

terraform-refresh: ## Update local state file against real resources
	cd $(tfdir) && $(terraform) refresh

terraform-state-show-arg: ## Eg. ARG=kubernetes_pod.pod make terraform-state-show-arg
	cd $(tfdir) && $(terraform) state show $(ARG)
