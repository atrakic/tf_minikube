IMAGE_NAME   := $(shell basename $(CURDIR))
DOCKER_REPO  := atrakic
TAG   	     := latest

ifndef dockerdir
        dockerdir := $(shell pwd)
endif

.PHONY: docker-build
docker-build: ## Build the top level Dockerfile using the directory or $IMAGE_NAME as the name.
	cd $(dockerdir) && test -f Dockerfile && docker build -t $(IMAGE_NAME) .

.PHONY: docker-tag
docker-tag: docker-build ## Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
	cd $(dockerdir) && docker tag $(IMAGE_NAME):$(TAG) $(DOCKER_REPO)/$(IMAGE_NAME) #--no-latest

.PHONY: docker-publish
docker-publish: docker-tag ## Publish the image and tags to a repository.
	@cd $(dockerdir) && docker push $(DOCKER_REPO)/$(IMAGE_NAME)

.PHONY: docker-run
docker-run: docker-build ## Run this app locally
	@docker run \
		-it \
		-d \
		--rm \
         --name $(IMAGE_NAME) \
         $(DOCKER_REPO)/$(IMAGE_NAME):$(TAG)

.PHONY: docker-stop
docker-stop:
	@docker stop $(IMAGE_NAME)

.PHONY: docker-inspect
docker-inspect:
	@docker inspect $(IMAGE_NAME)

.PHONY: docker-logs
docker-logs:
	@docker logs $(IMAGE_NAME)

.PHONY: dockerstop
docker-top:
	@docker top $(IMAGE_NAME)

.PHONY: docker-stats
docker-stats:
	@docker stats $(IMAGE_NAME)
