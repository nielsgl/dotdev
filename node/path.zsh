#!/usr/local/bin/zsh

__nodenv_started=0

# init according to man page
# if (( $+commands[rbenv] ))
# then
#   eval "$(rbenv init -)"
# fi

__nodenv_init() {
	test $__nodenv_started = 0 && {
		eval "$(command nodenv init -)"
		__nodenv_started=1
	}
}

nodenv() {
    __nodenv_init
    command nodenv "$@"
}

node() {
    __nodenv_init
    command node "$@"
}

npm() {
    __nodenv_init
    command npm "$@"
}

yarn() {
    __nodenv_init
    command yarn "$@"
}
