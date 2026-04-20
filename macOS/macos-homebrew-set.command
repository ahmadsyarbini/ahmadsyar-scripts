#!/usr/bin/env bash
# Exit on error
# set -e

# Navigate to script's directory (optional, keeps paths tidy)
cd "$(dirname "$0")"

# Authenticate sudo early to avoid interruptions
sudo -v

# Keep sudo session alive until script ends
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Display purpose
echo "Installing Homebrew..."

# Install Homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed, skipping installation."
fi

# Update Homebrew
brew update

# Install formulae only if missing
install_if_missing() {
  if ! brew list --formula | grep -q "^$1$"; then
    echo "Installing $1..."
    brew install "$1" || true
  else
    echo "$1 already installed, skipping."
  fi
}

install_if_missing rustdesk
install_if_missing firefox
install_if_missing rectangle
install_if_missing smcfancontrol
install_if_missing install-disk-creator
install_if_missing keka
install_if_missing omnidisksweeper
install_if_missing sublime-text
echo "Setup complete!"

#setup autoupdate
brew tap domt4/autoupdate
brew autoupdate start --upgrade --cleanup