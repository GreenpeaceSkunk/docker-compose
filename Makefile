build:
	docker-compose up --build

build-prod:
	docker-compose up --build

up:
	docker-compose up

up-silent:
	docker-compose up -d

up-prod:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

up-prod-silent:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up

down:
	docker-compose down

repos:
	bash repos.sh

update-repos:
	cd ./repos/api && git pull

