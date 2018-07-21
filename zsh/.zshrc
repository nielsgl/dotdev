#!/usr/local/bin/zsh

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

# project folder that we can `c [tab]` to
export PROJECTS="$HOME/Code"

# your default editor
# export EDITOR='vim'
export EDITOR='code'
export VEDITOR='code'

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

# load the path files
echo "sourcing: */path.zsh"
for file in ${(M)config_files:#*/path.zsh}; do
	echo "sourcing: $file"
	source "$file"
done

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# load antibody plugins
# source <(antibody init)
antibody bundle < "$DOTFILES/zsh/plugins.txt" > "$DOTFILES/zsh/zsh_plugins.sh"
source $DOTFILES/zsh/zsh_plugins.sh

# load everything but the path and completion files
echo "sourcing: all but path.zsh and completion.zsh"
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
	echo "sourcing: $file"
	source "$file"
done

# Lines configured by zsh-newuser-install
# MOVED TO config.zsh
# End of lines configured by zsh-newuser-install


# The following lines were added by compinstall
zstyle :compinstall filename '/Users/niels/.zshrc'

autoload -Uz compinit
# compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
# End of lines added by compinstall

# aliases
# alias reload='source ~/.zshrc'
alias reload!='exec "$SHELL" -l'



fpath=(/usr/local/share/zsh-completions $fpath)

# load every completion after autocomplete loads
echo "sourcing: */completion.zsh"
for file in ${(M)config_files:#*/completion.zsh}; do
	echo "sourcing: $file"
	source "$file"
done

# zsh-autosuggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# antibody bundle < ~/.dotfiles/zsh/plugins_last.txt
# antibody bundle < "$DOTFILES/zsh/plugins_last.txt" > "$DOTFILES/zsh/zsh_plugins_last.sh"
# source $DOTFILES/zsh/zsh_plugins_last.sh

unset config_files updated_at

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
