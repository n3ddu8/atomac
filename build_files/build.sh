#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf -y install evolution

mkdir -p /usr/lib/tmpfiles.d
cat <<EOF > /usr/lib/tmpfiles.d/dnf.conf
d /var/lib/dnf 0755 root root -
d /var/lib/dnf/repos 0755 root root -
EOF

curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-arm64" && install -c -m 0755 devpod /usr/local/bin && rm -f devpod

if [ ! -d /root ]; then
  rm -f /root  # remove file or symlink if it exists
  mkdir -p /root
fi

mkdir -p /usr/lib/sysusers.d
echo 'g nixbld - -' > /usr/lib/sysusers.d/nixbld.conf
for i in $(seq 1 32); do
  echo "u nixbld$i - \"Nix build user\" /nonexistent - nixbld" >> /usr/lib/sysusers.d/nixbld.conf
done

curl -L https://nixos.org/nix/install -o /tmp/nix-install.sh
bash /tmp/nix-install.sh --daemon
rm -f /tmp/nix-install.sh

# . ~/.nix-profile/etc/profile.d/nix.sh

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket

. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
nix-shell -p nix-info --run "nix-info -m"