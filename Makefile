.PHONY: up build

up:
	docker compose up -d --build
	open http://localhost:3000

build:
	docker compose build
