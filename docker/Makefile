IMAGE_NAME   := $(shell basename $(CURDIR))
DOCKER_REPO  := atrakic
TAG   	     := latest

.PHONY: docker-build
docker-build: ## Build the top level Dockerfile using the directory or $IMAGE_NAME as the name.
	@test -f Dockerfile && docker build --force-rm -t $(IMAGE_NAME) .

.PHONY: docker-tag
docker-tag: ## Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
	docker tag $(IMAGE_NAME):$(TAG) $(DOCKER_REPO)/$(IMAGE_NAME) #--no-latest

.PHONY: docker-publish
docker-publish: docker-tag ## Publish the image and tags to a repository.
	docker push $(DOCKER_REPO)/$(IMAGE_NAME)

.PHONY: run-local
run-docker: docker-build ## Run this app locally
	docker run -it -d --rm\
         --name $(IMAGE_NAME) \
         $(DOCKER_REPO)/$(IMAGE_NAME):$(TAG)
