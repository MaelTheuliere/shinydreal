#' @import htmltools
#' @import shiny
dr_fluidPage <- function(...){
  page_skeleton(
    tags$div(
      class="container-fluid",
      tagList(
        ...
      )
    ) 
  )
}
