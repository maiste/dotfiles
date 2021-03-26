## Dot dot dot

### Info

This repository contains my dotfiles. I tend to change my system regularly
for working reasons so I have a few preinstalled configuration for different
distributions. Currently, I support:
 - Archlinux
 - Fedora
 - PopOs [DOING]

### Actual configuration

Actually, I'm working on the following configuration:
 * **PopOS** based (transition to nix)
 * **i3-gaps** as window manager
 * **Rofi** as app launcher
 * **Zsh** as shell with **Starship** as a prompt
 * **Alacritty** as terminal
 * **Neovim** to code and take notes

## Use the scripts

First, this is a small description about the different [scripts](./scripts) :

| Name        | Content                                 |
| -------     | -------                                 |
| Makeinstall | Main script that launch everything      |
| Makesys     | Install the system basics like terminal |
| Makelinks   | Create all the links for the system     |
| Makenix     | Dowload extra packages from nixpkgs     |
| Makelang    | Install my favourite and used languages |


To run the entire installation you can run the following command:
```sh
 $ ./install-me [DISTRO]
```

You can choose into one of the following options for the distro:
 - arch
 - fedora
 - popos

### Licence

 (c) MIT Licence.

