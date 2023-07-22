# Makefile for building and running the nobelium Docker container

# Define variables
#NOTION_PAGE_ID=1e20ca1651c84daaaa610c66a0e3a37f # Replace this with your NOTION_PAGE_ID
# IMAGE=haomingkeji-docker.pkg.coding.net/zaixiankaoshi/public/nobelium:latest

# Default rule
all: build push run

# Build the Docker image
build:
	docker build  -t ${IMAGE} --build-arg NOTION_PAGE_ID=${NOTION_PAGE_ID} .

push: build
  docker push ${IMAGE}
# Run the Docker container
run:
	docker run -d --name nobelium -p 3009:80 -e NOTION_PAGE_ID=${NOTION_PAGE_ID} ${IMAGE}

# Clean up Docker containers and images
clean:
	docker stop nobelium || true
	docker rm nobelium || true
	docker rmi ${IMAGE} || true
