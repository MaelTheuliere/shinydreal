# Module UI

#' @title   mod_panel_comp_ui and mod_panel_comp_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_panel_comp
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_panel_comp_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(width = 6,
        h2("Un super tableau"),
        tags$pre(class = "r", tags$code('dr_tableOutput(ns("dt"), "striped")')),
        dr_tableOutput(ns("dt"), "striped"), 
        tags$pre(class = "r", tags$code('dr_blockquote("Une tableau qu\'il est beau !", footer = "Colin")')),
        dr_blockquote("Une tableau qu'il est beau !", footer = "Colin")
      ),
      column(width = 6,
        h2("Un super tableau"),
        dr_tableOutput(ns("dt2"), "bordered"), 
        dr_blockquote("Encore mieux !", footer = "Colin")
      )
      
    )
  )
}

# Module Server

#' @rdname mod_panel_comp
#' @export
#' @keywords internal

mod_panel_comp_server <- function(input, output, session){
  ns <- session$ns
  
  output$dt <- renderTable({
    shinipsum::random_table(10, 8)
  })
  output$dt2 <- renderTable({
    shinipsum::random_table(10, 8)
  })
}


