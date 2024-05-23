<div align="center">
    <h1>Dot dot dot</h1>
    <p>Yet another reproductible Linux configuration</p>
</div>

## Info

This repository contains my dotfiles. I tend to change my system regularly
for working reasons so I have a few preinstalled configuration for different
distributions. Currently, I support:
 - **Archlinux Vanilla_**(_Up to date_)
 - Fedora (_WIP_)

It uses the  [Catppuccin theme](https://github.com/catppuccin) as much as possible because I am
a big fan of the pastel colors!

## Desktop preview

![Sway rendering](./docs/assets/preview.png)

## Actual configuration

Actually, I'm working on the following configuration:
 - It works with `pacman` and `flatpak` as a side package manager (`nix` is
   also available.
   Before I was using `EndervourOS` or `Fedora`.
 - `sway` is my window manager based on `Wayland`.
 - I use `tofi` as my app launcher in replacement of `Rofi`.
 - My main shell is `zsh` with `starship` as a prompt and `oh-my-zsh` as
   a package manager / extension manager.
 - `foot` as my main terminal  (there is also an `alcritty` configuration).
 - `neovim` to code and take notes, even is `obsidian is my main note taking app).
 - `Intellij` is what I used for `Java`, `Kotlin` and, `Scala`

## Languages installed

- `rust` with `rustup`
- `golang`
- `ocaml` with `opam`
- `python` with `pip`
- `deno`
- `npm` with `nvm`
- `scala` with `sdkman`
- `kotlin` with `sdkman`
- `java` with `sdkman`

## Use the scripts

First, this is a small description about the different [scripts](./scripts) :

| Name          | Content                                 |
| -------       | -------                                 |
| install.sh    | Main script that launch everything      |
| system.sh     | Install the system basics like terminal |
| link.sh       | Create all the links for the system     |
| nix.sh        | Dowload extra packages from nixpkgs     |
| flatpak.sh    | Dowload extra packages from flatpak     |
| language.sh   | Install my favourite and used languages |
| catppuccin.sh | Install catppuccin theming features     |


To run the entire installation you can run the following command:
```sh
 $ ./install
```

It will **automatically** select the distribution from the informations stored in `/etc/os-release`.




<div align="center">
 (C) MIT Licence - Maiste
</div>

