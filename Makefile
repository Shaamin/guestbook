SHELL := /bin/bash

tests:
	symfony console doctrine:fixtures:load -n
	symfony php bin/phpunit
.PHONY: tests

start:
	docker-compose up -d
	symfony server:start -d
	symfony run -d --watch=config,src,templates,vendor symfony console messenger:consume async

stop:
	docker-compose down
	symfony server:stop
