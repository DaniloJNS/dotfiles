# set path to asdf
source ~/.asdf/asdf.fish
 
# Add bin of rofi to path
fish_add_path ~/.config/rofi/bin

fish_add_path ~/.local/bin

# Add path for scripts
fish_add_path ~/.config/fish/scripts

# fish_add_path ~/tools/lua-language-server/bin

# fish_add_pah ~/local/bin

#Add awsume to path
# fish_add_path /home/danilo/.asdf/installs/python/3.8.3/lib/python3.8/site-packages

# Add bin of go bin to path
fish_add_path ~/go/bin

# set base env
source ~/.profile

# Configure shotcuts for fzf git
fzf_configure_bindings --git_status=\cg --history=\co --variables --directory=\cf --git_log=\cl

## Run neofetch if session is interactive
if status --is-interactive && type -q neofetch
   neofetch
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

fish_vi_key_bindings

starship init fish | source

# Created by `pipx` on 2022-07-12 15:24:20
set PATH $PATH /home/danilo/.local/bin
