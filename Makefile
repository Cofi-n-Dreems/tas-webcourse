IMAGE_NAME = tas-webcourse-app
IMAGE_TAG = latest
CONTAINER_NAME = vue-container

pull:
	docker pull node:latest

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	docker run -d -p 5173:5173 --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_TAG)

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

clean: destroy
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

exec:
	docker exec -it $(CONTAINER_NAME) sh