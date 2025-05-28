#!/bin/bash
set -e  # Exit on error

# Update package list
sudo apt update

# Install required packages
sudo apt install -y curl zsh git docker.io docker-compose

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install SDKMAN!
curl -s "https://get.sdkman.io" | bash

# Add current user to docker group
(sudo groupadd docker)
(sudo usermod -aG docker $USER)
(newgrp docker)


echo "✅ Setup complete. Please log out and back in (or restart terminal) for all changes to take effect."
