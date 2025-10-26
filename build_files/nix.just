echo "Setting SELinux to Permissive for duration of install"
sudo setenforce 0
echo "Installing Multi-user Nix"
curl -L https://nixos.org/nix/install -o /tmp/nix-install.sh
bash /tmp/nix-install.sh --daemon
rm -f /tmp/nix-install.s
echo "Sourcing Nix"
. ~/.nix-profile/etc/profile.d/nix.sh
echo "Setting SELinux to Enforced mode"
sudo setenforce 1
echo "Note, to install anything using nix-env, you will need to set SELinux to Permissive"
echo "Run `sudo setenforce 0`"
echo "You can set SELinux to Enforced once installation has completed"
echo "Run `sudo setenforce 1`"
