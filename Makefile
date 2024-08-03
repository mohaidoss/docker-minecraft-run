IMAGE_NAME := pixelmon-mc-server
CONTAINER_NAME := pixelmon-server
LOCAL_VOLUME := /root/app/data
JVM_MEMORY_SETTING := 2500M

.PHONY: build
build:
	docker build . -t $(IMAGE_NAME):latest

.PHONY: run
run:
	docker run -d -it -p 25565:25565 --restart unless-stopped -v $(LOCAL_VOLUME):/data -e MEMORY=$(JVM_MEMORY_SETTING) --name $(CONTAINER_NAME) $(IMAGE_NAME)

.PHONY: logs
logs:
	docker logs -n 100 $(CONTAINER_NAME)

.PHONY: bash
bash:
	docker exec -it $(CONTAINER_NAME) bash

.PHONY: rcon
rcon:
	docker exec -it $(CONTAINER_NAME) rcon-cli

