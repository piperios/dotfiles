set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "scotchy"

hi Cursor ctermfg=17 ctermbg=15 cterm=NONE guifg=#272d35 guibg=#ffffff gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#434d5b gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3d4249 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3d4249 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3d4249 gui=NONE
hi LineNr ctermfg=102 ctermbg=59 cterm=NONE guifg=#93969a guibg=#3d4249 gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#666a70 guibg=#666a70 gui=NONE
hi MatchParen ctermfg=210 ctermbg=NONE cterm=underline guifg=#ff8a8a guibg=NONE gui=underline
hi StatusLine ctermfg=15 ctermbg=59 cterm=bold guifg=#ffffff guibg=#666a70 gui=bold
hi StatusLineNC ctermfg=15 ctermbg=59 cterm=NONE guifg=#ffffff guibg=#666a70 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#434d5b gui=NONE
hi IncSearch ctermfg=17 ctermbg=146 cterm=NONE guifg=#272d35 guibg=#bdc1c7 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=146 ctermbg=NONE cterm=NONE guifg=#bdc1c7 guibg=NONE gui=NONE
hi Folded ctermfg=59 ctermbg=17 cterm=NONE guifg=#535e6f guibg=#272d35 gui=NONE

hi Normal ctermfg=15 ctermbg=17 cterm=NONE guifg=#ffffff guibg=#272d35 gui=NONE
hi Boolean ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e5d4ff guibg=NONE gui=NONE
hi Character ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi Comment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#535e6f guibg=NONE gui=italic
hi Conditional ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=italic
hi DiffAdd ctermfg=15 ctermbg=64 cterm=bold guifg=#ffffff guibg=#46840f gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b090b guibg=NONE gui=NONE
hi DiffChange ctermfg=15 ctermbg=23 cterm=NONE guifg=#ffffff guibg=#243c5e gui=NONE
hi DiffText ctermfg=15 ctermbg=24 cterm=bold guifg=#ffffff guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=15 ctermbg=210 cterm=NONE guifg=#ffffff guibg=#ff7e7e gui=NONE
hi WarningMsg ctermfg=15 ctermbg=210 cterm=NONE guifg=#ffffff guibg=#ff7e7e gui=NONE
hi Float ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e5d4ff guibg=NONE gui=NONE
hi Function ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi Identifier ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=italic
hi Keyword ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=italic
hi Label ctermfg=146 ctermbg=NONE cterm=NONE guifg=#bdc1c7 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=59 cterm=NONE guifg=#434d5b guibg=#32383f gui=NONE
hi Number ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e5d4ff guibg=NONE gui=NONE
hi Operator ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi PreProc ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=italic
hi Special ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=59 cterm=NONE guifg=#434d5b guibg=#3d4249 gui=NONE
hi Statement ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi StorageClass ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=italic
hi String ctermfg=146 ctermbg=NONE cterm=NONE guifg=#bdc1c7 guibg=NONE gui=NONE
hi Tag ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=NONE
hi Title ctermfg=15 ctermbg=NONE cterm=bold guifg=#ffffff guibg=NONE gui=bold
hi Todo ctermfg=59 ctermbg=NONE cterm=inverse,bold guifg=#535e6f guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi rubyFunction ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=146 ctermbg=NONE cterm=NONE guifg=#bdc1c7 guibg=NONE gui=NONE
hi rubyConstant ctermfg=231 ctermbg=NONE cterm=NONE guifg=#fefffd guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=146 ctermbg=NONE cterm=NONE guifg=#bdc1c7 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi rubyInclude ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi rubyEscape ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi rubyControl ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi rubyOperator ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi rubyException ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=231 ctermbg=NONE cterm=NONE guifg=#fefffd guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e5d4ff guibg=NONE gui=NONE
hi erubyComment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#535e6f guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi htmlTag ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=NONE
hi htmlEndTag ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=NONE
hi htmlTagName ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=NONE
hi htmlArg ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=210 ctermbg=NONE cterm=NONE guifg=#ff8a8a guibg=NONE gui=NONE
hi yamlAnchor ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi yamlAlias ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=146 ctermbg=NONE cterm=NONE guifg=#bdc1c7 guibg=NONE gui=NONE
hi cssURL ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fffbd4 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccdff guibg=NONE gui=NONE
hi cssColor ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi cssClassName ctermfg=217 ctermbg=NONE cterm=NONE guifg=#ffb5a0 guibg=NONE gui=NONE
hi cssValueLength ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e5d4ff guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e5d4ff guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
