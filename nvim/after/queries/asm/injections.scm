; extends

((line_comment) @injection.content
  (#not-lua-match? @injection.content "^#")
  (#set! injection.language "comment"))

((block_comment) @injection.content
  (#set! injection.language "comment"))
