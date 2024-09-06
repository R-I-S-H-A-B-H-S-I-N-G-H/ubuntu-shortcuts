#!/bin/bash

# File to store functions
FUNCTIONS_FILE="$HOME/.my_zsh_functions"

# URL of your GitHub repository raw function file
REPO_URL="https://raw.githubusercontent.com/R-I-S-H-A-B-H-S-I-N-G-H/ubuntu-shortcuts/main/zsh-functions"

# Download function file from GitHub to the user's home directory
if [ ! -f "$FUNCTIONS_FILE" ]; then
    echo "Downloading functions file to $FUNCTIONS_FILE"
    curl -o "$FUNCTIONS_FILE" "$REPO_URL"
else
    echo "Functions file already exists at $FUNCTIONS_FILE"
fi

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
