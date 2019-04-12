# Module UI
  
#' @title   mod_panel_2_ui and mod_panel_2_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_panel_2
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_panel_2_ui <- function(id){
  ns <- NS(id)
  tagList(
    dr_row(
      dr_col_12(
        h2("Un super graph"),
        plotOutput(ns("plot")), 
        dr_blockquote("Une graph qu'il est beau !", footer = "Colin")
      )
      
    )
  )
}
    
# Module Server
#' @rdname mod_panel_2
#' @export
#' @keywords internal
    
mod_panel_2_server <- function(input, output, session){
  ns <- session$ns
  
  output$plot <- renderPlot({
    shinipsum::random_ggplot("point")
  })
}

