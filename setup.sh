#!/bin/bash
ARCH_PACKAGES="git kitty vim ranger base-devel python3 python-pip git clang nodejs
ruby neovim npm zsh tmux lazygit fish fd bat gopls the_silver_searcher"
DOTCONFIG="kitty nvim"
AUR_PACKAGES="python-ueberzug-git bear ctags nerd-fonts-fire-code"
PY_PACKAGES="pynvim neovim"
NPM_PACKAGES="neovim"
GEM_PACKAGES="neovim"

# Install Arch packages
for package in $ARCH_PACKAGES
do
  if ! pacman -Qi "$package" > /dev/null; then
    pacman -S "$package"
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


# Symlink stuff
for diri in $DOTCONFIG
do
  ln -s ~/dotfiles/.config/"$diri" ~/.config/
done

# Misc

# Ranger Icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# OH-MY-TMUX
cd $HOME
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
