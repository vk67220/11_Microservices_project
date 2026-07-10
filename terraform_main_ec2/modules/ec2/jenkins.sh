#!/bin/bash

# -----------------------------
# Update system
# -----------------------------
sudo apt-get update -y

# -----------------------------
# Install Java (required for Jenkins)
# -----------------------------
sudo apt-get install openjdk-17-jre-headless -y

# -----------------------------
# Add Jenkins key and repo
# -----------------------------
sudo mkdir -p /etc/apt/keyrings

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# -----------------------------
# Update again after adding repo
# -----------------------------
sudo apt-get update -y

# -----------------------------
# Install Jenkins
# -----------------------------
sudo apt-get install jenkins -y

# -----------------------------
# Start and enable Jenkins
# -----------------------------
sudo systemctl start jenkins
sudo systemctl enable jenkins

# -----------------------------
# Check status
# -----------------------------
sudo systemctl status jenkins