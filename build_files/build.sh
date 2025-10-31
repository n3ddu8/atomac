#!/bin/bash

set -ouex pipefail

dnf -y install \
  chezmoi \
  python-pip

# devpod CLI for ARM
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-arm64" \
  && install -c -m 0755 devpod /usr/local/bin \
  && rm -f devpod

# gnome macos keybindings
wget https://github.com/xremap/xremap/releases/latest/download/xremap-linux-aarch64-gnome.zip \
  && unzip -o ./xremap-linux-aarch64-gnome.zip \
  && cp ./xremap /usr/local/bin \
  && mkdir -p /usr/share/atomac/bin \
  && cp gnome-macos-remap.yml /usr/share/atomac \
  && cp gnome-macos-remap.service /usr/share/atomac \
  && cp -r bin /usr/share/atomac/bin

systemctl enable podman.socket
