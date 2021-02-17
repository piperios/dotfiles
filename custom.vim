if !(&t_Co==256 || has('gui_running'))
  finish
endif

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name="custom"
set t_Co=256
set background=dark

" General Colors
hi Normal       guifg=#c2c2c2  guibg=#212e40  gui=none
hi Comment      guifg=#808080  guibg=NONE     gui=none
hi Constant     guifg=#32668c  guibg=NONE     gui=none
hi Identifier   guifg=#449184  guibg=NONE     gui=none
hi Statement    guifg=#b59f82  guibg=NONE     gui=none
hi PreProc      guifg=#a08563  guibg=NONE     gui=none
hi Type         guifg=#449184  guibg=NONE     gui=none
hi Special      guifg=#449184  guibg=NONE     gui=none

" Text Markup
hi Underlined   guifg=fg       guibg=NONE     gui=underline
hi Error        guifg=#b31414  guibg=NONE     gui=none
hi Todo         guifg=#e5786d  guibg=NONE     gui=none
hi MatchParen   guifg=fg       guibg=#5f8787  gui=none
hi NonText      guifg=#585858  guibg=NONE     gui=none
hi SpecialKey   guifg=#585858  guibg=NONE     gui=none
hi Title        guifg=#d7d7af  guibg=NONE     gui=none

" Text Selection
hi Cursor       guifg=bg       guibg=fg       gui=none
hi CursorIM     guifg=bg       guibg=fg       gui=none
hi CursorColumn guifg=NONE     guibg=#ff0000  gui=none
hi CursorLine   guifg=NONE     guibg=#1d2838  gui=none
hi Visual       guifg=NONE     guibg=#3a3a3a  gui=none
hi VisualNOS    guifg=fg       guibg=NONE     gui=underline
hi IncSearch    guifg=bg       guibg=#639dba  gui=none
hi Search       guifg=bg       guibg=#d1b897  gui=none

" UI
hi Function     guifg=#b59f82  guibg=NONE     gui=none
hi LineNr       guifg=#b59f82  guibg=#212e40  gui=none
hi CursorLineNr guifg=#b5b5b5  guibg=#212e40  gui=none
hi Pmenu        guifg=#121212  guibg=#b2b2b2  gui=none
hi PmenuSel     guifg=fg       guibg=#585858  gui=none
hi PMenuSbar    guifg=#121212  guibg=#c6c6c6  gui=none
hi PMenuThumb   guifg=fg       guibg=#767676  gui=none
hi StatusLine   guifg=#121212  guibg=#b2b2b2  gui=none
hi StatusLineNC guifg=#121212  guibg=#767676  gui=none
hi TabLine      guifg=#121212  guibg=#b2b2b2  gui=none
hi TabLineFill  guifg=#121212  guibg=#b2b2b2  gui=none
hi TabLineSel   guifg=fg       guibg=#585858  gui=none
hi VertSplit    guifg=#1d2838  guibg=bg       gui=none
hi Folded       guifg=fg       guibg=bg       gui=none
hi FoldColumn   guifg=fg       guibg=bg       gui=none

" Spelling
hi SpellBad     guisp=#ee0000                 gui=undercurl
hi SpellCap     guisp=#eeee00                 gui=undercurl
hi SpellRare    guisp=#ffa500                 gui=undercurl
hi SpellLocal   guisp=#ffa500                 gui=undercurl

" Diff
hi DiffAdd      guifg=fg       guibg=#405040  gui=none
hi DiffChange   guifg=fg       guibg=#605040  gui=none
hi DiffDelete   guifg=fg       guibg=#504040  gui=none
hi DiffText     guifg=#e0b050  guibg=#605040  gui=none

" Misc
hi Directory    guifg=fg       guibg=NONE     gui=none
hi ErrorMsg     guifg=#ff8787  guibg=NONE     gui=none
hi SignColumn   guifg=#afafaf  guibg=NONE     gui=none
hi MoreMsg      guifg=#87ffff  guibg=NONE     gui=none
hi ModeMsg      guifg=fg       guibg=NONE     gui=none
hi Question     guifg=fg       guibg=NONE     gui=none
hi WarningMsg   guifg=#d7af87  guibg=NONE     gui=none
hi WildMenu     guifg=NONE     guibg=#005f87  gui=none
hi ColorColumn  guifg=NONE     guibg=#303030  gui=none
hi Ignore       guifg=bg
