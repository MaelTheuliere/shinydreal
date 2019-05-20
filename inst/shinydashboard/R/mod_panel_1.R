# Module UI
  
#' @title   mod_panel_1_ui and mod_panel_1_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_panel_1
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_panel_1_ui <- function(id){
  ns <- NS(id)
  tagList(
    dr_row(
      dr_col_6(
        h2("Un super tableau"),
        dr_tableOutput(ns("dt"), "striped"), 
        dr_blockquote("Une tableau qu'il est beau !", footer = "Colin")
      ),
      dr_col_6(
        h2("Un super tableau"),
        dr_tableOutput(ns("dt2"), "bordered"), 
        dr_blockquote("Encore mieux !", footer = "Colin")
      )

    )
  )
}
    
# Module Server
    
#' @rdname mod_panel_1
#' @export
#' @keywords internal
    
mod_panel_1_server <- function(input, output, session){
  ns <- session$ns
  
  output$dt <- renderTable({
    shinipsum::random_table(10, 5)
  })
  output$dt2 <- renderTable({
    shinipsum::random_table(10, 5)
  })
}
    

