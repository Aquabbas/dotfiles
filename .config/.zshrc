# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/Cellar/tidy-html5/5.8.0/bin:$PATH"


# ---------------------
# Custom Aliases
# ---------------------
alias vim='nvim'

alias vim-kick="NVIM_APPNAME=kickstart nvim"

alias vim-rad="NVIM_APPNAME=RadVim nvim"

alias vim-lazy="NVIM_APPNAME=LazyVim nvim"
alias vim-chad="NVIM_APPNAME=NvChad nvim"
alias vim-astro="NVIM_APPNAME=AstroNvim nvim"
alias vim-ide="NVIM_APPNAME=NvIDE nvim"


function vims() {
  items=("default" "kickstart" "RadVim" "LazyVim" "NvChad" "AstroNvim" "NvIDE")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s "^n" "vims\n"





# -------
# Plugins
# -------
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/jira", from:oh-my-zsh

zplug "plugins/fd", from:oh-my-zsh
zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug romkatv/powerlevel10k, as:theme, depth:1
# zplug "dracula/zsh", as:theme

# Add the following lines to your ~/.zshrc to ensure that rbenv is initialized with each new terminal session:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
   zplug install
fi

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/mongodb/mongodb-macos-x86_64-7.0.0/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
