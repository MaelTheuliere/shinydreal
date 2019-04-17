dr_onOff <- function(
  inputId
){
  tags$div(
    class = "switch-toggle switch-toggle-lg",
    tags$label(
      `for` = "switch-toggle-lg",
      class="switch-toggle-body", 
      tags$input(
        type="checkbox", 
        id="switch-toggle-lg", 
        class="switch-toggle-input"
      ), 
      tags$div(
        id = inputId,
        `data-value` = 0,
        class="switch-toggle-switch"
      )
    ) 
  )
}

dr_sq_onOff <- function(
  inputId
){
  tags$div(
    class = "checkbox-toggle checkbox-toggle-lg",
    tags$input(
      type="checkbox", 
      id="checkbox-toggle-lg"
    ),
    tags$label(
      `for` = "checkbox-toggle-lg",
      tags$div(
        id = inputId,
        `data-value` = 0,
        class="checkbox-toggle-switch", 
        `data-checked`="On",
        `data-unchecked`="Off"
      )
    ) 
  )
}
