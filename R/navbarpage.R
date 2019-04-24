#' @import htmltools
#' @import shiny
dr_navbarPage <- function(
  title = "DREAL", 
  menu,
  ..., 
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
        tagList(
          ...
        )
      )
    ),
    includeScript(
      system.file("drealjs/panel.js", package = "meatballs")
    ) 
  )
}

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