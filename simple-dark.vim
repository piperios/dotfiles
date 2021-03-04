if !(&t_Co ==256 || has('gui_running'))
  finish
endif

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name="simple-dark"
set background=dark

" General Colors
hi Normal       guifg=#8f785b  guibg=#121212  gui=none
hi Comment      guifg=#404040  guibg=NONE     gui=none
hi Constant     guifg=#2b4242  guibg=NONE     gui=none
hi Identifier   guifg=#3d4725  guibg=NONE     gui=none
hi Statement    guifg=#946e3d  guibg=NONE     gui=none
hi PreProc      guifg=#d1b897  guibg=NONE     gui=none
hi Type         guifg=#3d4725  guibg=NONE     gui=none
hi Special      guifg=#3d4725  guibg=NONE     gui=none

" Text Markup
hi Underlined   guifg=#121212  guibg=NONE     gui=underline
hi Error        guifg=#8a3333  guibg=NONE     gui=none
hi Todo         guifg=#8a3333  guibg=NONE     gui=none
hi MatchParen   guifg=NONE     guibg=#2b4242  gui=none

" Text Selection
hi Cursor       guifg=bg       guibg=#8a3333  gui=none
hi iCursor      guifg=bg       guibg=#8a3333  gui=none
hi vCursor      guifg=bg       guibg=#2b4242  gui=none
hi CursorIM     guifg=bg       guibg=#8a3333  gui=none
hi CursorColumn guifg=NONE     guibg=#121212  gui=none
hi CursorLine   guifg=NONE     guibg=#100909  gui=none
hi Visual       guifg=NONE     guibg=#202020  gui=none
hi VisualNOS    guifg=bg       guibg=NONE     gui=underline
hi IncSearch    guifg=bg       guibg=#87afaf  gui=none
hi Search       guifg=bg       guibg=#d1b897  gui=none
hi NonText      guifg=#8f785b  guibg=NONE

" UI
hi Function     guifg=#8a3333  guibg=NONE     gui=none
hi LineNr       guifg=#8f8272  guibg=bg       gui=none
hi CursorLineNr guifg=#b5b5b5  guibg=bg       gui=none
hi Pmenu        guifg=#121212  guibg=#b2b2b2  gui=none
hi PmenuSel     guifg=fg       guibg=#585858  gui=none
hi PMenuSbar    guifg=#121212  guibg=#c6c6c6  gui=none
hi PMenuThumb   guifg=fg       guibg=#767676  gui=none
hi StatusLine   guifg=#121212  guibg=#b2b2b2  gui=none
hi StatusLineNC guifg=#121212  guibg=#767676  gui=none
hi TabLine      guifg=#121212  guibg=#b2b2b2  gui=none
hi TabLineFill  guifg=#121212  guibg=#b2b2b2  gui=none
hi TabLineSel   guifg=bg       guibg=#585858  gui=none
hi VertSplit    guifg=bg       guibg=bg       gui=none
hi Folded       guifg=bg       guibg=fg       gui=none
hi FoldColumn   guifg=bg       guibg=fg       gui=none
hi CursorColumn guifg=#3d4725  guibg=bg       gui=none
hi ErrorMsg     guifg=#b84646  guibg=NONE     gui=none
hi Directory    guifg=fg       guibg=NONE     gui=none
hi WildMenu     guifg=NONE     guibg=#005f87  gui=none
hi Ignore       guifg=bg
