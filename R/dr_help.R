#' Ouvrir la page d'aide
#' @export
#' @importFrom utils browseURL
dr_help <- function() {
  guide_path <- system.file('docs/index.html', package = 'shinydreal')
  if (guide_path == "") {
    stop('There is no pkgdown site in ', 'docs/index.html')
  }
  
  browseURL(paste0('file://', guide_path))
}
