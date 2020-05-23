# pipenv.vim

> Forked from [PieterjanMontens](https://github.com/PieterjanMontens/vim-pipenv)
>
> Seems origin repo is out of maintainance.

Inspired by and using [vim-virtualenv](https://github.com/plytophogy/vim-virtualenv),
_vim-pipenv_ detects the venv of the pipenv projects you open and activates the corresponding venv.

_vim-pipenv_ will auto-detect the pipenv of any python file you open,
and if auto-switching is enabled,
will switch to the corresponding venv (see `:help pipenv` for options).

You can also issue commands to pipenv with the `:Pipenv` command,
of which the output will be displayed once the command is done
(which.. can take some time. Working on it.).


## Usage Examples ##

Get help

    :help pipenv

See pipenv graph

    :Pipenv graph

Install & lock `pyyaml` in dev packages
(`:Pvv` is provided as alias for `:Pipenv`)

    :Pvv install pyyaml --dev

Activate Pipenv venv for current file

    :Pipenv

Use \<tab\> to switch between available commands.


## Installing ##
vim-pipenv depends on the excellent [vim-virtualenv](https://github.com/plytophogy/vim-virtualenv):
make sure you install it too (or just follow guidelines bellow to install both at the same time)

### [Pathogen](https://github.com/tpope/vim-pathogen) ###
```shell
mkdir -p ~/.vim/bundle && cd ~/.vim/bundle
git clone https://github.com/plytophogy/vim-virtualenv
git clone https://github.com/PieterjanMontens/vim-pipenv
```

### [Vundle](https://github.com/VundleVim/Vundle.vim) ###
```viml
Plugin 'plytophogy/vim-virtualenv'
Plugin 'PieterjanMontens/vim-pipenv'
```

### [Vim-plug](https://github.com/junegunn/vim-plug) ###
```viml
Plug 'plytophogy/vim-virtualenv'
Plug 'PieterjanMontens/vim-pipenv'
```
