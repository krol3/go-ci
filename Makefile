
REPOSITORY ?= krol
VERSION ?= 1.0

IMAGE_NAME ?= go-ci
CONTAINER_NAME ?= test-01
ENV =
CMD =
GIT_COMMIT = $(strip $(shell git rev-parse --short HEAD))

.PHONY: build

build: Dockerfile
	docker build \
	--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VCS_URL=`git config --get remote.origin.url` \
	--build-arg VCS_REF=$(GIT_COMMIT) \
		-t $(REPOSITORY)/$(IMAGE_NAME):$(GIT_COMMIT) -f Dockerfile .

run:
	docker run --rm  --name $(CONTAINER_NAME) -i -t  $(ENV) $(REPOSITORY)/$(IMAGE_NAME):$(GIT_COMMIT)

push:
	@echo "[+] Push image"
	# docker login -u krol
	docker push $(REPOSITORY)/$(IMAGE_NAME):$(GIT_COMMIT)