; Comment-tagged template literal injections: /*html*/`...`, /*css*/`...`, etc.
(
  (comment) @_comment
  .
  (template_string) @injection.content
  (#lua-match? @_comment "^/%*%s*[hH][tT][mM][lL]%s*%*/$")
  (#set! injection.language "html")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
)

(
  (comment) @_comment
  .
  (template_string) @injection.content
  (#lua-match? @_comment "^/%*%s*[cC][sS][sS]%s*%*/$")
  (#set! injection.language "css")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
)

(
  (comment) @_comment
  .
  (template_string) @injection.content
  (#lua-match? @_comment "^/%*%s*[sS][qQ][lL]%s*%*/$")
  (#set! injection.language "sql")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
)

(
  (comment) @_comment
  .
  (template_string) @injection.content
  (#lua-match? @_comment "^/%*%s*[mM][dD]%s*%*/$")
  (#set! injection.language "markdown")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
)

