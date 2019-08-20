#' R Markdown Format for Flexible Dashboards with dreal template
#' 
#' @param ... parameters of \code{\link[flexdashboard]{flex_dashboard}}
#' @param offline Logical. 
#' @importFrom rmarkdown includes
#' 
#' @export
html_flexdash <- function(..., offline = FALSE) {
  
  # get the locations of resource files located within the package
  css <- c(
    system.file("css/uikit_Lato_Roboto.css", package = "shinydreal"),
    system.file("css/dashboard.css", package = "shinydreal"),
    system.file("css/flexdashboard.css", package = "shinydreal")
  )
  
  if (isTRUE(offline)) {
    # call the base html_document function
    flexdashboard::flex_dashboard(
      css = css,
      theme = "bootstrap",
      ...
    )
  } else {
    header <- system.file("css/in_header.html", package = "shinydreal")
    # call the base html_document function
    flexdashboard::flex_dashboard(
      css = css,
      theme = "bootstrap",
      includes = includes(before_body = header), 
      ...
    )
  }
}
