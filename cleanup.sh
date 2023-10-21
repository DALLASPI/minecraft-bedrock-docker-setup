#!/bin/bash
set -e

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Function to handle errors
handle_error() {
    echo "Error occurred on line $1: $2"
    exit 1
}

trap 'handle_error $LINENO "${BASH_COMMAND}"' ERR

# Check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Ensure docker and docker-compose are available
if ! command_exists docker; then
    echo "docker is not installed. Please install it and try again."
    exit 1
fi

if ! command_exists docker-compose; then
    echo "docker-compose is not available. Please install it and try again."
    exit 1
fi

# Directory where Minecraft server was set up
MINECRAFT_DIR="/opt/minecraft-bedrock-server"

# Stop and remove the Docker container and network
cleanup_docker_resources() {
    echo "Stopping and removing Minecraft server container..."
    cd "$MINECRAFT_DIR"
    docker-compose down
}

# Option to remove Docker image
remove_docker_image() {
    read -p "Do you want to remove the Minecraft Bedrock server Docker image? (y/N) " choice
    case "$choice" in
        y|Y) 
            echo "Removing Docker image..."
            docker rmi itzg/minecraft-bedrock-server
            ;;
        *)
            echo "Skipping Docker image removal."
            ;;
    esac
}

# Main script execution
main() {
    cleanup_docker_resources
    remove_docker_image
    echo "Cleanup completed!"
}

main
