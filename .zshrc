# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
fastfetch
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Plugins
plugins=(
    git
    zsh-autosuggestions 
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zshl"
alias c="clear"
alias zshrc="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias e="cursor ."
alias hex2ascii="xxd -r -p"



alias s-now="sudo shutdown -h now"
alias d-clean='docker ps -q | xargs -r docker stop && docker ps -a -q | xargs -r docker rm && docker images -q | xargs -r docker rmi'
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/arthurbretas1/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias ls="eza --icons=always"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
export EDITOR=cursor

kp() {
  [ -z "$1" ] && return
  pids=$(lsof -ti tcp:"$1")
  [ -z "$pids" ] && echo "Nothing running on port $1" && return
  kill -9 $pids
}


export PATH=~/.npm-global/bin:$PATH

# bun completions
[ -s "/Users/arthurbretas1/.bun/_bun" ] && source "/Users/arthurbretas1/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"
export PATH="$HOME/.avm/bin:$PATH"
export PATH="/home/arthurbretas1/.local/share/solana/install/active_release/bin:$PATH"


alias sp-dev="alias surfpool=~/.cargo/bin/surfpool && which surfpool"

alias sp-brew="alias surfpool=/opt/homebrew/bin/surfpool && which surfpool"

alias cf="cargo +nightly fmt --all"

csi() {
  local OLD_DIR=$PWD
  cd ~/Documents/surfpool || return
  cargo surfpool-install-dev "$@"
  alias surfpool=~/.cargo/bin/surfpool
  cd "$OLD_DIR" || return
  which surfpool
}



alias ss="surfpool start --no-deploy"

srpc() {
    GREEN="\033[0;32m"
  YELLOW="\033[1;33m"
  CYAN="\033[0;36m"
  RED="\033[0;31m"
  RESET="\033[0m"

  echo -e "${CYAN}Surfpool Datasource RPC URL Configurator${RESET}"
  echo
  echo -e "  ${YELLOW}1.${RESET} Set DEFAULT URL"
  echo -e "  ${YELLOW}2.${RESET} Set CUSTOM URL"
  echo -e "  ${YELLOW}3.${RESET} UNSET variable"
  echo

  printf "Select option [1-3] (default: 1): "
  read choice

  if [ -z "$choice" ]; then
    choice="1"
  fi

  case "$choice" in
    "1")
      export SURFPOOL_DATASOURCE_RPC_URL="https://mainnet.helius-rpc.com/?api-key=$HELIUS_API_KEY"
      echo -e "${GREEN}Set default SURFPOOL_DATASOURCE_RPC_URL.${RESET}"
      ;;
    "2")
      printf "Enter new URL: "
      read url
      if [ -n "$url" ]; then
        export SURFPOOL_DATASOURCE_RPC_URL="$url"
        echo -e "${GREEN}SURFPOOL_DATASOURCE_RPC_URL set to:${RESET} $url"
      else
        echo -e "${RED}No URL entered. Nothing changed.${RESET}"
      fi
      ;;
    "3")
      unset SURFPOOL_DATASOURCE_RPC_URL
      echo -e "${GREEN}SURFPOOL_DATASOURCE_RPC_URL unset.${RESET}"
      ;;
    *)
      echo -e "${RED}Invalid option.${RESET}"
      ;;
  esac
}


