#!/bin/bash

set -euo pipefail

### Constants ###
FUNCTIONS_FILE="$HOME/.my_zsh_functions"
FUNCTIONS_REPO_URL="https://raw.githubusercontent.com/R-I-S-H-A-B-H-S-I-N-G-H/ubuntu-shortcuts/main/zsh-functions"

KAFKA_COMPOSE_DIR="$HOME/docker/kafka"
DOCKER_COMPOSE_FILE="$KAFKA_COMPOSE_DIR/docker-compose.yml"
KAFKA_COMPOSE_URL="https://raw.githubusercontent.com/R-I-S-H-A-B-H-S-I-N-G-H/ubuntu-shortcuts/refs/heads/main/ubuntu-setup/reources/kafka-setup.yml"

ZSHRC_FILE="$HOME/.zshrc"

### Functions ###

log() {
    echo "[INFO] $1"
}

error_exit() {
    echo "[ERROR] $1" >&2
    exit 1
}

require_command() {
    command -v "$1" &>/dev/null || error_exit "'$1' command not found. Please install it first."
}

download_file() {
    local url=$1
    local destination=$2
    curl -fsSL "$url" -o "$destination" || error_exit "Failed to download from $url"
}

ensure_directory() {
    local dir=$1
    mkdir -p "$dir" || error_exit "Failed to create directory: $dir"
}

append_if_missing() {
    local line=$1
    local file=$2
    grep -qxF "$line" "$file" || echo "$line" >> "$file"
}

### Main Script ###

require_command curl

log "Creating Kafka compose directory at $KAFKA_COMPOSE_DIR"
ensure_directory "$KAFKA_COMPOSE_DIR"

log "Downloading Kafka Docker Compose file..."
download_file "$KAFKA_COMPOSE_URL" "$DOCKER_COMPOSE_FILE"

log "Downloading ZSH functions file..."
download_file "$FUNCTIONS_REPO_URL" "$FUNCTIONS_FILE"

log "Ensuring .zshrc sources the functions file..."
append_if_missing "source $FUNCTIONS_FILE" "$ZSHRC_FILE"

log "Reloading .zshrc"
# shellcheck disable=SC1090
source "$ZSHRC_FILE"

log "Installation complete. Functions are now available."
