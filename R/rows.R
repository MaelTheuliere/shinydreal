#' Élément de corps de page
#' 
#' `dr_panel` est un panel pour les navbarPage et le sidebarPage. 
#' `dr_row` crée une nouvelle ligne dans l'UI, `dr_col(width = X)` crée
#' une colonne de largeur X. `dr_col_*` 12, 6, 4 et 3 crééent des éléments
#' de largeur 12, 6, 4 et 3 respectivement. 
#'
#' @param id ID, pour le `dr_panel`
#' @param width largeur de la colonne, pour `dr_col`.
#' @param ... Élément à insérer
#' 
#' @return Une liste HTML.
#' @export
#' @importFrom htmltools tags
#' @rdname bodyelements
#' 
dr_panel <- function(id, ...){
  tags$div(
    id = id,
    class = "panel",
    ...
  )
}
#' @export
#' @importFrom htmltools tags
#' @rdname bodyelements
dr_row <- function(...){
  tags$div(
    class = "row",
    ...
  )
}
#' @export
#' @importFrom htmltools tags
#' @rdname bodyelements
dr_col <- function( width,...){
  tags$div(
    class = sprintf("col-lg-%s", width),
    ...
  )
}
#' @export
#' @importFrom htmltools tags
#' @rdname bodyelements
dr_col_12 <- function(...){
  dr_col(
    width = 12, 
    ...
  )
}
#' @export
#' @importFrom htmltools tags
#' @rdname bodyelements
dr_col_6 <- function(...){
  dr_col(
    width = 6, 
    ...
  )
}
#' @export
#' @importFrom htmltools tags
#' @rdname bodyelements
dr_col_4 <- function( ...){
  dr_col(
    width = 4, 
    ...
  )
}
#' @export
#' @importFrom htmltools tags
#' @rdname bodyelements
dr_col_3 <- function( ...){
  dr_col(
    width = 3, 
    ...
  )
}