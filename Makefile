install:
	docker-compose run web rails new . --force --database=mysql --skip-bundle
	docker-compose run web rm -rf .git
	docker-compose build
	cp ./docker/web/database.yml ./myapp/config/
	docker-compose up -d
	docker-compose exec web rails db:create
	@make down
ps:
	docker-compose ps
up:
	docker-compose up -d
down:
	docker-compose down
restart:
	docker-compose restart
ssh:
	docker-compose exec web bash
