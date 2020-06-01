# vim-pipenv

Vim + Pipenv, with [virtualenv][vim-virtualenv]/[lsp][vim-lsp] support.


## Features

- [x] Auto activate pipenv in vim
- [x] Auto switch pipenv for different file
- [x] Auto reload lsp server
- [x] Provide in-vim `Pipenv` command


## Installing

- [vim-plug][vim-plug]
```viml
Plug 'plytophogy/vim-virtualenv'
Plug 'PieterjanMontens/vim-pipenv'
```

- [vundle][vundle]
```viml
Plugin 'plytophogy/vim-virtualenv'
Plugin 'PieterjanMontens/vim-pipenv'
```

- [pathogen][pathogen]
```shell
mkdir -p ~/.vim/bundle && cd ~/.vim/bundle
git clone https://github.com/plytophogy/vim-virtualenv
git clone https://github.com/PieterjanMontens/vim-pipenv
```


## Tell Me More

Originally forked from [PieterjanMontens/pipenv][old-vim-pipenv],
which is inspired by and using [vim-virtualenv][vim-virtualenv].
[vim-pipenv][vim-pipenv] detects the venv of pipenv projects, and activates it.
See `:help pipenv` for more details.


## License

License: Same terms as Vim itself (see `:help license`)


[vim-pipenv]: https://github.com/LKI/vim-pipenv
[old-vim-pipenv]: https://github.com/PieterjanMontens/vim-pipenv
[pathogen]: https://github.com/tpope/vim-pathogen
[vim-lsp]: https://github.com/prabirshrestha/vim-lsp
[vim-plug]: https://github.com/junegunn/vim-plug
[vim-virtualenv]: https://github.com/plytophogy/vim-virtualenv
[vundle]: https://github.com/VundleVim/Vundle.vim
