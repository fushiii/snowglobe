# bind CTRL + L to clear term
function fish_user_key_bindings
  bind \cl 'clear; commandline -f repaint'
end