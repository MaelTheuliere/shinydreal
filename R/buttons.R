dr_sm_actionButton <- function(
  inputId,
  label,
  icon = NULL,
  width = NULL,
  ...,
  type = c("primary", "secondary", "info")
){
  type <- match.arg(type)
  wrap_btn(
    shiny::actionButton(
      inputId = inputId,
      label = label,
      icon = icon,
      width = width,
      ...
    ),
    glue::glue("btn-{type} btn-sm")
  )
}

dr_actionButton <- function(
  inputId,
  label,
  icon = NULL,
  width = NULL,
  ...,
  type = c("primary", "secondary", "info")
){
  type <- match.arg(type)
  wrap_btn(
    shiny::actionButton(
      inputId = inputId,
      label = label,
      icon = icon,
      width = width,
      ...
    ),
    glue::glue("btn-{type}")
  )
}

dr_lg_actionButton <- function(
  inputId,
  label,
  icon = NULL,
  width = NULL,
  ...,
  type = c("primary", "secondary", "info")
){
  type <- match.arg(type)
  wrap_btn(
    shiny::actionButton(
      inputId = inputId,
      label = label,
      icon = icon,
      width = width,
      ...
    ),
    glue::glue("btn-{type} btn-lg")
  )
}

wrap_btn <- function(btn, class){
  btn$attribs$class <- paste(btn$attribs$class, class)
  btn
}



