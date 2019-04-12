dr_progress <- function(
  inputId,
  style = c("primary", "secondary"),
  value = 25
){
  style <- match.arg(style)
  tags$div(
    class = "progress mb-3",
    tags$div(
      id = inputId,
      class= glue::glue("progressBar progress-bar bg-{style}"),
      role="progressbar",
      style = glue::glue("width: {value}%"),
      `aria-valuenow`= as.character(value),
      `aria-valuemin`= as.character(0),
      `aria-valuemax`= as.character(100)
    )
  )
}

# Send an update message to a URL input on the client.
# This update message can change the value and/or label.
update_dr_progress <- function(
  session, 
  inputId,
  value
) {
  session$sendInputMessage(inputId, message = list(value = value))
}

