# Module UI

#' @title   mod_panel_resume_ui and mod_panel_resume_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_panel_resume
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_panel_resume_ui <- function(id){
  ns <- NS(id)
  tagList(
    tagList(
      dr_row(
        dr_col_12(
          h1("Un titre de niveau 1"),
          h2("Un titre de niveau 2"),
          h3("Un titre de niveau 3"),
          h4("Un titre de niveau 4"),
          h5("Un titre de niveau 5"),
          h6("Un titre de niveau 6"), 
          dr_blockquote("Une citation", footer = "Colin"),
          tags$p("Une liste : "),
          dr_ul(
            tags$li("Am"),
            tags$li("Stram"), 
            tags$li("Gram")
          ),
          hr()
        ), 
        
        dr_col_12(
          h1("Tableaux"),
          h2("Un tableau au format 'striped'"),
          dr_tableOutput(ns("dtstriped"), "striped"), 
          h2("Un tableau au format 'bordered'"),
          dr_tableOutput(ns("dtbordered"), "bordered"), 
          hr()
        ), 
        dr_col_12(
          h1("Boutons"),
          dr_col_4(
            h2("Boutton de type dr_sm_actionButton"),
            dr_row(
              dr_sm_actionButton("go1", 'type = "primary"', type = "primary"),
              dr_sm_actionButton("go2", 'type = "secondary"', type = "secondary"),
              dr_sm_actionButton("go3", 'type = "info"', type = "info")
            )
            
          ), 
          dr_col_4(
            h2("Boutton de type dr_actionButton"),
            dr_row(
              dr_actionButton("go4", 'type = "primary"', type = "primary"),
              dr_actionButton("go5", 'type = "secondary"', type = "secondary"),
              dr_actionButton("go6", 'type = "info"', type = "info")
            )
          ), 
          dr_col_4(
            h2("Boutton de type dr_lg_actionButton"),
            dr_row(
              dr_lg_actionButton("go7", 'type = "primary"', type = "primary"),
              dr_lg_actionButton("go8", 'type = "secondary"', type = "secondary"),
              dr_lg_actionButton("go9", 'type = "info"', type = "info")
            )
          )
        ), 
        dr_col_12(
          h2("Flêches"), 
          dr_arrow_nav(
            "left", 
            "right"
          )
        ),
        dr_col_12(
          h2("Flêches"), 
          dr_square_nav(
            "left", 
            "right"
          )
        )
      )
    )
  )
}

# Module Server

#' @rdname mod_panel_resume
#' @export
#' @keywords internal

mod_panel_resume_server <- function(input, output, session){
  ns <- session$ns
  
  output$dtstriped <- renderTable({
    shinipsum::random_table(3, 5)
  })
  
  output$dtbordered <- renderTable({
    shinipsum::random_table(3, 5)
  })
  
}



