" Language:     Gluon
" Maintainer:   Daniel Collette
" URL:          https://github.com/salpalvv/vim-gluon
" LICENSE:      MIT

if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword gluonConditional    match if else with then
syn keyword gluonTypeDef        type
syn keyword gluonKeyword        do let in and forall
syn keyword gluonBoolean        True False
syn keyword gluonTodo contained TODO FIXME NOTE

hi def link gluonConditional    Conditional
hi def link gluonTypeDef        Identifier
hi def link gluonKeyword        Keyword
hi def link gluonBoolean        Boolean
hi def link gluonTodo           Todo

syn match gluonMacro            "\w\+!"

hi def link gluonMacro          Macro

syn match gluonType             "\<[A-Z][A-Za-z_0-9]*\>"

hi def link gluonType           Type

syn match gluonEscape           display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match gluonStringContinuation display contained /\\\n\s*/
syn match gluonShebang          /\%^#![^[].*/
syn match gluonOperator        "[!#$%&\*+-./<=>?@\\^|-~:]\+"

hi def link gluonShebang        Comment
hi def link gluonOperator       Operator

syn match gluonSeparator        "|"
syn region gluonParens          matchgroup=gluonDelimiter start="(" end=")" transparent
syn region gluonBrackets        matchgroup=gluonDelimiter start="\[" end="]" transparent
syn region gluonBlock           matchgroup=gluonDelimiter start="{" end="}" transparent

hi def link gluonSeparator      Delimiter
hi def link gluonDelimiter      Delimiter

" Numbers
syntax match gluonNumber        "\v<\d+>"
syntax match gluonNumber        "\v<\d+\.\d+>"
syntax match gluonNumber        "\v<\d*\.?\d+([Ee]-?)?\d+>"
syntax match gluonNumber        "\v<0x\x+([Pp]-?)?\x+>"
syntax match gluonNumber        "\v<0b[01]+>"
syntax match gluonNumber        "\v<0o\o+>"

hi def link Integer             Number
hi def link gluonNumber         Number

" Characters
syn match   gluonCharacterInvalid   display contained /b\?'\zs[\n\r\t']\ze'/
" The groups negated here add up to 0-255 but nothing else (they do not seem to go beyond ASCII).
syn match   gluonCharacterInvalidUnicode   display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match   gluonCharacter   /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=gluonEscape,gluonEscapeError,gluonCharacterInvalid,gluonCharacterInvalidUnicode
syn match   gluonCharacter   /'\([^\\]\|\\\(.\|x\x\{2}\|u{\%(\x_*\)\{1,6}}\)\)'/ contains=gluonEscape,gluonEscapeUnicode,gluonEscapeError,gluonCharacterInvalid

" Strings
syn match     gluonEscapeError   display contained /\\./
syn match     gluonEscape        display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match     gluonEscapeUnicode display contained /\\u{\%(\x_*\)\{1,6}}/
syn match     gluonStringContinuation display contained /\\\n\s*/
syn region gluonString          start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gluonEscape,gluonEscapeUnicode,gluonEscapeError,gluonStringContinuation,@Spell
syn region gluonString start='b\?r\z(#*\)"' end='"\z1' contains=@Spell

hi def link gluonStringContinuation Special
hi def link gluonString String

hi def link gluonCharacterInvalid Error
hi def link gluonCharacterInvalidUnicode gluonCharacterInvalid
hi def link gluonCharacter Character

" Comments
syn region gluonCommentLine     start="//" end="$" contains=gluonTodo,@Spell
syn region gluonCommentLine     start="/\*" end="\*/" contains=gluonTodo,@Spell

hi def link gluonCommentLine    Comment

