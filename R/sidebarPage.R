#' @import htmltools
#' @import shiny
dr_sidebarPage <- function(
  title = "DREAL",
  sidebar = tagList(),
  ...
){
  page_skeleton(
    tagList(
      sidebar,
      tagList(
        tags$div(
          class = "main", 
          ...
        )
      ),
      includeScript(
        system.file("drealjs/sidebar.js", package = "meatballs")
      ) 
    )
      
  )
}

dr_sidebarItems <- function(
  ...
) {
  tags$ul(
    class="sidebar", 
    tagList(
      ...
    )
  )
}
  
dr_sidebarItem <- function(
  id, label
){
  tags$li(
    class="nav-side", 
    onclick = glue::glue(
      '$( ".nav-side" ).removeClass("active");
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