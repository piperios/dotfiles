" ==============================================================================
" Vim syntax file
" Language:        C++ (Standard library including C++11/14/17/20)
" Original Author: Jon Haggblad <https://github.com/octol>
" Maintainer:      bfrg <https://github.com/bfrg>
" Website:         https://github.com/bfrg/vim-cpp-modern
" Last Change:     Nov 23, 2020
"
" This syntax file is based on:
" https://github.com/octol/vim-cpp-enhanced-highlight
" ==============================================================================

syn clear cppStructure
syn match cCustomClassKey "\<class\>"
syn match cCustomClassKey "\<typename\>"
syn match cCustomClassKey "\<template\>"
syn match cCustomClassKey "\<namespace\>"
hi def link cCustomClassKey cppStructure

" Match the parts of a class declaration
syn match cCustomClassName "\<class\_s\+\w\+\>"
      \ contains=cCustomClasskey
syn match cCustomClassName "\<enum\_s\+class\_s\+\w\+\>"
      \ contains=cCustomClasskey
hi def link cCustomClassName Statement

" Standard library {{{1
syntax keyword cppSTLdefine
        \ MB_CUR_MAX MB_LEN_MAX WCHAR_MAX WCHAR_MIN WEOF __STDC_UTF_16__ __STDC_UTF_32__

syntax keyword cppSTLnamespace
        \ std experimental rel_ops

syntax keyword cppSTLvariable
        \ cerr cin clog cout wcerr wcin wclog wcout nothrow

syntax keyword cppSTLios
        \ endl

" C++11 extensions {{{1
if !exists('cpp_no_cpp11')
    syntax keyword cppType       char16_t char32_t
    syntax keyword cppModifier   override final
    syntax keyword cppType       nullptr_t string
    syntax keyword cppExceptions noexcept
    syntax keyword cppConstant   constexpr decltype thread_local
    syntax keyword cppConstant   nullptr
    syntax keyword cppStatement  auto

    syntax keyword cppSTLnamespace chrono this_thread

    syntax keyword cppSTLtypedef
            \ atomic_char16_t atomic_char32_t atomic_int_fast16_t atomic_int_fast32_t atomic_int_fast64_t atomic_int_fast8_t atomic_int_least16_t atomic_int_least32_t atomic_int_least64_t atomic_int_least8_t atomic_intmax_t atomic_intptr_t atomic_ptrdiff_t atomic_size_t atomic_uint_fast16_t atomic_uint_fast32_t atomic_uint_fast64_t atomic_uint_fast8_t atomic_uint_least16_t atomic_uint_least32_t atomic_uint_least64_t atomic_uint_least8_t atomic_uintmax_t atomic_uintptr_t atomic_wchar_t max_align_t allocator_arg_t adopt_lock_t defer_lock_t try_to_lock_t piecewise_construct_t

    " Note: ignore is also a function
    syntax match cppSTLvariable "\<ignore\>(\@!"
endif


" C++14 extensions {{{1
if !exists('cpp_no_cpp14')
    syntax keyword cppSTLfunction make_unique

    syntax keyword cppSTLtypedef
            \ tuple_element_t add_const_t add_cv_t add_lvalue_reference_t add_pointer_t add_rvalue_reference_t add_volatile_t aligned_storage_t aligned_union_t common_type_t conditional_t decay_t enable_if_t make_signed_t make_unsigned_t remove_all_extents_t remove_const_t remove_cv_t remove_extent_t remove_pointer_t remove_reference_t remove_volatile_t result_of_t underlying_type_t
endif


" C++17 extensions {{{1
if !exists('cpp_no_cpp17')
    syntax keyword cppSTLtypedef
            \ invoke_result_t default_order_t nullopt_t void_t in_place_t in_place_type_t in_place_index_t variant_alternative_t

    " Note: There is std::filesystem::path::format and std::format() in <format>
    syntax match cppSTLenum "\<format\>(\@!"

    " Note: these can be both member objects and methods
    syntax match cppSTLvariable "\<\%(capacity\|free\|available\)\>(\@!"

    " Note: these keywords are very likely to coincide with user-defined variables
    " syntax keyword cppSTLconstant
    "         \ all mask unknown replace add remove nofollow none not_found regular directory symlink block character fifo socket unknown
endif


" C++20 extensions {{{1
if !exists('cpp_no_cpp20')
    syntax keyword cppSTLnamespace ranges views
    syntax keyword cppSTLconstant dynamic_extent
    syntax keyword cppSTLvariable default_sentinel unreachable_sentinel

    syntax keyword cppSTLtypedef
            \ common_comparison_category_t remove_cvref_t unwrap_reference_t unwrap_ref_decay_t common_reference_t iterator_t sentinel_t safe_iterator_t safe_subrange_t compare_three_way_result_t iter_value_t iter_reference_t iter_difference_t iter_rvalue_reference_t iter_common_reference_t default_sentinel_t unreachable_sentinel_t indirect_result_t type_identity_t

    syntax keyword cppSTLfunction
            \ import module

endif


" Boost {{{1
if !exists('cpp_no_boost')
    syntax keyword cppSTLnamespace boost
    syntax keyword cppSTLfunction lexical_cast
endif
" }}}


" Default highlighting
hi def link cppSTLbool         Boolean
hi def link cppStatement       Statement
hi def link cppSTLfunction     Function
hi def link cppSTLdefine       Constant
hi def link cppSTLconstant     Constant
hi def link cppSTLnamespace    Constant
hi def link cppSTLexception    Type
hi def link cppSTLiterator     Type
hi def link cppSTLtype         Type
hi def link cppSTLtypedef      Typedef
hi def link cppSTLenum         Typedef
hi def link cppSTLios          Function
hi def link cppSTLconcept      Typedef
hi def link cppSTLvariable     Identifier

" The keywords {inline, virtual, explicit, export, override, final} are
" standard C++ keywords and NOT types!
hi! def link cppModifier Statement


" Highlight all standard C++ keywords as Statement
if get(g:, 'cpp_simple_highlight', 0)
    hi! def link cppStructure    Statement
    hi! def link cppExceptions   Statement
    hi! def link cppStorageClass Statement
endif
