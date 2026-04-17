export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$PATH:$HOME/.fzf/bin"

_conf_dir=${${(%):-%x}:A:h}
for f in "$_conf_dir/conf.d/"*.zsh; do
    [[ -f "$f" ]] && source "$f"
done
unset _conf_dir

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/settings.json)"
