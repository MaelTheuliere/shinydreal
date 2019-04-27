# To deploy, run: rsconnect::deployApp()

library(shinipsum)
options( "golem.app.prod" = TRUE)
lapply(
  list.files("inst/dreapp", full.names = TRUE, recursive = TRUE), 
  source
)

shinyApp(ui, server)

