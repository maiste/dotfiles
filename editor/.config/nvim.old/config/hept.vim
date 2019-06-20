if exists("b:current_syntax")
  finish
endif

syn match heptNumber '\v<\d+>' display
syn match heptNumber '[-+]\d\+\.\d*' display
syn match heptType   ':\s*\zs\w\+\ze' display

syn region heptBlock matchgroup=Operator start="let" end="tel" fold

syn keyword heptKW open fun var let tel returns node

let b:current_syntax = "hept"

hi def link heptNumber      Constant
hi def link heptKW          Statement
hi def link heptType        Type
