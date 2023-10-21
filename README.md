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
