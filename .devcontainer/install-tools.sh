#!/bin/bash
#
# install-tools.sh - System Package & Bootstrap Initializer
#
# DESCRIPTION:
#   Installs core Linux utilities required for the lab environment
#   and performs the initial "bootstrap" permissions fix required 
#   to execute the remaining setup scripts.
#
# USAGE:
#   ./.devcontainer/install-tools.sh
#
# ----------------------------------------------------------------------

# Exit immediately if a command exits with a non-zero status
set -e 

echo "--- 🛠️  Starting Post-Create Tool Installation ---"

#######################################
# Installs system-level dependencies via APT.
#######################################
install_packages() {
    echo "📦 Updating package lists and installing utilities..."
    sudo apt-get update
    sudo apt-get install -y \
        git \
        vim \
        tree \
        htop \
        net-tools \
        dnsutils \
        build-essential \
        bc
}

#######################################
# Sets the initial execution bits for the bootstrap scripts.
#######################################
bootstrap_permissions() {
    echo "🔑 Bootstrapping script permissions..."
    
    # We explicitly authorize the core setup scripts so the 
    # postAttachCommand can run them successfully.
    chmod +x ./bin/repo.sh
    chmod +x ./.devcontainer/setup-env.sh
}

# --- Execution ---

install_packages
bootstrap_permissions

echo "--- ✅ Tool Installation Complete ---"
