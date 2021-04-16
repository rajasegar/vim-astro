" Vim indent file
" Language:   Astro (HTML/JavaScript/CSS)
" Author:     Rajasegar Chandran <rajasegar.c@gmail.com>
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" URL:        https://github.com/rajasegar/vim-astro

if exists("b:did_indent")
  finish
endif

if !exists('g:astro_indent_script')
  let g:astro_indent_script = 1
endif

if !exists('g:astro_indent_style')
  let g:astro_indent_style = 1
endif

" Try to mirror Astro's indent settings so the HTML indenting scripts match.
if g:astro_indent_script
  let b:html_indent_script1 = "inc"
else
  let b:html_indent_script1 = "zero"
endif

if g:astro_indent_style
  let b:html_indent_style1 = "inc"
else
  let b:html_indent_style1 = "zero"
endif

runtime! indent/html.vim
unlet! b:did_indent

let s:html_indent = &l:indentexpr
let b:did_indent = 1

setlocal indentexpr=GetAstroIndent()
setlocal indentkeys=o,O,*<Return>,<>>,{,},0),0],!^F,;

" Only define the function once.
if exists('*GetAstroIndent')
  finish
endif

function! GetAstroIndent()
  let current_line_number = v:lnum

  if current_line_number == 0
    return 0
  endif

  let current_line = getline(current_line_number)

  " Opening --- and style tags should be all the way outdented.
  "
  if current_line =~ '^\s*<style'
    return 0
  endif

  if current_line =~ '^\s*---'
    return 0
  endif

  let previous_line_number = prevnonblank(current_line_number - 1)
  let previous_line = getline(previous_line_number)
  let previous_line_indent = indent(previous_line_number)

  " The inside of --- and style should be indented unless disabled.
  if previous_line =~ '^\s*---'
    if g:astro_indent_script
      return previous_line_indent + shiftwidth()
    else
      return previous_line_indent
    endif
  endif

  if previous_line =~ '^\s*<style'
    if g:astro_indent_style
      return previous_line_indent + shiftwidth()
    else
      return previous_line_indent
    endif
  endif

  execute "let indent = " . s:html_indent

  return indent
endfunction
