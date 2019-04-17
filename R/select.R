dr_selectInput <- function(
  inputId, 
  label, 
  choices
){
  tags$div(
    class = "control-select",
    tags$label(label), 
    tags$select(
      lapply(
        choices, function(x){
          tags$option(
            value = x, 
            x
          )
        }
      )
    )
  )

}