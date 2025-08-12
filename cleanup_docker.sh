#!/bin/bash

echo "=== Docker Cleanup Script ==="

# Ask before stopping all containers
read -p "Do you really want to STOP all running containers? (y/N): " confirm_stop
if [[ "$confirm_stop" =~ ^[Yy]$ ]]; then
    echo "Stopping all running containers..."
    docker stop $(docker ps -q) 2>/dev/null || echo "No running containers found."
else
    echo "Skipping stop step."
fi

# Ask before removing all containers
read -p "Do you really want to REMOVE all containers? (y/N): " confirm_remove_containers
if [[ "$confirm_remove_containers" =~ ^[Yy]$ ]]; then
    echo "Removing all containers..."
    docker rm $(docker ps -aq) 2>/dev/null || echo "No containers found."
else
    echo "Skipping container removal."
fi

# Ask before removing all images
read -p "Do you really want to REMOVE all Docker images? (y/N): " confirm_remove_images
if [[ "$confirm_remove_images" =~ ^[Yy]$ ]]; then
    echo "Removing all images..."
    docker rmi $(docker images -q) -f 2>/dev/null || echo "No images found."
else
    echo "Skipping image removal."
fi

# Ask before removing all volumes
read -p "Do you really want to REMOVE all Docker volumes? (y/N): " confirm_remove_volumes
if [[ "$confirm_remove_volumes" =~ ^[Yy]$ ]]; then
    echo "Removing all volumes..."
    docker volume rm $(docker volume ls -q) 2>/dev/null || echo "No volumes found."
else
    echo "Skipping volume removal."
fi

echo "=== Cleanup completed ==="
