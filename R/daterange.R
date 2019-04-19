dr_dateRangeInput <- function(
  inputId, 
  label, 
  start = NULL, 
  end = NULL, 
  min = NULL, 
  max = NULL, 
  format = "yyyy-mm-dd", 
  startview = "month", 
  weekstart = 0, 
  language = "fr", 
  separator = " et ", 
  width = NULL, 
  autoclose = TRUE
){
  tags$div(
    class = "dr_dateRange", 
    dateRangeInput(
      inputId = inputId, 
      label = label, 
      start = start, 
      end = end, 
      min = min, 
      max = max, 
      format = format, 
      startview = startview, 
      weekstart = weekstart, 
      language = language, 
      separator = separator, 
      width = width, 
      autoclose = autoclose
    )
  )
}