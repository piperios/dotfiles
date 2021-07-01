syn match cCustomParen transparent "(" contains=cParen contains=cCppParen
syn match cCustomFunc  "\w\+\s*(\@=" contains=cCustomParen
hi def link cCustomFunc Function

syn clear cStructure
syn keyword cStructure typedef

syn match cCustomStructKey "\<struct\>"
syn match cCustomStructKey "\<enum\>"
syn match cCustomStructKey "\<union\>"
hi def link cCustomStructKey cStructure

syn match cCustomStructName "\<struct\_s\+\w\+\>" contains=cCustomStructKey
syn match cCustomStructName "\<enum\_s\+\w\+\>" contains=cCustomStructKey
syn match cCustomStructName "\<union\_s\+\w\+\>" contains=cCustomStructKey
hi def link cCustomStructName Type
