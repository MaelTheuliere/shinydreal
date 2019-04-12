#' @import htmltools
#' @import shiny
dr_fluidPage <- function(...){
  shiny::tagList(
    shiny::bootstrapLib(),
    dreal_dependency(),
    input_binding(),
    tags$div(
      class="container-fluid",
      tagList(
        ...
      )
    ),
    script_footer()
  )
}
