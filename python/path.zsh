#!/usr/local/bin/zsh

__pyenv_started=0

__pyenv_init() {
	test $__pyenv_started = 0 && {
		eval "$(command pyenv init -)"
		eval "$(command pyenv virtualenv-init -)"
		__pyenv_started=1
	}
}

pyenv() {
    __pyenv_init
    command pyenv "$@"
}

# python() {
#     __pyenv_init
#     command python "$@"
# }

# npm() {
#     __pyenv_init
#     command npm "$@"
# }

# yarn() {
#     __pyenv_init
#     command yarn "$@"
# }
