#!/bin/bash

echo -e "\e[1;34m===========================================\e[0m"
echo -e "\e[1;34m   Script to create MultiStage Docker Image \e[0m"
echo -e "\e[1;34m===========================================\e[0m"
echo ""
## variables
IMAGE_NAME="webimage"
CONTAINER_NAME="webapp"
PORT_MAPPING="5000:5000"

echo "===================================="
echo " What action do you want to perform?"
echo "===================================="
echo "1) Create Docker Image"
echo "2) Run Container"
echo "3) Tail the container logs"
echo "4) Stop Container"
echo "4) Delete Container"
echo "6) Delete All Images"
echo "===================================="
read -p "Select [1-6]: " choice

case "$choice" in
  1)
    echo "Building Docker image..."
    docker build -t $IMAGE_NAME .
    ;;

  2)
    echo "Running Docker container..."
    docker run -d \
      --name $CONTAINER_NAME \
      -p $PORT_MAPPING \
      $IMAGE_NAME
    ;;

  3)
    echo "Stopping Docker container..."
    docker stop $CONTAINER_NAME
    ;;

  4)
    echo "Deleting all containers, regardless of state..."
    # docker rm -f $CONTAINER_NAME
    docker rm -f $(docker ps -aq)
    ;;

  5)
    echo "Deleting ALL Docker images..."
    docker rmi -f $(docker images -q)
    ;;

  6)
    echo "Tailing the container logs..."
    docker logs --tail 200 -f $CONTAINER_NAME
    ;;

  *)
    echo "Invalid option. Please select between 1 and 6."
    ;;
esac
