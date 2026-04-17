fzf_tmux_open() {
    selected=$(find "$HOME/Projects" | fzf)

    if [[ -z $selected ]]; then
        return
    fi
    if [[ -f $selected ]]; then
        if file "$selected" | grep -q 'text'; then
            nvim $selected
        else
            open $selected > /dev/null 2>&1 &
        fi
        return
    fi
    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        tmux new-session -s $selected_name -c $selected
        return
    fi
    if ! tmux has-session -t=$selected_name 2> /dev/null; then
        tmux new-session -ds $selected_name -c $selected
    fi

    tmux attach-session -t $selected_name
}

cd() {
    builtin cd "$@" || return
    if [ -n "$TMUX" ]; then
        tmux rename-window "$(basename "$PWD")"
    fi
}
