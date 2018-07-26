#!/bin/sh
docker_prune() {
	docker system prune --volumes -fa
}

# alias d='docker $*'
# alias d-c='docker-compose $*'
