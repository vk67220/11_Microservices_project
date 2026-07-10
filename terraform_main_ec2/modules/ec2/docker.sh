#!/bin/bash

# -----------------------------
# Update system
# -----------------------------
sudo apt-get update -y

# -----------------------------
# Install dependencies
# -----------------------------
sudo apt-get install -y ca-certificates curl gnupg

# -----------------------------
# Create keyrings directory
# -----------------------------
sudo install -m 0755 -d /etc/apt/keyrings

# -----------------------------
# Add Docker GPG key
# -----------------------------
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

# -----------------------------
# Add Docker repository
# -----------------------------
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# -----------------------------
# Update again
# -----------------------------
sudo apt-get update -y

# -----------------------------
# Install Docker
# -----------------------------
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# -----------------------------
# Start & enable Docker
# -----------------------------
sudo systemctl start docker
sudo systemctl enable docker

# -----------------------------
# Add user to docker group
# -----------------------------
sudo usermod -aG docker $USER

# -----------------------------
# Verify installation
# -----------------------------
docker --version
sudo systemctl status docker --no-pager