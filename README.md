# minecraft-bedrock-docker-setup
Automated scripts to set up and manage a Minecraft Bedrock server using Docker. Simple, efficient, and ready for action!
---

**Repository Name:**  
`minecraft-bedrock-docker-setup`

**Repository Description:**  
`Automated scripts to set up and manage a Minecraft Bedrock server using Docker. Simple, efficient, and ready for action!`

---

# 🎮 Minecraft Bedrock Docker Setup

Easily set up and manage a Minecraft Bedrock server using Docker with these scripts.

![Minecraft Logo](https://www.minecraft.net/content/dam/games/minecraft/key-art/Minecraft_key_art_1920x1080.jpg) *(Image Source: Minecraft Official)*

📖 Extended Description
Minecraft, the world-renowned sandbox game, allows players to build, explore, and embark on adventures in pixelated worlds. While the game offers various editions, the Bedrock edition is known for its cross-platform play, allowing players from different devices to play together.

This repository provides a streamlined approach to setting up a Minecraft Bedrock server using Docker. Docker, a platform used to develop, ship, and run applications inside containers, ensures that the server runs in a consistent environment, making the setup process smooth and hassle-free. By containerizing the Minecraft server, we can ensure that it remains isolated from other processes, is easily scalable, and can be effortlessly migrated across different systems.

The provided scripts in this repository are:

setup.sh: This script automates the entire process of setting up the Minecraft Bedrock server. From installing Docker and Docker Compose (if they aren't already installed) to initializing the server, everything is taken care of.

cleanup.sh: After hours of gameplay, if you ever decide to take down the server or wish to perform a clean reset, this script ensures that all Docker-related resources are properly stopped and removed. It also provides an option to remove the Docker image, freeing up space.

Whether you're a Minecraft enthusiast looking to set up your private server or a server admin aiming to provide a platform for players to connect, these scripts make the process straightforward. No more sifting through lengthy documentation or troubleshooting obscure errors. Just run the scripts, and your Minecraft Bedrock server will be up and running in no time!

## 🚀 Getting Started

### Prerequisites

- A Debian-based system (e.g., Ubuntu).
- `curl` installed.
- Root access.

### 📥 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/DALLASPI/minecraft-bedrock-docker-setup.git
   cd minecraft-bedrock-docker-setup
   ```

2. Make the scripts executable:
   ```bash
   chmod +x setup.sh cleanup.sh
   ```

## 🎮 Setting Up the Server

1. Run the setup script as root:
   ```bash
   sudo ./setup.sh
   ```

This script will:

- Check if Docker and Docker Compose are installed, and install them if not.
- Set up a Minecraft Bedrock server in the `/opt/minecraft-bedrock-server` directory.
- Create a `docker-compose.yml` file for the server.
- Start the Minecraft server.

## 🧹 Cleaning Up

1. Run the cleanup script as root:
   ```bash
   sudo ./cleanup.sh
   ```

This script will:

- Stop and remove the Docker container and network.
- Prompt you to optionally remove the Docker image.

## 📝 Notes

- Ensure you have a backup of any important data before running the cleanup script.
- If you choose to remove the Docker image during cleanup, you'll need to re-pull the image the next time you run the setup script.

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## 📜 License

[MIT](https://choosealicense.com/licenses/mit/)
