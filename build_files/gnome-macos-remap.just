setup-macos-keybindings:
    # Instantiate the service
    systemctl --user daemon-reload
    systemctl --user enable gnome-macos-remap
    systemctl --user start gnome-macos-remap
    # Tweak gsettings
    echo "INFO: Tweaking GNOME and Mutter keybindings..."
    # Ensure default system xkb-options are not turned on - may interfere
    gsettings reset org.gnome.desktop.input-sources xkb-options 
    # Disable overview key ⌘ - interferes with ⌘ + ... combinations
    gsettings set org.gnome.mutter overlay-key ''
    # Minimize one window and all windows - conflicts with show hidden files in Nautilus
    # gsettings set org.gnome.desktop.wm.keybindings minimize "['<Control>h']"
    gsettings set org.gnome.desktop.wm.keybindings minimize "[]"
    # Minimize all windows
    gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Control>d']"
    # Set switch applications to ⌘+TAB, switch application windows ⌘+`
    gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Control>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Control>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Control>grave']"
    gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Control>grave']"
    # ⌘ - Set default change input source shortcuts
    gsettings reset org.gnome.desktop.wm.keybindings switch-input-source
    gsettings reset org.gnome.desktop.wm.keybindings switch-input-source-backward
    # Switch workspaces conflicts with default GNOME window left/right tiling
    gsettings set org.gnome.mutter.keybindings toggle-tiled-left "[]"
    gsettings set org.gnome.mutter.keybindings toggle-tiled-right "[]"
    # Switch workspaces
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Left']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Right']"
    # Paste in terminal (if set via Ctrl+V, not Shift+Ctrl+V) interferes with default GNOME show notification panel shortcut
    gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"
    # Toggle overview (with mac's F3 key)
    gsettings set org.gnome.shell.keybindings toggle-overview "['LaunchA']"
    # Show all applications (with mac's F4 key and imitate spotlight)
    gsettings set org.gnome.shell.keybindings toggle-application-view "['<Primary>space', 'LaunchB']"
    # Setting relocatable schema for Terminal
    if command -v gnome-terminal &> /dev/null ; then
        echo "INFO: Found GNOME Terminal. Applying tweaks..."
        gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy '<Shift><Super>c'
        gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste '<Shift><Super>v'
        gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab '<Shift><Super>t'
        gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-window '<Shift><Super>n'
        gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab '<Shift><Super>w'
        gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-window '<Shift><Super>q'
        gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find '<Shift><Super>f'
    fi
    # Screenshots
    # gsettings set org.gnome.shell.keybindings screenshot "['<Primary><Shift>numbersign']"
    # gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Shift><Control>dollar']"
    # gsettings set org.gnome.shell.keybindings screenshot-window "['<Shift><Control>percent']"
    gsettings set org.gnome.shell.keybindings screenshot "['<Shift><Control>3']"
    gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Shift><Control>4']"
    gsettings set org.gnome.shell.keybindings screenshot-window "['<Shift><Control>5']"
    # Disable screensaver to avoid potential issues
    gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "[]"
