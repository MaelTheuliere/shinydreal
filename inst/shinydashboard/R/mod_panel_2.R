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
      dr_col(
        8,
        h2("Un super graph"),
        plotOutput(ns("plot")), 
        dr_blockquote("Une graph qu'il est beau !", footer = "Colin")
      ), 
      dr_col_4(
        h4("En noir ?"),
        dr_onOff(ns("switch"))
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
  
  r <- reactiveValues()
  
  graph <- reactive({
    shinipsum::random_ggplot("point")
  })
  
  observeEvent(input$switch, {
    req(input$switch)
    if (input$switch == 1){
      r$theme <- ggplot2::theme_dark()
    } else {
      r$theme <- ggplot2::theme_minimal()
    }
  })
  
  output$plot <- renderPlot({
    graph() + r$theme
  })
}

