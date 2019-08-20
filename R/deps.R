# INTERNAL
#' @importFrom htmltools htmlDependency
dreal_dependency <- function() {
  htmlDependency(
    "dreal","0.1.0",
    src = system.file("dist", package = "shinydreal"),
    stylesheet = c(
      "vendors/bootstrap/css/bootstrap.min.css",
      "vendors/jquery-ui/css/jquery-ui.min.css",
      "fonts/lineawesome/css/line-awesome.min.css",
      "fonts/dreal/css/dreal.css",
      "css/uikit_Lato_Roboto.css",
      "css/custom.css"
    ),
    meta = list(
      lang="fr"
    ),
    head = HTML(
      '<meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700|Roboto+Slab:300,400,700|Lato:300,400,700|Roboto:300,400,700" rel="stylesheet"> '
    )
  )
}
#' @importFrom htmltools htmlDependency
input_binding <- function() {
 htmlDependency(
    "drealjs","0.1.0",
    src = system.file("drealjs", package = "shinydreal"),
    script = c(
      "input-fleche.js",
      "input-nav.js",
      "input-progress.js",
      "input-rangeSlider.js", 
      "input-select.js",
      "input-onoff.js", 
      "input-sqonOff.js", 
      "input-radioButton.js",
      "input-checkbox.js",
      "input-increment.js",
      "panel.js"
    )
  )
}
#' @importFrom htmltools htmlDependency
icons_binding <- function() {
  htmlDependency(
    "line-awesome","0.1.0",
    src = system.file("line-awesome", package = "shinydreal"),
    all_files = TRUE
  )
}

#' @importFrom shiny addResourcePath tagList
script_footer <- function(){
  addResourcePath(
    "js", 
    system.file("dist/js", package = "shinydreal")
  )
  tagList(
    HTML(
      '<script>window.Tether = {};</script>
      <script src="vendors/bootstrap/js/bootstrap.min.js"></script>
      <script type="application/javascript" src="js/app.min.js"></script>'
    )
  )

}
