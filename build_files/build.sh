#!/bin/bash

set -ouex pipefail

dnf -y install \
  chezmoi \
  python-pip

# devpod CLI for ARM
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-arm64" \
  && install -c -m 0755 devpod /usr/local/bin \
  && rm -f devpod

# remap - for adding macos keybindings with just recipe
wget https://github.com/xremap/xremap/releases/latest/download/xremap-linux-aarch64-gnome.zip \
  && unzip -o ./xremap-linux-aarch64-gnome.zip \
  && cp ./xremap /usr/local/bin \

systemctl enable podman.socket
