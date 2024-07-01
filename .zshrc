# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi



# Plugin Manager
# ----------------------------------------------------------------------
# Set the directory we want to store Zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"
# ----------------------------------------------------------------------



# Zenful Prompt
# ----------------------------------------------------------------------
# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# ----------------------------------------------------------------------



# The Main Zsh Plugins
# ----------------------------------------------------------------------
# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab

# Extra Zsh completions
zinit snippet OMZP::git
# zinit snippet OMZP::gh
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Automatically load completions upon start
autoload -Uz compinit && compinit

# Recommended by Zinit, to reply all cached completions
zinit cdreplay -q

# Keybindings for Zsh compeltions
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# ----------------------------------------------------------------------



# Historical Searching
# ----------------------------------------------------------------------
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# Zsh Options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# ----------------------------------------------------------------------



# Completion Styling
# ----------------------------------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# ----------------------------------------------------------------------



# Aliases
# ----------------------------------------------------------------------
alias ls='ls -a --color'
alias vim='nvim'
alias c='clear'
# ----------------------------------------------------------------------



# Shell integrations
# ----------------------------------------------------------------------
# eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)"
# ----------------------------------------------------------------------



# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"



# Exports
# ----------------------------------------------------------------------
export FUNCNEST=1000  # or a higher number if needed
export EDITOR=nvim

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$PATH:/home/abbashayder/.nvm/versions/node/v18.15.0/bin"

# [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
# Load Angular CLI autocompletion.
# source <(ng completion script)
# ----------------------------------------------------------------------















