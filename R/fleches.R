dr_arrow_nav <- function(
  id_left, 
  id_right, 
  value = 0
) {
  tags$div(
    class="circle-nav",
    tags$a(
      class="nav-item",
      tags$i(id = id_left,
             class = "fleche icon la la-angle-left",
             #type = "button",
             `data-value` = as.character(value)
      )
    ), 
    tags$a(
      class="nav-item",
      tags$i(id = id_right,
             class = "fleche icon la la-angle-right",
             #type = "button",
             `data-value` = as.character(value)
      )
    )
    
  )
  
}
