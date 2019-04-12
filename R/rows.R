dr_panel <- function(id, ...){
  tags$div(
    id = id,
    class = "panel",
    ...
  )
}

dr_row <- function(...){
  tags$div(
    class = "row",
    ...
  )
}

dr_col <- function( width,...){
  tags$div(
    class = sprintf("col-lg-%s", width),
    ...
  )
}

dr_col_12 <- function(...){
  dr_col(
    width = 12, 
    ...
  )
}

dr_col_6 <- function(...){
  dr_col(
    width = 6, 
    ...
  )
}

dr_col_4 <- function( ...){
  dr_col(
    width = 4, 
    ...
  )
}

dr_col_3 <- function( ...){
  dr_col(
    width = 3, 
    ...
  )
}