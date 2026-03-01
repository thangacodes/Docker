#!/bin/bash

IMAGE1_NAME="durai5050/flask_images:1.0"
IMAGE2_NAME="durai5050/flask_images:2.0"

CONTAINER1="flask_app_v1"
CONTAINER2="flask_app_v2"

check_local_images() {
    echo "Checking locally available docker images..."

    IMAGE1=$(docker images -q $IMAGE1_NAME)
    IMAGE2=$(docker images -q $IMAGE2_NAME)

    if [[ -n "$IMAGE1" && -n "$IMAGE2" ]]; then
        echo "Both images are available locally."
    else
        echo "One or both images are missing."
    fi
}

pull_images(){
        echo "Pulling the public images from my Docker hub.."
        # docker pull commands
        echo "Pulling first image $IMAGE1_NAME.."
        docker pull $IMAGE1_NAME
        echo "Pulling second image $IMAGE2_NAME.."
        docker pull $IMAGE2_NAME
        echo "Cross checking weather the images are pulled or not.."
        docker images
}

create_containers() {
    echo "Creating containers..."

    # Remove existing containers if they exist
    docker rm -f $CONTAINER1 $CONTAINER2 2>/dev/null

    docker run -d -p 9070:5000 --name $CONTAINER1 $IMAGE1_NAME
    docker run -d -p 9080:5000 --name $CONTAINER2 $IMAGE2_NAME

    echo "Containers created successfully."
}

delete_containers() {
    echo "Deleting containers..."
    docker rm -f $CONTAINER1 $CONTAINER2
    echo "Containers deleted."
}

delete_local_images(){
  echo "Deleting locally available images: $IMAGE1_NAME && $IMAGE2_NAME .."
  docker rmi -f $(docker images -qa)
  echo ""
  echo "Cross checking the local images once after deleted.."
  docker images
}

echo "======================================="
echo "Docker Management Script"
echo "======================================="
echo "What do you want to perform?"
echo "1) check_local_images"
echo "2) pull_images"
echo "3) create_containers"
echo "4) delete_containers"
echo "5) delete_local_images"
echo "6) exit"
echo "======================================="

read -p "Enter your choice: " CHOICE

case $CHOICE in
    1)
        check_local_images
        ;;
    2)
        pull_images
        ;;
    3)
        create_containers
        ;;
    4)
        delete_containers
        ;;
    5)
            delete_local_images
        ;;
    6)
        echo "Exiting..."; exit 0
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac