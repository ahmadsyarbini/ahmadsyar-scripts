#!/usr/bin/env bash
# macOS Trackpad Tweaks – Tested on Catalina
echo "Applying trackpad preferences..."

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable natural scrolling (set to true to enable)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Apply changes immediately
killall cfprefsd

echo "Trackpad settings updated"

# DNS set to adguard
networksetup -setdnsservers "Wi-Fi" 94.140.14.14 94.140.15.15 2a10:50c0::ad1:ff 2a10:50c0::ad2:ff

echo "Dns adguard has been set"

# Reduce Motion & Transparency
defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
# Disable screen locking
defaults write com.apple.loginwindow DisableScreenLock -bool true

# More info on this https://github.com/sickcodes/osx-optimizer

# Make everyone root and sudo, remove password (skarang simpan dulu)

# sudo su
# for PAM_FILE in /etc/pam.d/*; do
    # sed -i -e s/required/optional/g "${PAM_FILE}"
    # sed -i -e s/sufficient/optional/g "${PAM_FILE}"
# done

# do this after

# sudo killall Finder || true sudo killall Dock || true sudo killall mds

defaults write NSGlobalDomain NSWindowResizeTime .001
defaults write com.apple.finder DisableAllAnimations -bool true