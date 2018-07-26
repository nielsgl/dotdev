#!/bin/sh
if which hub >/dev/null 2>&1; then
	alias git='hub'
fi

alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch -v'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gpr='gp && git pr'
alias glnext='git log --oneline $(git describe --tags --abbrev=0 @^)..@'

if which svu >/dev/null 2>&1; then
	alias gtpatch='echo `svu p`; git tag `svu p`'
	alias gtminor='echo `svu m`; git tag `svu m`'
fi

gi() {
	curl -s "https://www.gitignore.io/api/$*"
}


# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
# hub_path=$(which hub)
# if (( $+commands[hub] ))
# then
#   alias git=$hub_path
# fi

# # The rest of my fun git aliases
# alias gl='git pull --prune'
# alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# alias gp='git push origin HEAD'

# # Remove `+` and `-` from start of diff lines; just rely upon color.
# alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

# alias gc='git commit'
# alias gca='git commit -a'
# alias gco='git checkout'
# alias gcb='git copy-branch-name'
# alias gb='git branch'
# alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# alias gac='git add -A && git commit -m'
# alias ge='git-edit-new'
