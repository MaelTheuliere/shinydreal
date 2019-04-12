dr_square_nav <- function(
  id_left, 
  id_right,
  text_left = "Précédent", 
  text_right = "Suivant",
  value = 0
) {
  
  tags$div(
    tags$button(

      class="btn btn-secondary btn-icon btn-icon-left",
      tags$span(
        id = id_left,
        class = "navigation text",
        text_left,
        `data-value` = as.character(value)
      )
    ),
    tags$button(

      class="btn btn-secondary btn-icon btn-icon-right",
      tags$span(
        id = id_right,
        class = "navigation text",
        text_right,
        `data-value` = as.character(value)
      )
    )
  )

  # tags$div(
  #   class="circle-nav",
  #   tags$a(
  #     class="nav-item",
  #     tags$i(id = id_left,
  #            class = "fleche icon la la-angle-left",
  #            #type = "button",
  #            `data-value` = as.character(value)
  #     )
  #   ), 
  #   tags$a(
  #     class="nav-item",
  #     tags$i(id = id_right,
  #            class = "fleche icon la la-angle-right",
  #            #type = "button",
  #            `data-value` = as.character(value)
  #     )
  #   )
  #   
  # )
}
