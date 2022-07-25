set fish_greeting

env_var VIRTUAL_ENV_DISABLE_PROMPT "1"

env_var MANPAGER "sh -c 'col -bx | bat -l man -p'"

env_var DOWNGRADE_FROM_ALA 1

# set editor
set -U EDITOR "nvim"

# set fish shell env
set -U shell "/usr/bin/fish"

# set browser 
set -U BROWSER "/usr/bin/google-chrome-stable"
