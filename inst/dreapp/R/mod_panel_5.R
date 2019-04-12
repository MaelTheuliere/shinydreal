# Module UI

#' @title   mod_panel_5_ui and mod_panel_5_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_panel_5
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_panel_5_ui <- function(id){
  ns <- NS(id)
  tagList(
    dr_row(
      dr_col_12(
        h2("Une barre de progression qu'elle est belle"),
        dr_progress(ns("gauche"), value = 0), 
        dr_col_3(
          dr_actionButton(ns("go2"), emo::ji("strong"))
        ), 
        dr_col_3(
          dr_actionButton(ns("go3"), emo::ji("metal"))
        ), 
        dr_col_3(
          dr_actionButton(ns("go4"), emo::ji("bomb"))
        ), 
        dr_col_3(
          dr_actionButton(ns("go5"), emo::ji("dance"))
        )
      ), 
      dr_col_12(
        h2("Une autre barre de progression qu'elle est belle"),
        dr_progress(ns("droite"), "secondary", value = 25), 
        tags$div(
          align = "center",
          dr_actionButton(ns("go1"), "Une seule fois", type ="info")
        )
      ), 
      dr_row(
        dr_col_12(
          h2("Les icones"),
          dr_col_6(
            h3("Taille paramétrable"),
            dr_sliderInput(
              ns("taille"), 1, 8, 4
            )
          ),
          dr_col_6(
            # dr_sliderInput(
            #   ns("taille", 1, 10, 5)
            # )
          ), 
          dr_col_12(
            uiOutput(ns("icons"))
          )
          
        )
      )
    )
  )
}

# Module Server

#' @rdname mod_panel_5
#' @export
#' @keywords internal

mod_panel_5_server <- function(input, output, session){
  ns <- session$ns
  observeEvent( input$go1 , {
    update_dr_progress(session, "droite", 75)
  })
  observeEvent( input$go2 , {
    update_dr_progress(session, "gauche",25)
  })
  observeEvent( input$go3 , {
    update_dr_progress(session, "gauche",50)
  })
  observeEvent( input$go4 , {
    update_dr_progress(session, "gauche",75)
  })
  observeEvent( input$go5 , {
    update_dr_progress(session, "gauche",100)
  })
  
  output$icons <- renderUI({
    lapply(dr_icon_list, function(x){
      dr_col(
        1, 
        dr_icons(x, size = input$taille)
      )
    })
  })
  
}

## To be copied in the UI
# 

## To be copied in the server
# 

