Current:
1. source all */path.zsh files
2. source all plugins
3. source all but path.zsh and completion.zsh files
4. compinit
5. source all completion files

---

Should be ([reference](https://github.com/robbyrussell/oh-my-zsh/wiki/Design#oh-my-zsh-initialization)):

1. update $fpath: add functions/ completions/
2. source each zsh file
3. load plugins to $fpath, don't source them
4. compinit
5. source plugins

---

1. load fpath.zsh (functions / completions)
2. source all zsh files
3. load plugins (zsh_plugins.sh, fpath +=)
4. compinit
5. source zsh_plugins
