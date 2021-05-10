hi clear
if exists("syntax_on")
  syntax reset
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color GNU screen.
  set t_ut=
endif

let colors_name="custom"
set background=dark

" General Colors
hi Normal       ctermfg=yellow      ctermbg=NONE       cterm=NONE
hi Comment      ctermfg=cyan        ctermbg=NONE       cterm=NONE
hi Constant     ctermfg=darkcyan    ctermbg=NONE       cterm=NONE
hi Identifier   ctermfg=darkgreen   ctermbg=NONE       cterm=NONE
hi Statement    ctermfg=gray        ctermbg=NONE       cterm=NONE
hi PreProc      ctermfg=darkgray    ctermbg=NONE       cterm=NONE
hi Type         ctermfg=darkgreen   ctermbg=NONE       cterm=NONE
hi Special      ctermfg=darkgreen   ctermbg=NONE       cterm=NONE

" Text Markup
hi Underlined   ctermfg=black       ctermbg=NONE       cterm=underline
hi Error        ctermfg=darkred     ctermbg=NONE       cterm=NONE
hi Todo         ctermfg=darkred     ctermbg=NONE       cterm=NONE
hi MatchParen   ctermfg=NONE        ctermbg=darkcyan   cterm=NONE

" Text Selection
hi Cursor       ctermfg=white       ctermbg=black      cterm=NONE
hi CursorIM     ctermfg=white       ctermbg=black      cterm=NONE
hi CursorColumn ctermfg=NONE        ctermbg=233        cterm=NONE
hi CursorLine   ctermfg=NONE        ctermbg=232        cterm=NONE
hi Visual       ctermfg=NONE        ctermbg=235        cterm=NONE
hi VisualNOS    ctermfg=black       ctermbg=NONE       cterm=underline
hi IncSearch    ctermfg=white       ctermbg=109        cterm=NONE
hi Search       ctermfg=white       ctermbg=yellow     cterm=NONE

" UI
hi Function     ctermfg=magenta     ctermbg=NONE       cterm=NONE
hi LineNr       ctermfg=darkgray    ctermbg=black      cterm=NONE
hi CursorLineNr ctermfg=233         ctermbg=black      cterm=NONE
hi Pmenu        ctermfg=233         ctermbg=darkyellow cterm=NONE
hi PmenuSel     ctermfg=black       ctermbg=darkcyan   cterm=NONE
hi PMenuSbar    ctermfg=yellow      ctermbg=233        cterm=NONE
hi PMenuThumb   ctermfg=yellow      ctermbg=black      cterm=NONE
hi StatusLine   ctermfg=233         ctermbg=233        cterm=NONE
hi StatusLineNC ctermfg=233         ctermbg=243        cterm=NONE
hi TabLine      ctermfg=233         ctermbg=236        cterm=NONE
hi TabLineFill  ctermfg=233         ctermbg=249        cterm=NONE
hi TabLineSel   ctermfg=black       ctermbg=240        cterm=NONE
hi VertSplit    ctermfg=black       ctermbg=black      cterm=NONE
hi Folded       ctermfg=black       ctermbg=white      cterm=NONE
hi FoldColumn   ctermfg=black       ctermbg=white      cterm=NONE
hi SignColumn   ctermfg=NONE        ctermbg=235        cterm=NONE
hi NonText      ctermfg=darkcyan    ctermbg=black      cterm=NONE
hi ErrorMsg     ctermfg=darkred     ctermbg=black      cterm=NONE
hi Directory    ctermfg=yellow      ctermbg=NONE       cterm=NONE
hi WildMenu     ctermfg=NONE        ctermbg=darkcyan   cterm=NONE
hi Ignore       ctermfg=black       ctermbg=NONE       cterm=NONE

hi YcmErrorSign   ctermfg=darkred  ctermbg=NONE  cterm=NONE
hi YcmWarningSign ctermfg=magenta  ctermbg=NONE  cterm=NONE
