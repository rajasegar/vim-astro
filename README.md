# vim-astro

Vim syntax highlighting and indentation for [Astro](https://astro.build)


This is mostly just HTML syntax highlighting with some keywords added 

## Dependencies

The JavaScript highlighting depends on [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript). That ships with
[sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot) so if you're already using that then you
should be set.


## Installation

The simplest way to install vim-astro is via a package manager like
[Pathogen](https://github.com/tpope/vim-pathogen), [Vundle](https://github.com/VundleVim/Vundle.vim), [NeoBundle](https://github.com/Shougo/neobundle.vim),
[Plug](https://github.com/junegunn/vim-plug), or [minpac](https://github.com/k-takata/minpac).

For example, using minpac:

```vimscript
call minpac#add('rajasegar/vim-astro')
```

Or using Plug:

```vimscript
Plug 'rajasegar/vim-astro', {'branch': 'main'}
```


## Options

To disable indentation within `---` and `<style>` tags, set one of these
variables in your `vimrc`:

```vim
let g:astro_indent_script = 0
let g:astro_indent_style = 0
```

## Integrations

- [ALE](https://github.com/dense-analysis/ale): vim-astro should work out of the box with `eslint` and a few
  other linters/fixers. PRs welcome if the one you want is missing.
- [matchit.vim](https://www.vim.org/scripts/script.php?script_id=39): vim-astro should work out of the box and allow moving
  between HTML tags as well as flow control like `#if/:else//if`.


## Tests

Indentation tests are provided and any contributions would be much appreciated.
They can be run with `make test` which will clone [vader.vim](https://github.com/junegunn/vader.vim) into the
current working directory and run the test suite.



