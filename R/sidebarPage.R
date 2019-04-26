#' Page avec sidebar
#'
#' @inheritParams dr_navbarPage
#' @param sidebar Contenu de la barre de navigation. 
#'
#' @return Une page avec une sidebar.
#' @export
dr_sidebarPage <- function(
  title = "DREAL",
  sidebar = tagList(),
  body
){
  page_skeleton(
    tagList(
      sidebar,
      tagList(
        tags$div(
          class = "main", 
          body
        )
      ),
      includeScript(
        system.file("drealjs/sidebar.js", package = "shinydreal")
      ) 
    )
    
  )
}



#' Menu de sidebar
#'
#' @param ... contenu du menu
#' @export
#' @importFrom htmltools tags tagList
dr_sidebarItems <- function(
  ...
) {
  tagList(
    tags$ul(
      class="sidebar", 
      tagList(
        ...
      )
    ), 
    tags$style(
      '
        .sidebar h1 {margin-left: 10px;}
        .sidebar h2 {margin-left: 10px;}
        .sidebar h3 {margin-left: 10px;}
        .sidebar h4 {margin-left: 10px;}
        .sidebar h5 {margin-left: 10px;}'
    )
  )
  
}

#' Élément de menu
#'
#' @inheritParams dr_navItem
#' @export
#' @importFrom htmltools tags
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