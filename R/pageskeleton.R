#' @importFrom shiny tagList bootstrapLib
page_skeleton <- function(...){
  tagList(
    bootstrapLib(),
    dreal_dependency(),
    input_binding(),
    icons_binding(),
    tagList(
      ...
    ),
    script_footer()
  )
}
