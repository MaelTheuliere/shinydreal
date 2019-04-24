dr_icons <- function(
  name = dr_icon_list, 
  size = 1, 
  color = "#5a1e82"
){
  name <- match.arg(name)
  if (grepl("drl-", name)){
    tags$div(
      class = sprintf("icon %s", name), 
      style = sprintf("font-size:%srem;color:%s;", size, color)
    )
  } else {
    tags$div(
      tags$i(
        class = sprintf("la %s", name), 
        style = sprintf("font-size:%srem;color:%s;", size, color)
      )
    )
  }
  
}

