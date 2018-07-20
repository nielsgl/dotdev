# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/niels/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# aliases
alias reload='source ~/.zshrc'

fpath=(/usr/local/share/zsh-completions $fpath)

source <(antibody init)
antibody bundle < ~/.dotfiles/zsh/plugins.txt

# SPACESHIP_PROMPT_ORDER=(
#   time          # Time stampts section
#   user
# )
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
#   hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
#   elixir        # Elixir section
#   xcode         # Xcode section
#   swift         # Swift section
  golang        # Go section
#   php           # PHP section
#   rust          # Rust section
#   haskell       # Haskell Stack section
#   julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
#   dotnet        # .NET section
#   ember         # Ember.js section
#   kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_TIME_SHOW=true
# SPACESHIP_USER_SHOW=always
# SPACESHIP_HOST_SHOW=always

# nodenv
eval "$(nodenv init -)"

# zsh-autosuggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
antibody bundle < ~/.dotfiles/zsh/plugins_last.txt

