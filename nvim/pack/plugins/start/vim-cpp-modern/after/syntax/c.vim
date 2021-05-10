" ==============================================================================
" Vim syntax file
" Language:        C Additions
" Original Author: Mikhail Wolfson <mywolfson@gmail.com>
" Maintainer:      bfrg <https://github.com/bfrg>
" Website:         https://github.com/bfrg/vim-cpp-modern
" Last Change:     Nov 23, 2020
"
" This syntax file is based on:
" https://github.com/octol/vim-cpp-enhanced-highlight
" ==============================================================================

" Highlight additional keywords in the comments
syn keyword cTodo contained BUG NOTE

" Highlight function definitions
syn match cParenBracket "\(\s\+\|\n\){$"
syn match cUserFunction "\(::\)\?\~\?\zs\h\w*\ze([^)]*\(\n\)\?[^)]*\()\s*\(const\|override\)\?\)\?\(\(\n\)\?\s*\(:\|{\)\)" contains=cParenBracket
hi def link cUserFunction Function

" Highlight custom scopes
syn match cCustomScope "::"
syn match cCustomClass "\w\+\s*::" contains=cCustomScope
hi def link cCustomClass Constant

" Highlight structure names
syn clear cStructure
syn match cCustomKey "\<struct\>"
syn match cCustomKey "\<enum\>"
syn match cCustomKey "\<union\>"
syn match cCustomKey "\<typedef\>"
hi def link cCustomKey Structure

syn match cCustomTypeName "\<struct\_s\+\w\+\>"
      \ contains=cCustomKey
syn match cCustomTypeName "\<enum\_s\+\w\+\>"
      \ contains=cCustomKey
hi def link cCustomTypeName Statement

" Common ANSI-standard Names
syn keyword cAnsiName
        \ PRId8 PRIi16 PRIo32 PRIu64 PRId16 PRIi32 PRIo64 PRIuLEAST8 PRId32 PRIi64 PRIoLEAST8 PRIuLEAST16 PRId64 PRIiLEAST8 PRIoLEAST16 PRIuLEAST32 PRIdLEAST8 PRIiLEAST16 PRIoLEAST32 PRIuLEAST64 PRIdLEAST16 PRIiLEAST32 PRIoLEAST64 PRIuFAST8 PRIdLEAST32 PRIiLEAST64 PRIoFAST8 PRIuFAST16 PRIdLEAST64 PRIiFAST8 PRIoFAST16 PRIuFAST32 PRIdFAST8 PRIiFAST16 PRIoFAST32 PRIuFAST64 PRIdFAST16 PRIiFAST32 PRIoFAST64 PRIuMAX PRIdFAST32 PRIiFAST64 PRIoMAX PRIuPTR PRIdFAST64 PRIiMAX PRIoPTR PRIx8 PRIdMAX PRIiPTR PRIu8 PRIx16 PRIdPTR PRIo8 PRIu16 PRIx32 PRIi8 PRIo16 PRIu32 PRIx64 PRIxLEAST8 SCNd8 SCNiFAST32 SCNuLEAST32 PRIxLEAST16 SCNd16 SCNiFAST64 SCNuLEAST64 PRIxLEAST32 SCNd32 SCNiMAX SCNuFAST8 PRIxLEAST64 SCNd64 SCNiPTR SCNuFAST16 PRIxFAST8 SCNdLEAST8 SCNo8 SCNuFAST32 PRIxFAST16 SCNdLEAST16 SCNo16 SCNuFAST64 PRIxFAST32 SCNdLEAST32 SCNo32 SCNuMAX PRIxFAST64 SCNdLEAST64 SCNo64 SCNuPTR PRIxMAX SCNdFAST8 SCNoLEAST8 SCNx8 PRIxPTR SCNdFAST16 SCNoLEAST16 SCNx16 PRIX8 SCNdFAST32 SCNoLEAST32 SCNx32 PRIX16 SCNdFAST64 SCNoLEAST64 SCNx64 PRIX32 SCNdMAX SCNoFAST8 SCNxLEAST8 PRIX64 SCNdPTR SCNoFAST16 SCNxLEAST16 PRIXLEAST8 SCNi8 SCNoFAST32 SCNxLEAST32 PRIXLEAST16 SCNi16 SCNoFAST64 SCNxLEAST64 PRIXLEAST32 SCNi32 SCNoMAX SCNxFAST8 PRIXLEAST64 SCNi64 SCNoPTR SCNxFAST16 PRIXFAST8 SCNiLEAST8 SCNu8 SCNxFAST32 PRIXFAST16 SCNiLEAST16 SCNu16 SCNxFAST64 PRIXFAST32 SCNiLEAST32 SCNu32 SCNxMAX PRIXFAST64 SCNiLEAST64 SCNu64 SCNxPTR PRIXMAX SCNiFAST8 SCNuLEAST8 PRIXPTR SCNiFAST16 SCNuLEAST16 STDC CX_LIMITED_RANGE STDC FENV_ACCESS STDC FP_CONTRACT
        \ errno environ and bitor not_eq xor and_eq compl or xor_eq bitand not or_eq

" Booleans
syn keyword cBoolean true false TRUE FALSE


" Default highlighting
hi def link cBoolean  Boolean
hi def link cAnsiName Identifier


" Highlight all standard C keywords as Statement
" This is very similar to what other IDEs and editors do
if get(g:, 'cpp_simple_highlight', 0)
    hi! def link cStorageClass Statement
    hi! def link cStructure    Statement
    hi! def link cTypedef      Statement
    hi! def link cLabel        Statement
endif
