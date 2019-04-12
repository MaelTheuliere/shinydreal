dr_tableOutput <- function(
  outputId, 
  style = c("striped", "bordered")
){
  style <- match.arg(style)
  x <- tableOutput(outputId)
  x$attribs$class <- paste(x$attribs$class, sprintf("table-%s", style))
  x
}