; extends

; Highlight line comments that start with # as numbers
((line_comment) @number
  (#lua-match? @number "^#"))

; Highlight ERROR nodes that start with # as numbers (for #'0' style syntax)
((ERROR) @number
  (#lua-match? @number "^#"))

; Re-highlight non-# comments
((line_comment) @comment @spell
  (#not-lua-match? @comment "^#"))

; Fix highlighting of labels on lines like this
; message:  .ascii  "Hello, world!\n"
(instruction
  kind: (word) @label
  (ERROR) @_error
  (#lua-match? @_error "^:$"))

; Fix highlighting of directives
((meta_ident) @keyword.directive 
  (#lua-match? @keyword.directive "^%."))

((block_comment) @comment @spell)
