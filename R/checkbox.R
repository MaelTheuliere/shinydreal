dr_checkbox <- function(
  inputId, 
  label = NULL, 
  choices, 
  selected = NULL,
  choiceNames = NULL, 
  type = c("primary", "secondary")
) {
  type <- match.arg(type)
  if (is.null(choiceNames)){
    choiceNames <- choices
  }
  if (is.null(selected)){
    selected <- NA
  }
  label_class <- "custom-control custom-checkbox"
  if (type == "primary"){
    label_class <- sprintf("%s custom-solid-checkbox", label_class)
  }
  tagList(
    tags$label(label),
    tags$div(
      id = inputId,
      class = "custom-control-parent-checkbox",
      mapply(function(choices, choiceNames, selected){
        tags$div(
          class = "custom-control-child mb-2",
          tags$label(
            `data-name` = choiceNames,
            class = ifelse(
              choiceNames %in% selected,
              sprintf("%s checked", label_class),
              label_class
            ),
            if (choiceNames %in% selected){
              HTML('<input type="checkbox" class="custom-control-input" checked>')
            } else {
              tags$input(
                type = "checkbox",
                class = "custom-control-input"
              )
            },
            tags$span(
              class = "custom-control-indicator"
            ),
            tags$span(
              class = "custom-control-description",
              choices
            )
          )
        )
      }, choices, choiceNames, selected, SIMPLIFY = FALSE)
    )
  )
}