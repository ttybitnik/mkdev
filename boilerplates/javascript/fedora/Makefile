# MKDEV 0.8.0 (x-release-please-version)
# See <https://github.com/ttybitnik/mkdev> for more information.

PROJECT_NAME = changeme
CONTAINER_ENGINE = changeme

RUN_BIND_SOCKET = false
EXEC_SHELL_CMD = /bin/bash

__USER = $(or $(USER),$(shell whoami))
__SOCKET = /run/user/$(shell id -u)/podman/podman.sock

# Host targets/commands
.PHONY: dev start open stop clean serestore

dev:
	$(info Building development container image...)

	$(CONTAINER_ENGINE) build \
	--build-arg USERNAME=$(__USER) \
	-f .mkdev/Containerfile \
	-t localhost/mkdev/$(PROJECT_NAME) \
	.

start:
	$(info Starting development container...)

	$(CONTAINER_ENGINE) run -it -d --replace \
	$(if $(filter podman,$(CONTAINER_ENGINE)),--userns=keep-id) \
	--name mkdev-$(PROJECT_NAME) \
	--volume .:/home/$(__USER)/workspace:Z \
	$(if $(filter true,$(RUN_BIND_SOCKET)),--volume $(__SOCKET):$(__SOCKET)) \
	$(if $(filter true,$(RUN_BIND_SOCKET)),--env CONTAINER_HOST=unix://$(__SOCKET)) \
	localhost/mkdev/$(PROJECT_NAME):latest

	@# $(CONTAINER_ENGINE) compose .mkdev/compose.yaml up -d

open:
	$(info Opening development container...)

	$(CONTAINER_ENGINE) exec -it mkdev-$(PROJECT_NAME) $(EXEC_SHELL_CMD)

stop:
	$(info Stopping development container...)

	$(CONTAINER_ENGINE) stop mkdev-$(PROJECT_NAME)

	@# $(CONTAINER_ENGINE) compose .mkdev/compose.yaml down

clean: distclean
	$(info Removing development container and image...)

	-$(CONTAINER_ENGINE) rm mkdev-$(PROJECT_NAME)
	-$(CONTAINER_ENGINE) image rm localhost/mkdev/$(PROJECT_NAME)

	@# $(CONTAINER_ENGINE) image prune

serestore:
	$(info Restoring project SELinux context and permissions...)

	chcon -Rv unconfined_u:object_r:user_home_t:s0 .
	# find . -type d -exec chmod 700 {} \;
	# find . -type f -exec chmod 600 {} \;

# Container targets/commands
.PHONY: lint test build run deploy debug distclean

lint:
	$(info Running linters...)

	npx eslint .
	npx prettier --write .
	@# npm run lint
	@# npm run format

test: lint
	$(info Running tests...)

	npx jest
	@# npm run test

build: test
	$(info Building...)

	npx tsc
	@# npm run build

run: build
	$(info Running...)

	node ./dist/main.js

deploy: build
	$(info Deploying...)

debug: test
	$(info Debugging tasks...)

distclean:
	$(info Cleaning artifacts...)

	$(RM) ./dist/*
