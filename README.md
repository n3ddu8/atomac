# :atom_symbol: Atomac: Atomic Linux, Mac Host, Maximum Sass
A light remix of [Project Bluefin LTS](https://projectbluefin.io/) for running inside a VM on my Apple Mac. Why? Because I’m a maximalist minimalist with opinions. Also because macOS makes me sigh audibly at least twice a day.
## :warning: ARM64 ONLY
If you're rocking x86_64, this ain't it. Go home.
### :thinking: Why Does This Exist?
Because I live in the Apple ecosystem like a well-dressed prisoner. My M4 Mac Mini is a power-sipping marvel that plays nice with my AirPods, iPhone, and the occasional Teams call that doesn’t lag like it’s buffering from 2006. But macOS? It’s like a beautiful house with no furniture. I want my Linux desktop. I want my dotfiles. I want my soul back.

### :toolbox: Customisations
There isn't really that much customisation, the friendly folks at Bluefin have thought of most things already, I just need:
- Chezmoi, because `chezmoi init --apply n3ddu8` should be the only onboarding step I ever need.
- DevPod CLI, because DevPod GUI doesn’t support ARM and I’m allergic to buttons.
- Pip, because sometimes I just want to `pip install pandas` and vibe with a CSV.

### :computer: Installation Ritual
This setup has only been tested on UTM using Apple Virtualization. If you try it on VMware or Parallels, may the kernel gods be with you.
1. 	Download the Bluefin LTS for ARM ISO. No, I’m not producing my own ISO. Yet.
2. 	Launch UTM. Create a new VM.
3. 	Choose Apple Virtualization (because Rosetta is for apps, not dreams).
4. 	Browse to the ISO like it’s 2005.
5. 	Give the VM at least 4GB RAM and 64GB disk. I use 12GB RAM and 120GB disk on my base-model M4 Mac Mini and still have room for Teams, ProtonMail, and existential dread.
6. 	Leave CPU cores on default. UTM will pass all performance cores to the VM like a good little hypervisor.
7. 	Set up a shared folder if you want to pretend your VM is part of the family.
8. 	Launch the VM. Full-screen it. Ctrl+Opt releases your soul back to macOS.
9. 	Install Bluefin as normal. No wizardry required.
10. Run `sudo bootc switch ghcr.io/n3ddu8/atomac`

That’s it. No comlex scripts. No YAML. Just vibes.

### :question: FAQ: Questions You Didn’t Ask But I Answered Anyway
Q: Why not just use macOS?

A: Because I like my desktops like I like my shell prompts - extra, opinionated, and slightly unstable.

Q: Why Bluefin?

A: Because it’s gorgeous, fast, and doesn’t make me feel like I’m using a server distro to write emails.

Q: Why UTM?

A: Because it’s native, it’s free, and it doesn’t ask me to install kernel extensions that sound like malware.

Q: Why not just dual boot Asahi Linux?

A: Because I love functioning Wi-Fi, graphics acceleration, and not crying into my kernel logs.

Q: Why is your README so dramatic?

A: Because this is more than a VM - it’s a lifestyle. Also because I’m tired of reading dry documentation that feels like it was written by a toaster.

Still here? You’re either my kind of person or lost. Either way, welcome to Atomac.

:vulcan_salute: May your VM be fast and your dotfiles be ever declarative. :vulcan_salute:
