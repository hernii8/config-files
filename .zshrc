export EDITOR "nvim"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin:$HOME/.fzf/bin"
eval $(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias cnote="/home/herni/.local/create_note.sh"
alias la="eza -lah"
alias ls="eza"
alias vim='nvim'
alias grep='grep --color=auto'
alias cat='batcat --paging=never'

fzf_tmux_open() {
   selected=$(find ~/ | fzf)

   if [[ -z $selected ]]; then
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

##### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
   print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
#### End of Zinit's installer chunk

## Load auto-completions
autoload -U compinit && compinit
## Plugins

zinit ice depth=1; 
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light junegunn/fzf


## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
bindkey "^[OA" history-search-backward
bindkey "^[OB" history-search-forward
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word
zle -N fzf_tmux_open
bindkey -s '^F' 'fzf_tmux_open\n'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/settings.json)"

