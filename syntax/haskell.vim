if exists('b:current_syntax')
  finish
endif

" Keywords
syn keyword HaskelmConditional case else if of then do forall undefined
syn keyword HaskelmTypedef type data newtype let in where deriving instance class infixl infixr
syn keyword HaskelmImport as import module qualified hiding

" Operators
syn match HaskelmOperator "\([-!#$%&\*\+./<=>\?@\\^|~:]\|\<_\>\)"

" Types
syn match HaskelmType "\<[A-Z][0-9A-Za-z_'-]*"
syn keyword HaskelmNumberType number

" Delimiters
syn match HaskelmDelimiter  "[,;]"
syn match HaskelmBraces  "[()[\]{}]"

" Functions
syn match HaskelmTupleFunction "\((,\+)\)"
syn match HaskelmInfixFun "`[a-zA-Z0-9.]\+`"

" Comments
syn keyword HaskelmTodo TODO FIXME XXX contained
syn match HaskelmLineComment "--.*" contains=HaskelmTodo,@spell
syn region HaskelmComment matchgroup=HaskelmComment start="{-|\=" end="-}" contains=HaskelmTodo,HaskelmComment,@spell

" Strings
syn match HaskelmStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match HaskelmStringEscape "\\[nrfvbt\\\"]" contained
syn region HaskelmString start="\"" skip="\\\"" end="\"" contains=HaskelmStringEscape,@spell
syn match HaskelmChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"

" Numbers
syn match HaskelmInt "-\?\<\d\+\>\|0[xX][0-9a-fA-F]\+\>"
syn match HaskelmFloat "\(\<\d\+\.\d\+\>\)"

" Identifiers
syn region HaskelmRecord matchgroup=HaskelmRecord start="{[^-]" end="[^-]}" contains=ALL contained
syn match HaskelmTopLevelDecl "^\s*[a-zA-Z][a-zA-z0-9_]*\('\)*\_s\+::\s\+" contains=HaskelmOperator
syn match HaskelmTopLevelBinding "^\s*\(let \)\?\zs[a-zA-Z][a-zA-z0-9_]*\('\)*\ze\([^{]*\|.*{[^}]*}.*\)[^-!#$%&\*\+./<=>\?@\\^|~:]=\([^-!#$%&\*\+./<=>\?@\\^|~:]\|$\)" contains=HaskelmRecord

hi def link HaskelmInfixFun Operator
hi def link HaskelmRecord Error
hi def link HaskelmTopLevelDecl Function
hi def link HaskelmTopLevelBinding Function
hi def link HaskelmTupleFunction Normal
hi def link HaskelmTodo Todo
hi def link HaskelmComment Comment
hi def link HaskelmLineComment Comment
hi def link HaskelmString String
hi def link HaskelmQuasiQuote String
hi def link HaskelmChar String
hi def link HaskelmStringEscape Special
hi def link HaskelmInt Number
hi def link HaskelmFloat Float
hi def link HaskelmDelimiter Delimiter
hi def link HaskelmBraces Delimiter
hi def link HaskelmTypedef TypeDef
hi def link HaskelmImport Include
hi def link HaskelmConditional Conditional
hi def link HaskelmOperator Operator
hi def link HaskelmType Identifier
hi def link HaskelmNumberType Identifier

syn sync minlines=500

let b:current_syntax = 'Haskell'
