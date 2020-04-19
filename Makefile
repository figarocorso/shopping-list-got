PWD=`pwd`

build:
	docker build -t shopping-list-got .

run:
ifndef BOT_TOKEN
	$(error BOT_TOKEN is not set)
endif

ifndef AWS_PROFILE
	$(error AWS_PROFILE is not set)
endif

	docker run -ti -e BOT_TOKEN=$$BOT_TOKEN -e AWS_PROFILE=$$AWS_PROFILE -v ~/.aws:/root/.aws:ro -v $(PWD)/src:/src shopping-list-got

deploy: build run

db:
	docker run -p 8000:8000 amazon/dynamodb-local
