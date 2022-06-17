


set fish_greeting ""
set -gx TERM xterm-256color
set -g theme_color_scheme terminal-dark


# Ruby path

# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"

# -----
# theme
# ----- 
# command to install: curl -fsSL https://starship.rs/install.sh | bash

direnv hook fish | source

starship init fish | source


set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
