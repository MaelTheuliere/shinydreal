page_skeleton <- function(...){
  shiny::tagList(
    shiny::bootstrapLib(),
    dreal_dependency(),
    input_binding(),
    icons_binding(),
    tagList(
      ...
    ),
    script_footer()
  )
}
