.PHONY: tests

####
# docker commands
####
docker_build:
	# build the docker container used to run tests and build package
	docker compose -f docker-compose.yml build

docker_run: docker_build
	# run the docker container
	docker compose -f docker-compose.yml up

docker_down:
	docker compose down --remove-orphans

docker_rebuild:
	# rebuild docker container
	docker compose -f docker-compose.yml build --no-cache

docker_zsh:
	# run container and open up zsh command-line
	docker exec -it python-helpers-bash-1 /bin/zsh


####
# Project
####
linting:
	flake8 --max-line-length 99 .

main:
	python main.py
