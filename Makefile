USER = core
HOST = dev.sandbox.local
TAG  = nyarla

OPTS = --user $(USER) --host $(HOST) --tagprefix $(TAG)

SUPERVISOR = upstart

all: build deploy

build:
	docker-deploy --build --sudo $(OPTS)

deploy:
	docker-deploy --deploy --sudo --supervisor $(SUPERVISOR) $(OPTS)
