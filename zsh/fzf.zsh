# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ctrl/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/ctrl/.fzf/bin"
fi

source <(fzf --zsh)
