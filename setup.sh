#!/bin/bash
ARCH_PACKAGES="kitty vim ranger base-devel python3 python-pip git clang nodejs
ruby neovim npm zsh tmux"
DOTCONFIG="kitty nvim ranger"
DOTHOME="fonts xinitrc bin themes zshenv"
AUR_PACKAGES="python-ueberzug-git bear ctags"
PY_PACKAGES="pynvim neovim"
NPM_PACKAGES="neovim"
GEM_PACKAGES="neovim"

# Install Arch packages
for package in $ARCH_PACKAGES
do
  if ! pacman -Qi "$package" > /dev/null; then
    sudo pacman -S "$package"
  fi
done

# Install AUR stuff
for pack in $AUR_PACKAGES
do
  if ! pacman -Qi "$pack" > /dev/null; then
    git clone https://aur.archlinux.org/"$pack" buildhere
    cd buildhere && makepkg -si
    cd .. && rm -rf buildhere
    cd ..
  fi
done

# Install Python packages
for package in $PY_PACKAGES
do
  pip install "$package"
done

# Install NPM packages
for package in $NPM_PACKAGES
do
  npm install "$package"
done

# Cleanup existing things
for diri in $DOTCONFIG
do
  rm -rf ~/.config/"$diri"
done

for diri in $DOTHOME
do
  rm -rf ~/."$diri"
done

# Symlink stuff
for diri in $DOTCONFIG
do
  ln -s ~/dotfiles/.config/"$diri" ~/.config/
done

for diri in $DOTHOME
do
  ln -s ~/dotfiles/."$diri" ~/."$diri"
done

# Misc

# Ranger Icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
