# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

LS_COLORS='di=1;38;5;129:'; export LS_COLORS  # Bold dark purple

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# Add in Powerlevel10k
zinit ice depth=1;

# Add in zsh plugins
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light atuinsh/atuin
zinit light jeffreytse/zsh-vi-mode
zinit light MichaelAquilina/zsh-you-should-use

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"

# Source the repos
source /tools/Xilinx/Vitis/2022.2/settings64.sh
source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1

# Ensure correct CMake version is used
export PATH="/usr/local/bin:$PATH"
export LLVM_HOME=~/Documents/llvm-project/build
export PATH=$LLVM_HOME/bin:$PATH
export LD_LIBRARY_PATH=$LLVM_HOME/lib:$LD_LIBRARY_PATH
export IREE_HOME=~/iree-build/tools
export PATH=$IREE_HOME:$PATH
export PYTHONPATH=/home/murari/torch-mlir/build/tools/torch-mlir/python_packages/torch_mlir:/home/murari/torch-mlir/test/python/fx_importer 

# Aliases
alias ls='ls --color'
alias ll='exa -alh'
alias vim='nvim'
alias c='clear'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias nv='nvim'
alias cmake='/usr/local/bin/cmake'
alias cling='cling -resource-dir=$(clang -print-resource-dir)'

# <<< conda initialize <<<
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/murari/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/home/murari/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/home/murari/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="/home/murari/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# >>> conda initialize >>>
