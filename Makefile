install:
	docker-compose run web rails new . --force --database=mysql --skip-bundle
	docker-compose run web rm -rf .git
	cp ./docker/web/database.yml ./myapp/config/
	@make build
	docker-compose exec web rails db:create
	@make down
build:
	docker-compose build
	@make upd
migrate:
	docker-compose exec web rails db:migrate
ps:
	docker-compose ps
up:
	docker-compose up
upd:
	docker-compose up -d
down:
	docker-compose down
restart:
	docker-compose restart
ssh:
	docker-compose exec web bash
