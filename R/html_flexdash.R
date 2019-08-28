#' R Markdown Format for Flexible Dashboards with dreal template
#' 
#' @param css_dir directory relative to Rmd where css is saved
#' @param ... parameters of \code{\link[flexdashboard]{flex_dashboard}}
#' @param offline Logical. 
#' 
#' @importFrom rmarkdown includes
#' 
#' @export
html_flexdash <- function(..., css_dir = "libs", offline = FALSE) {
  
  # get the locations of resource files located within the package
  css <- c(
    system.file("css/uikit_Lato_Roboto.css", package = "shinydreal"),
    system.file("css/dashboard.css", package = "shinydreal"),
    system.file("css/flexdashboard.css", package = "shinydreal")
  )
  css_names <- file.path(css_dir, basename(css))
  if (!dir.exists(css_dir)) {dir.create(css_dir)}
  for (i in seq_along(css)) {
    file.copy(css[i], css_names[i], overwrite = TRUE)
  }
  
  if (isTRUE(offline)) {
    # call the base html_document function
    flexdashboard::flex_dashboard(
      css = css_names,
      theme = "bootstrap",
      ...
    )
  } else {
    header <- system.file("css/in_header.html", package = "shinydreal")
    # call the base html_document function
    flexdashboard::flex_dashboard(
      css = css_names,
      theme = "bootstrap",
      includes = includes(before_body = header), 
      ...
    )
  }
}
