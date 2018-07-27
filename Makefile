.PHONY: clean run stop

all: run

KAFKA_HOST := $(shell ifconfig | grep '\<inet\>' | cut -d ' ' -f2 | grep -v '127.0.0.1' | head -1)
export KAFKA_HOST

run:
	@echo "KAFKA_HOST: $(KAFKA_HOST)"
	docker-compose up

stop:
	@echo "KAFKA_HOST: $(KAFKA_HOST)"
	-docker-compose stop kafka1
	-docker-compose stop kafka2
	-docker-compose stop kafka3
	-docker-compose stop zookeeper
