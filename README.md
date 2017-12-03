# vim-gluon

## Description

This is a vim plugin that provides [gluon][g] with 
* syntax highlighting
* indentation 

## Language server support

The gluon language server has been tested to work with https://github.com/autozimu/LanguageClient-neovim and https://github.com/prabirshrestha/vim-lsp.

Example configuration (autozimu/LanguageClient-neovim)

```vim
let g:LanguageClient_serverCommands = {
    \ 'gluon': ['gluon_language-server'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
```

## Installation

### Using [Pathogen][p]

```shell
git clone --depth=1 https://github.com/gluon-lang/vim-gluon.git ~/.vim/bundle/rust.vim
```

### Using [vim-plug][]

```
Plug 'gluon-lang/vim-gluon'
```

## Features

syntax highlighting  
indentation

## License

MIT

## Contributing

add an issue if you want to see something or if there is a bug  
fork and create a PR if you want to add something

[g]: https://github.com/gluon-lang/gluon
[v]: https://github.com/gmarik/vundle
[vqs]: https://github.com/gmarik/vundle#quick-start
[p]: https://github.com/tpope/vim-pathogen
[nb]: https://github.com/Shougo/neobundle.vim
[vim-plug]: https://github.com/junegunn/vim-plug
