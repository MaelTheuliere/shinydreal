dr_blockquote <- function(..., footer = NULL){
  tags$blockquote(
    class="blockquote mb-4",
    ...,
    tags$footer(footer)
  )
}

dr_ul <- function(...){
  tags$ul(
    class = "list",
    ...
  )
}

