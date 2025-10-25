nix:
    # Start a container to export the Nix store
    podman run -d --name nix-export ghcr.io/n3ddu8/atomac tail -f /dev/null

    # Copy the Nix store from the container
    podman cp nix-export:/nix ./nix-copy
    sudo rm -rf /var/nix
    sudo mv ./nix-copy /var/nix
    sudo systemctl restart nix.mount

    # Add environment sourcing to .bashrc if not already present
    grep -qxF '. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ~/.bashrc || \
    echo '. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' >> ~/.bashrc

    echo "Nix environment sourcing added to .bashrc"
