include .env.docker
export $(shell sed 's/=.*//' .env.docker)

# Define Docker Compose with a custom environment file
ENV_FILE := --env-file .env.docker
DOCKER_COMPOSE := docker-compose $(ENV_FILE)

setup:
	@make build
	@make up

build:
	docker-compose $(ENV_FILE) build

build-fresh:
	docker-compose $(ENV_FILE) build --no-cache --force-rm

stop:
	docker-compose $(ENV_FILE) stop

down:
	docker-compose $(ENV_FILE) down

up:
	docker-compose $(ENV_FILE) up -d

sh-app:
	docker exec -it $(APP_CONTAINER) bash

sh-db:
	docker exec -it $(DB_CONTAINER) bash

sh-tiktok:
	docker exec -it $(TIKTOK_CONTAINER) bash

logs-app:
	docker logs -f --tail 100 $(TIKTOK_CONTAINER)

logs-db:
	docker logs -f --tail 100 $(DB_CONTAINER)

logs-tiktok:
	docker logs -f --tail 100 $(TIKTOK_CONTAINER)


database-test:
	docker exec -it $(DB_CONTAINER) mysql -u $(DB_USERNAME) -p$(DB_PASSWORD) $(DB_DATABASE)

database-import:
	docker exec $(DB_CONTAINER) bash -c "mysql -u$(DB_USERNAME) -p$(DB_PASSWORD) $(DB_DATABASE) < docker-entrypoint-initdb.d/db/database.sql"

replace-site-url:
	docker exec $(DB_CONTAINER) bash -c "mysql -u$(DB_USERNAME) -p$(DB_PASSWORD) $(DB_DATABASE) < docker-entrypoint-initdb.d/db/replace_site_url.sql"

update-admin-pass:
	docker exec $(DB_CONTAINER) bash -c "mysql -u$(DB_USERNAME) -p$(DB_PASSWORD) $(DB_DATABASE) < docker-entrypoint-initdb.d/db/update-admin-pass.sql"

generate_schema:
	docker exec $(DB_CONTAINER) bash -c "mysql -u$(DB_USERNAME) -p$(DB_PASSWORD) $(DB_DATABASE) < docker-entrypoint-initdb.d/db/generate_schema.sql"

update-db:
	@bash update-db.sh

set-permission:
	docker exec $(APP_CONTAINER) bash -c "chmod -R 777 vendor writable .env index.php"

show-urls:
	@echo "======================"
	@echo "Services URL"
	@echo "======================"
	@echo "App URL: http://localhost:${APP_PORT}"
	@echo "Tiktok URL: http://localhost:${TIKTOK_PORT}"
	@echo "phpMyAdmin URL: http://localhost:${PMA_PORT}"
	@echo "======================"
	@echo "CONTAINER URL"
	@echo "======================"
	@echo "App HOST: ${APP_CONTAINER}:${APP_PORT}"
	@echo "TIKTOK HOST: ${APP_CONTAINER}:${APP_PORT}"
	@echo "MYSQL Host: ${DB_CONTAINER}:${SQL_PORT}"