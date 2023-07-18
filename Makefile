install:
	docker-compose run web rails new . --force --database=postgresql
	sudo chown -R $USER:$USER .
	cp ./docker/db/database.yml ./config/
	docker-compose build
init:
	docker-compose up -d
	docker-compose run web rake db:create
migrate:
	docker-compose exec web rails db:migrate
up:
	docker-compose up -d
down:
	docker-compose down
restart:
	docker-compose restart
ssh:
	docker-compose exec web bash
