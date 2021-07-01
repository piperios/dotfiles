set bg&
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="hue"

hi Normal ctermfg=7
hi Pmenu ctermfg=7 ctermbg=0
hi Directory ctermfg=14

hi Comment ctermfg=14

hi Identifier ctermfg=7
hi Function ctermfg=8

hi Statement ctermfg=15
hi Operator ctermfg=15

hi Type ctermfg=2
hi StorageClass ctermfg=15
hi Structure ctermfg=15

hi Constant ctermfg=6
hi Number ctermfg=6
hi Boolean ctermfg=6
hi String ctermfg=13
hi Character ctermfg=13
hi Special ctermfg=14

hi NonText ctermfg=8
hi PreProc ctermfg=4
hi LineNr ctermfg=7
hi VertSplit ctermbg=0 ctermfg=0
