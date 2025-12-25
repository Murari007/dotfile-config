" Vim syntax file for MLIR (Modern Generic Version)
" Maintainer: Liz (ChatGPT), Updated: 2025
" Supports: ALL MLIR dialects, IREE IR, pass IR dumps, vm.*, hal.*, tensor.*, etc.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

"-----------------------------------------------------------
"  TYPES
"-----------------------------------------------------------

" Primitive builtin types
syn keyword mlirType index f16 f32 f64 bf16

" Signless/unsigned/signed integers
syn match mlirType /\<i\d\+\>/
syn match mlirType /\<si\d\+\>/
syn match mlirType /\<ui\d\+\>/

" Shaped types: memref<...>, tensor<...>, vector<...>
syn match mlirType /\<memref\ze\s*</
syn match mlirType /\<tensor\ze\s*</
syn match mlirType /\<vector\ze\s*</

" Element type inside shaped types
syn match mlirType /x\s*\zs\(bf16\|f16\|f32\|f64\|i\d\+\|si\d\+\|ui\d\+\)/

" Generic dialect types: !dialect.type<params>
syn match mlirTypeIdentifier /![a-zA-Z_][a-zA-Z0-9_.-]*/

"-----------------------------------------------------------
"  ATTRIBUTES
"-----------------------------------------------------------

" Attribute aliases and dialect attributes: #dialect.attr<...>
syn match mlirAttrIdentifier /#[a-zA-Z_][a-zA-Z0-9_.-]*/

" Numbers inside attributes
syn match mlirNumber /-\?\<\d\+\>/
syn match mlirFloat  /-\?\<\d\+\.\d*\(e[+-]\d\+\)\?\>/
syn match mlirFloat  /\<0x\x\+\>/

syn keyword mlirBoolean true false

"-----------------------------------------------------------
"  OPERATIONS
"-----------------------------------------------------------

" Builtin ops (rough baseline)
syn keyword mlirBuiltinOps func return module call addf addi subf subi mulf muli divf cmpf cmpi constant load store alloc alloca view subview splat select tanh log exp sqrt rsqrt

" Generic dialect-prefixed ops: dialect.op
" Example: vm.rodata, hal.executable.format, tensor.extract
syn match mlirOps /\<[a-zA-Z_][a-zA-Z0-9_]*\.[a-zA-Z0-9_]\+\>/

"-----------------------------------------------------------
"  IDENTIFIERS
"-----------------------------------------------------------

" SSA values and symbols: %val, @sym
syn match mlirIdentifier /[%@][a-zA-Z_.$-][a-zA-Z0-9_.$-]*/
syn match mlirIdentifier /[%@]\d\+/

" Block identifiers: ^bb
syn match mlirBlockIdentifier /\^[a-zA-Z_.$-][a-zA-Z0-9_.$-]*/
syn match mlirBlockIdentifier /\^\d\+/

" Labels with : at end
syn match mlirLabel /[-a-zA-Z_.$][-a-zA-Z0-9_.$]*:/

" Strings
syn region mlirString start=/"/ skip=/\\"/ end=/"/

" Comments
syn match mlirComment /\/\/.*$/

" Special IR dump markers (IREE, XLA)
syn match mlirSpecialComment /\/\/ -----.*----- .*$/

"-----------------------------------------------------------
"  SYNTAX HIGHLIGHT LINKS
"-----------------------------------------------------------

if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mlirType Type
  HiLink mlirTypeIdentifier Type
  HiLink mlirAttrIdentifier PreProc
  HiLink mlirOps Statement
  HiLink mlirBuiltinOps Statement
  HiLink mlirIdentifier Identifier
  HiLink mlirBlockIdentifier Label
  HiLink mlirLabel Label
  HiLink mlirNumber Number
  HiLink mlirFloat Float
  HiLink mlirString String
  HiLink mlirComment Comment
  HiLink mlirSpecialComment SpecialComment
  HiLink mlirBoolean Boolean

  delcommand HiLink
endif

let b:current_syntax = "mlir"

