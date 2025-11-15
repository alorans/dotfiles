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

((block_comment) @comment @spell)
