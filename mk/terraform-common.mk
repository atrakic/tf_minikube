terraform := $(shell command -v terraform 2> /dev/null)

ifndef terraform
    $(error "terraform is not available please install")
endif

ifndef tfdir
	tfdir := $(shell pwd)
endif

tf-version: ## Prints the Terraform version
	$(terraform) version

tf-init: ## Initialize a Terraform working directory
	cd $(tfdir) && $(terraform) init

tf-validate: ## Validates the Terraform file
	cd $(tfdir) && $(terraform) validate -check-variables=false .

tf-plan: tf-init ## Generate and show an execution plan
	cd $(tfdir) && $(terraform) plan

tf-destroy: tf-apply ## Destroy Terraform-managed infrastructure
	cd $(tfdir) && $(terraform) destroy

tf-apply: tf-init ## Builds or changes infrastructure
	cd $(tfdir) && $(terraform) apply -auto-approve

tf-output: tf-apply ## Output of Terraform working directory
	cd $(tfdir) && $(terraform) output

tf-refresh: ## Update local state file against real resources
	cd $(tfdir) && $(terraform) refresh

tf-state-list: terraform-apply ## Show current tf states
	cd $(tfdir) && $(terraform) state list

tf-state-show-arg: ## Eg. ARG=kubernetes_pod.pod make terraform-state-show-arg
	cd $(tfdir) && $(terraform) state show $(ARG)

tf-clean: ## Clean up terraform states
	cd $(tfdir) && rm -rf *.tfstate *.tfstate.backup .terraform/* >/dev/null
