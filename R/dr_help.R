#' Ouvrir la page d'aide
#' @export
#' @importFrom utils browseURL
dr_help <- function(){
  browseURL(
    system.file("docs", "index.html", package = "shinydreal")
  )
}
