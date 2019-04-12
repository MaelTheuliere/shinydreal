dr_sliderInput <- function(
  inputId, 
  min, 
  max, 
  value
){
  tags$div(
    class = "slidecontainercontainer",
    tags$div(
      class = "slidecontainer", 
      tags$input(
        id = inputId, 
        type="range",
        class="slideranger",
        min = min, 
        max = max, 
        value = 7
      ), 
      tags$span(
        class="range min", 
        min
      ), 
      tags$span(
        class="range max", 
        max
      )
    )
  )

}