#!/usr/local/bin/zsh

__nodenv_started=0

__nodenv_init() {
	test $__nodenv_started = 0 && {
        echo "exec nodenv init"
		eval "$(command nodenv init -)"
		__nodenv_started=1
	}
}

node() {
    echo "node command"
    __nodenv_init
    command node "$@"
}