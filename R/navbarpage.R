#' Page avec navBar
#'
#' @param title Titre de la page.
#' @param menu Contenu du menu.
#' @param body Corps de la page.
#' @param main_class Classe du corps de la page.
#'
#' @return Un objet Shiny. 
#' @export
#' @importFrom shiny tags includeScript
dr_navbarPage <- function(
  title = "DREAL", 
  menu,
  body, 
  main_class = "container-fluid"
){
  page_skeleton(
    tags$div(
      class="navbar-container", 
      tags$nav(
        class="navbar navbar-toggleable-md navbar-inverse bg-primary mb-4", 
        tags$button(
          class="navbar-toggler navbar-toggler-right",
          type="button", 
          "data-toggle"="collapse", 
          "data-target"="#navbar-inverse-bg-primary", 
          tags$span(
            class="navbar-toggler-icon"
          )
        ),
        tags$a(
          class="navbar-brand mr-5", 
          href="#", 
          title
        ),
        tags$div(
          class="collapse navbar-collapse", 
          id="navbar-inverse-bg-primary", 
          menu
        )
      ), 
      tags$div(
        class = "container-fluid",
        body
      )
    ),
    includeScript(
      system.file("drealjs/panel.js", package = "shinydreal")
    ) 
  )
}



#' Menu de navbar
#'
#' @param ... contenu du menu
#' @export
#' @importFrom htmltools tags tagList
dr_navItems <- function(
  ...
) {
  tags$ul(
    class="navbar-nav mr-auto", 
    tagList(
      ...
    )
  )
}


#' Élément de menu
#'
#' @param id Id du menu, doit correspondre à un id de `dr_panel`.
#' @param label Texte de l'élément de menu. 
#' @export
#' @importFrom htmltools tags
dr_navItem <- function(
  id, label
){
  tags$li(
    class="nav-item", 
    onclick = glue::glue(
      '$( ".nav-item" ).removeClass("active");
       $( ".panel" ).hide().trigger("hidden"); 
       $( "#{id}").show().trigger("shown"); 
       $( this ).addClass("active");'
    ),
    tags$a(
      class="nav-link", 
      href = "javascript:void(0)",
      label
    )
  )
}