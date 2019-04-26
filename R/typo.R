#' Citation
#'
#' @param ... Contenu de la citation
#' @param footer Footer de la citation
#'
#' @return Un éléments Shiny de type blockquote.
#' @export
dr_blockquote <- function(..., footer = NULL){
  tags$blockquote(
    class="blockquote mb-4",
    ...,
    tags$footer(footer)
  )
}

#' Liste non ordonnées
#'
#' @param ... Éléments de liste avec tags$li
#'
#' @return Un éléments Shiny de type list.
#' @export
dr_ul <- function(...){
  tags$ul(
    class = "list",
    ...
  )
}

