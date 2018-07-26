#!/usr/local/bin/zsh

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

# project folder that we can `c [tab]` to
export PROJECTS="$HOME/Code"

# your default editor
# export EDITOR='vim'
export EDITOR='code'
export VEDITOR='code'

DEBUG=false

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

if [ -z $DEBUG ]; then
	echo "\nStep1: $fpath\n"
	hello
fi

# load the path files
# echo "sourcing: */path.zsh"
for file in ${(M)config_files:#*/path.zsh}; do
	# echo "sourcing: $file"
	source "$file"
done

if [ -z $DEBUG ]; then
	echo "\nStep2: $fpath\n"
	hello
fi

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# # load antibody plugins
# # source <(antibody init)
# antibody bundle < "$DOTFILES/zsh/plugins.txt" > "$DOTFILES/zsh/zsh_plugins.sh"
# source $DOTFILES/zsh/zsh_plugins.sh

if [ -z $DEBUG ]; then
	echo "\nStep3: $fpath\n"
	hello
fi

# load everything but the path and completion files
# echo "sourcing: all but path.zsh and completion.zsh"
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
	# echo "sourcing: $file"
	source "$file"
done

if [ -z $DEBUG ]; then
	echo "\nStep4: $fpath\n"
	hello
fi

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

fpath=(/usr/local/share/zsh-completions $fpath)

if [ -z $DEBUG ]; then
	echo "\nStep5: $fpath\n"
	hello
fi

# load every completion after autocomplete loads
# echo "sourcing: */completion.zsh"
for file in ${(M)config_files:#*/completion.zsh}; do
	# echo "sourcing: $file"
	source "$file"
done

# zsh-autosuggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# antibody bundle < ~/.dotfiles/zsh/plugins_last.txt
# antibody bundle < "$DOTFILES/zsh/plugins_last.txt" > "$DOTFILES/zsh/zsh_plugins_last.sh"
# source $DOTFILES/zsh/zsh_plugins_last.sh

# load antibody plugins
# source <(antibody init)
antibody bundle < "$DOTFILES/zsh/plugins.txt" > "$DOTFILES/zsh/zsh_plugins.sh"
source $DOTFILES/zsh/zsh_plugins.sh

if [ -z $DEBUG ]; then
	echo "\nStep6: $fpath\n"
	hello
fi

unset config_files updated_at

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck disable=SC1090
[ -f ~/.localrc ] && . ~/.localrc

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/niels/.nodenv/versions/10.4.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/niels/.nodenv/versions/10.4.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/niels/.nodenv/versions/10.4.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/niels/.nodenv/versions/10.4.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh