#' Exemple app
#' 
#' @param browse Logical. Whether to open code of the example ui
#' 
#' @export
app_dashboard <- function(browse = FALSE) {
  dash <- system.file("shinydashboard", package = "shinydreal")
  source(dash)
  if (isTRUE(browse)) {
    utils::browseURL(dash)
  } else {
    shiny::shinyApp(ui(), server)
  }
}

#' Function to add to Shinydashboard
#' 
#' @export
#' 
#' @details skin needs to be "blue" in the dashboardPage
#' 
#' @examples
#' \dontrun{
#' ui <- function(id) \{
#'   tagList(
#'     dreal_golem_add_ext(),
#'     # golem::favicon(),
#'    dashboardPage(header, sidebar, body, skin = "blue")
#'   )
#' \}
#' }

dreal_golem_add_ext <- function(){
  
  addResourcePath("css", system.file("css", package = "shinydreal"))
  addResourcePath("line-awesome", system.file("line-awesome", package = "shinydreal"))
  # addResourcePath('img', system.file('drealjs', package = 'shinydreal'))
  addResourcePath(
    "js", 
    system.file("dist/js", package = "shinydreal")
  )
  
  tagList(
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    tags$link(rel="stylesheet", type="text/css", href="css/uikit.css"),
    tags$link(rel="stylesheet", type="text/css", href="css/dashboard.css"),
    tags$link(rel="stylesheet", type="text/css", href="https://fonts.googleapis.com/css?family=Raleway:400,600,700|Roboto+Slab:300,400,700"),
    # tags$script(src = "drealjs/main.js"),
    htmltools::htmlDependency(
      "dreal","0.1.0",
      src = system.file("dist", package = "shinydreal"),
      stylesheet = c(
        # "vendors/bootstrap/css/bootstrap.min.css",
        # "vendors/jquery-ui/css/jquery-ui.min.css",
        "fonts/lineawesome/css/line-awesome.min.css"#,
        # "fonts/dreal/css/dreal.css",
        # "css/uikit.css",
        # "css/custom.css"
      ),
      meta = list(
        lang="fr"
      )#,
      # head = HTML(
      #   '<meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
      #   <meta name="viewport" content="width=device-width, initial-scale=1">
      #   <link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700|Roboto+Slab:300,400,700" rel="stylesheet"> '
      # )
    ),
    input_binding(), # javascript
    icons_binding() # icons
  )
}
