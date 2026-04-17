_conf_dir=${${(%):-%x}:A:h}
for f in "$_conf_dir/conf.d/"*.zsh; do
    [[ -f "$f" ]] && source "$f"
done
unset _conf_dir

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
