# Created by newuser for 5.9

eval "$(starship init zsh)"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export PATH="$HOME/.local/neovim:$PATH"

if [ -z "$TMUX" ]; then
    neofetch
fi
