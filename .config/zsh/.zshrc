
# Auto-start tmux on terminal launch
if [[ -z $TMUX && -z $SSH_CONNECTION && -t 1 ]]; then
  if tmux has-session 2>/dev/null; then
    exec tmux attach
  else
    exec tmux new
  fi
fi
eval "$(zoxide init zsh)"

# ---------- Environment ----------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export VISUAL=vim
export PAGER=less

# ---------- History ----------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# ---------- Shell behavior ----------
setopt AUTO_CD
setopt NO_BEEP
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS

# ---------- Completion ----------
autoload -Uz compinit
compinit

# ---------- Prompt (minimal) ----------
PROMPT='%F{white}%n@%m%f %F{cyan}%~%f '

alias v="vim"
alias c="clear"
alias ls="ls -a"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.config/zsh/.zshrc"
alias src="source ~/.config/zsh/.zshrc"
alias ff="fastfetch"

# --- transient blank line before *current* prompt only ---
typeset -g __PROMPT_GAP=0
typeset -g __FIRST_PROMPT=1

precmd() {
  if (( __FIRST_PROMPT )); then
    __FIRST_PROMPT=0
  else
    print
    __PROMPT_GAP=1
  fi
}

preexec() {
  if (( __PROMPT_GAP )); then
    # remove the previously printed blank line so history stays compact
    printf '\e[2A\e[2K\e[M\e[1B\r'
    __PROMPT_GAP=0
  fi
}


preexec() {
  # Treat screen wipes as "first prompt"
  if [[ $1 == clear || $1 == reset || $1 == c ]]; then
    __FIRST_PROMPT=1
    __PROMPT_GAP=0
    return
  fi

  if (( __PROMPT_GAP )); then
    printf '\e[2A\e[2K\e[M\e[1B\r'
    __PROMPT_GAP=0
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


zz() {
  local dir
  dir=$(zoxide query -l | fzf --height=40% --reverse --prompt="ghost> ")
  [[ -n $dir ]] && cd "$dir"
}

# Created by `pipx` on 2026-01-31 19:44:16
export PATH="$PATH:/Users/machine/.local/bin"
