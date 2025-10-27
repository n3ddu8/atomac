#!/bin/bash

set -ouex pipefail

dnf -y install evolution
dnf -y install chezmoi
dnf -y install tmux

curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-arm64" \
  && install -c -m 0755 devpod /usr/local/bin \
  && rm -f devpod

systemctl enable podman.socket
systemctl enable nix.mount

