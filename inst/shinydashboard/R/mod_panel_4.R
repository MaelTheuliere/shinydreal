# Module UI
  
#' @title   mod_panel_4_ui and mod_panel_4_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_panel_4
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_panel_4_ui <- function(id){
  ns <- NS(id)
  tagList(
    dr_row(
      dr_col_12(
        h2("Wow, un slider !"),
        dr_sliderInput(ns("slide"), 10, 20, 15),

        tags$div(
          tags$strong("Qui fait changer le nombre de lignes du tableau !"),
          align = "center",
          dr_tableOutput(ns("dt"), "striped")
        ), 
        dr_blockquote("Excellent !", footer = "Colin")
      )
      
    )
  )
}
    
# Module Server
    
#' @rdname mod_panel_4
#' @export
#' @keywords internal
    
mod_panel_4_server <- function(input, output, session){
  ns <- session$ns
  
  output$dt <- renderTable({
    head(iris, input$slide)
  })
}

 
