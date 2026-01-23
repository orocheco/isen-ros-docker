# Executables (local)
DOCKER_COMP = docker compose
# Docker containers
CONTAINER_NAME = ros_noetic_isen
SERVICE_NAME = ros_noetic_isen
# /workspace dir
WORKSPACE = catkin_ws

# Misc
.DEFAULT_GOAL = help
.PHONY        : help build up start down logs bash sh users

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9\./_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

setup: ## Setup the environment
	mkdir -p $(WORKSPACE)

## —— Docker 🐳 ————————————————————————————————————————————————————————————————
build: ## Builds the Docker images
	@$(DOCKER_COMP) build --pull --no-cache

up: ## Start the docker hub in detached mode (no logs)
	@$(DOCKER_COMP) up --detach

start: build up ## Build and start the containers

down: ## Stop the docker hub
	@$(DOCKER_COMP) down --remove-orphans

logs: ## Show live logs
	@$(DOCKER_COMP) logs --tail=0 --follow

bash: ## Launch a bash shell into the Linux container
	@$(DOCKER_COMP) exec -it $(SERVICE_NAME) /bin/bash
