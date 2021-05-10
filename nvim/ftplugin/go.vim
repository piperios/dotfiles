" Highlight function definitions
syn match goParenBracket "\(\s\+\){$"
syn match goUserFunction "\zs\h\w*\ze([^)]*\()\s*\)\(\s\+\){$" contains=goParenBracket
hi def link goUserFunction Function
