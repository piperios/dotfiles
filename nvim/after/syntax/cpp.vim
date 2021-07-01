" Class and namespace scope
syn match cCustomScope "::"
syn match cCustomClass "\w\+\s*::" contains=cCustomScope
hi cCustomClass ctermfg=6

syn clear cppStructure
syn keyword cppStructure typename

" Class name declaration
syn match cCustomClassKey "\<class\>"
syn match cCustomClassKey "\<enum class\>"
syn match cCustomClassKey "\<namespace\>"
syn match cCustomClassKey "\<template\>"
hi def link cCustomClassKey cppStructure

" Clear cppAccess entirely and redefine as matches
syn clear cppAccess
syn match cCustomAccessKey "\<private\>"
syn match cCustomAccessKey "\<public\>"
syn match cCustomAccessKey "\<protected\>"
hi def link cCustomAccessKey cppAccess

" Match the parts of a class declaration
syn match cCustomClassName "\<class\_s\+\w\+\>" contains=cCustomClassKey
syn match cCustomClassName "\<enum class\_s\+\w\+\>" contains=cCustomClassKey
syn match cCustomClassName "\<namespace\_s\+\w\+\>" contains=cCustomClassKey
syn match cCustomClassName "\<template\_s\+\w\+\>" contains=cCustomClassKey
syn match cCustomClassName "\<private\_s\+\w\+\>" contains=cCustomAccessKey
syn match cCustomClassName "\<public\_s\+\w\+\>" contains=cCustomAccessKey
syn match cCustomClassName "\<protected\_s\+\w\+\>" contains=cCustomAccessKey
hi def link cCustomClassName Type
