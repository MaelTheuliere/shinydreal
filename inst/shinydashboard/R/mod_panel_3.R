# Module UI
  
#' @title   mod_panel_3_ui and mod_panel_3_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_panel_3
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_panel_3_ui <- function(id){
  ns <- NS(id)
  tagList(
    dr_row(
      dr_col_12(
        h2("Pleins de trucs à raconter !"), 
        dr_col_6(
          h3("Des trucs et d'autres trucs :"),
          tags$div(
            class = "outertext", 
            tags$div(
              class = "innertext", 
              h4(shinipsum::random_text(
                sample(c(10:20), 1)
              )),
              tags$p(shinipsum::random_text(
                sample(c(10:100), 1)
              )), 
              h5(shinipsum::random_text(
                sample(c(10:20), 1)
              )),
              tags$p(shinipsum::random_text(
                sample(c(10:600), 1)
              )), 
              h6(shinipsum::random_text(
                sample(c(10:20), 1)
              )),
              tags$p(shinipsum::random_text(
                sample(c(50:500), 1)
              ))
            )
          )
          , 
          dr_blockquote("Une citation de quelqu'un", footer = "Colin"), 
          dr_square_nav(
            ns("gauchesq"), 
            ns("droitesq")
          )
        ), 
        dr_col_6(
          plotOutput(ns("plot")), 
          dr_arrow_nav(
            ns("gauchear"), 
            ns("droitear")
          )
        )
      )
    )
  )
}
    
# Module Server
    
#' @rdname mod_panel_3
#' @export
#' @keywords internal
    
mod_panel_3_server <- function(input, output, session){
  ns <- session$ns
  
  observe({
    input$gauchesq
    input$droitesq
    
    removeUI(
      ".innertext"
    )
    
    insertUI(
      ".outertext", 
      ui = tags$div(
        class = "innertext", 
        h4(shinipsum::random_text(
          sample(c(10:20), 1)
        )),
        tags$p(shinipsum::random_text(
          sample(c(10:100), 1)
        )), 
        h5(shinipsum::random_text(
          sample(c(10:20), 1)
        )),
        tags$p(shinipsum::random_text(
          sample(c(10:600), 1)
        )), 
        h6(shinipsum::random_text(
          sample(c(10:20), 1)
        )),
        tags$p(shinipsum::random_text(
          sample(c(50:500), 1)
        ))
      )
    )
    
  })
  
  plot <- reactiveValues(
    a = shinipsum::random_ggplot("boxplot"),
    b = shinipsum::random_ggplot("line"),
    c = shinipsum::random_ggplot("point"),
    d = shinipsum::random_ggplot("col")
  )
  
  index <- reactiveValues(
    i = 1
  )
  
  observeEvent( input$gauchear , {
    if (index$i == 1) {
      index$i <- length(plot)
    } else {
      index$i <- index$i - 1 
    }
  })
  observeEvent( input$droitear , {
    if (index$i == length(plot)) {
      index$i <- 1
    } else {
      index$i <- index$i + 1 
    }
  })
  
  output$plot <- renderPlot({
    plot[[ names(plot)[index$i] ]]
  })
}

 
