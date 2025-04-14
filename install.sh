#!/bin/bash

# File to store functions
FUNCTIONS_FILE="$HOME/.my_zsh_functions"

# URL of your GitHub repository raw function file
REPO_URL="https://raw.githubusercontent.com/R-I-S-H-A-B-H-S-I-N-G-H/ubuntu-shortcuts/main/zsh-functions"

# Always download the latest version from GitHub
echo "Downloading latest functions file to $FUNCTIONS_FILE"
curl -sSf -o "$FUNCTIONS_FILE" "$REPO_URL" || {
    echo "Failed to download the functions file from $REPO_URL"
    exit 1
}

# Add sourcing to .zshrc if not already present
if ! grep -q "source $FUNCTIONS_FILE" "$HOME/.zshrc"; then
    echo "Adding source line to .zshrc"
    echo "source $FUNCTIONS_FILE" >> "$HOME/.zshrc"
else
    echo "Source line already exists in .zshrc"
fi

# Reload .zshrc
echo "Reloading .zshrc..."
source "$HOME/.zshrc"

echo "Installation complete. The functions are now available."
