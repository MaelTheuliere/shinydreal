
dreal_dependency <- function() {
  htmltools::htmlDependency(
    "dreal","0.1.0",
    src = system.file("dist", package = "meatballs"),
    stylesheet = c(
      "vendors/bootstrap/css/bootstrap.min.css",
      "vendors/jquery-ui/css/jquery-ui.min.css",
      "fonts/lineawesome/css/line-awesome.min.css",
      "fonts/dreal/css/dreal.css",
      "css/uikit.css",
      "css/custom.css"
    ),
    meta = list(
      lang="fr"
    ),
    head = HTML(
      '<meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700|Roboto+Slab:300,400,700" rel="stylesheet"> '
    )
  )
}
input_binding <- function() {
  htmltools::htmlDependency(
    "drealjs","0.1.0",
    src = system.file("drealjs", package = "meatballs"),
    script = c(
      "input-fleche.js",
      "input-nav.js",
      "input-progress.js",
      "input-rangeSlider.js"
    )
  )
}

script_footer <- function(){
  tagList(
    tags$script("window.Tether = {};"),
   #tags$script(src="vendors/bootstrap/js/bootstrap.min.js"),
    tags$script(type="application/javascript", src="js/app.min.js"),
    tags$script(src="js/dreal.js")
  )

}
