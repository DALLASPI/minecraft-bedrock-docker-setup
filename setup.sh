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

# Ensure curl and apt-get are available
if ! command_exists curl; then
    echo "curl is not installed. Please install it and try again."
    exit 1
fi

if ! command_exists apt-get; then
    echo "apt-get is not available. Please ensure you're on a Debian-based system and try again."
    exit 1
fi

# Install Docker
install_docker() {
    if command_exists docker; then
        echo "Docker is already installed."
    else
        echo "Installing Docker..."
        curl -sSL https://get.docker.com -o get-docker.sh
        bash get-docker.sh
        rm get-docker.sh
    fi
}

# Install Docker Compose
install_docker_compose() {
    if command_exists docker-compose; then
        echo "Docker Compose is already installed."
    else
        echo "Installing Docker Compose..."
        apt-get update
        apt-get install -y libffi-dev libssl-dev
        apt-get install -y python3 python3-pip
        pip3 install docker-compose
    fi
}

# Create directory for Minecraft server and navigate to it
setup_minecraft_directory() {
    echo "Setting up Minecraft server directory..."
    local dir="/opt/minecraft-bedrock-server"
    mkdir -p "$dir"
    cd "$dir"
}

# Create docker-compose.yml file
create_docker_compose_file() {
    echo "Creating docker-compose.yml file..."
    cat <<EOL > docker-compose.yml
version: "3"
services:
  minecraft-bedrock-server:
    image: itzg/minecraft-bedrock-server
    ports:
      - "19132:19132/udp"
    volumes:
      - ./data:/data
    environment:
      EULA: "TRUE"
EOL
}

# Start the Minecraft server
start_minecraft_server() {
    echo "Starting Minecraft server..."
    docker-compose up -d
}

# Main script execution
main() {
    install_docker
    install_docker_compose
    setup_minecraft_directory
    create_docker_compose_file
    start_minecraft_server
    echo "Minecraft Bedrock server is now running!"
}

main
