set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x DOWNGRADE_FROM_ALA 1

## set editor
set -x EDITOR "nvim"

## set fish shell env
set -x shell "/usr/bin/fish"

## set browser 
set -x BROWSER "/usr/bin/google-chrome-stable"

# set path to asdf
source ~/.asdf/asdf.fish
 
# Add bin of rofi to path
fish_add_path ~/.config/rofi/bin

#Add awsume to path
fish_add_path /home/danilo/.asdf/installs/python/3.8.3/lib/python3.8/site-packages

# Add bin of go bin to path
fish_add_path ~/go/bin

# set base env
source ~/.profile

fzf_configure_bindings --git_status=\cg --history=\co --variables --directory=\cf --git_log=\cl

## Dotdrop alias
alias dotdrop='~/dotfiles/dotdrop.sh --cfg=~/dotfiles/config.yaml'

## Aws alias
alias awsume=". awsume"

## Useful aliases
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles
alias ip="ip -color"

# Replace some more things with better alternatives
alias cat='bat --style header --style rules --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages
alias cl="clear"
alias youse="cd ~/Repositorios/rebase/workspace/youse"
alias nv="nvim"
alias lz="lazygit"

# Common use for tmux
alias t="tmux"
alias ts="tmux new -s"
alias ta="tmux attach -t ."
alias tl="tmux ls"

# Commom use for docker
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dcr="docker-compose run"

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"


## Run neofetch if session is interactive
if status --is-interactive && type -q neofetch
   neofetch
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

starship init fish | source
