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
          tags$pre('dr_blockquote("Une citation", footer = "Colin")'),
          dr_blockquote("Une citation", footer = "Colin"),
          h2("Une liste dreal : "),
          tags$pre('dr_ul(
            tags$li("Am"),
            tags$li("Stram"), 
            tags$li("Gram")
          )'),
          dr_ul(
            tags$li("Am"),
            tags$li("Stram"), 
            tags$li("Gram")
          ),
          h2("Une liste classique : "),
          tags$pre('tags$ul(
            tags$li("Am"),
            tags$li("Stram"), 
            tags$li("Gram")
          )'),
          tags$ul(
            tags$li("Am"),
            tags$li("Stram"), 
            tags$li("Gram")
          ),
          hr()
        ), 
        
        dr_col_12(
          h1("Tableaux"),
          h2("Un tableau au format 'striped'"),
          tags$pre('dr_tableOutput(ns("dtstriped"), "striped")'),
          dr_tableOutput(ns("dtstriped"), "striped"), 
          h2("Un tableau au format 'bordered'"),
          tags$pre('dr_tableOutput(ns("dtbordered"), "bordered")'),
          dr_tableOutput(ns("dtbordered"), "bordered"), 
          h2("Un tableau classique"),
          tags$pre('tableOutput(ns("dtclassic"))'),
          tableOutput(ns("dtclassic")), 
          hr()
        ), 
        dr_col_12(
          h1("Boutons"),
          dr_col_6(
            h2("Bouton de type dr_sm_actionButton"),
            dr_row(
              tags$pre('dr_sm_actionButton("go1", \'type = "primary"\', type = "primary")'),
              dr_sm_actionButton("go1", 'type = "primary"', type = "primary"),
              dr_sm_actionButton("go2", 'type = "secondary"', type = "secondary"),
              dr_sm_actionButton("go3", 'type = "info"', type = "info")
            )
          ), 
          dr_col_6(
            h2("Bouton de type dr_actionButton"),
            dr_row(
              tags$pre('dr_actionButton("go4", \'type = "primary"\', type = "primary")'),
              dr_actionButton("go4", 'type = "primary"', type = "primary"),
              dr_actionButton("go5", 'type = "secondary"', type = "secondary"),
              dr_actionButton("go6", 'type = "info"', type = "info")
            )
          )
        ),
        dr_col_12(
          dr_col_6(
            h2("Bouton de type dr_lg_actionButton"),
            dr_row(
              tags$pre('dr_lg_actionButton("go7", \'type = "primary"\', type = "primary"),'),
              dr_lg_actionButton("go7", 'type = "primary"', type = "primary"),
              dr_lg_actionButton("go8", 'type = "secondary"', type = "secondary"),
              dr_lg_actionButton("go9", 'type = "info"', type = "info")
            )
          ),
          dr_col_6(
            h2("Bouton actionButton classique"),
            dr_row(
              tags$pre('actionButton("acbuttondb", label = "actionButton", class = "btn-primary")'),
              actionButton("acbuttondb", label = "actionButton primary", class = "btn-primary"),
              actionButton("acbuttondb", label = "actionButton secondary", class = "btn-secondary"),
              actionButton("acbuttondb", label = "actionButton info", class = "btn-info")
            )
          )
        ), 
        h2("Flèches"), 
        dr_col_6(
          h3("rondes"),
          tags$pre('dr_arrow_nav(
            "left", 
            "right"
          )'),
          dr_arrow_nav(
            "left", 
            "right"
          )
        ),
        dr_col_6(
          h3("rectangles"), 
          tags$pre('dr_square_nav(
            "left", 
            "right"
          )'),
          dr_square_nav(
            "left", 
            "right"
          )
        ),
        column(
          width = 12,
          h2("Switch"),
          tags$pre('dr_onOff(ns("switch"))'),
          dr_onOff(ns("switch"))
        ),
        column(
          width = 12,
          h1("Slider"),
          column(
            width = 6,
            h2("Slider Dreal"),
            tags$pre('dr_sliderInput(ns("slide"), 10, 20, 15)'),
            dr_sliderInput(ns("slide"), 10, 20, 15)
          ),
          column(
            width = 6,
            h2("Slider Classique"),
            tags$pre('sliderInput(ns("obsdb"), "sliderInput", 10, 20, 15)'),
            sliderInput(ns("obsdb"), "sliderInput", 10, 20, 15)
          )
        ),
        column(
          width = 12,
          h1("Barres de progression"),
          column(
            width = 6,
            tags$pre('dr_progress(ns("gauche"), value = 25)'),
            dr_progress(ns("gauche"), value = 25)
          ),
          dr_col_6(
            tags$pre('dr_progress(ns("droite"), "secondary", value = 50)'),
            dr_progress(ns("droite"), "secondary", value = 50)
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
  
  output$dtclassic <- renderTable({
    shinipsum::random_table(3, 5)
  })
  
}



