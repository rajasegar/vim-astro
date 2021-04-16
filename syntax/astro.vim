" Vim syntax file
" Language:   Astro (HTML/JavaScript/CSS)
" Author:     Rajasegar Chandran <rajasegar.c@gmail.com>
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Depends:    pangloss/vim-javascript
" URL:        https://github.com/rajasegar/vim-astro

if exists("b:current_syntax")
  finish
endif

" JAVA SCRIPT
syntax include @htmlJavaScript syntax/javascript.vim
unlet b:current_syntax
syntax region  astroJavaScript start=+---+ keepend end=+---+me=s-1 contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc

" CSS
syntax include @htmlCss syntax/css.vim
unlet b:current_syntax
syntax region astroStyle start=+<style+ keepend end=+</style>+me=s-1  contains=@htmlCss,htmlTag,htmlEndTag,htmlCssStyleComment,@htmlPreproc
 

" HTML 
runtime! syntax/html.vim
unlet! b:current_syntax

" Expand HTML tag names to include mixed case, periods, and colons.
syntax match htmlTagName contained "\<[a-zA-Z:\.]*\>"

" According to vim-jsx, you can let jsBlock take care of ending the region.
"   https://github.com/mxw/vim-jsx/blob/master/after/syntax/jsx.vim
syntax region astroExpression start="{" end="" contains=jsBlock,javascriptBlock containedin=htmlString,htmlTag,htmlArg,htmlValue,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlHead,htmlTitle,htmlBoldItalicUnderline,htmlUnderlineBold,htmlUnderlineItalicBold,htmlUnderlineBoldItalic,htmlItalicUnderline,htmlItalicBold,htmlItalicBoldUnderline,htmlItalicUnderlineBold,htmlLink,htmlLeadingSpace,htmlBold,htmlBoldUnderline,htmlBoldItalic,htmlBoldUnderlineItalic,htmlUnderline,htmlUnderlineItalic,htmlItalic,htmlStrike,javaScript


" Astro
let b:current_syntax = "astro"

" Sync from start because of the wacky nesting.
syntax sync fromstart
