#!/usr/bin/env bash
# Exit on error
set -e

# Authenticate sudo early to avoid interruptions
sudo -v

# Keep sudo session alive until script ends
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install office set
brew install microsoft-word
brew install microsoft-excel
brew install microsoft-powerpoint