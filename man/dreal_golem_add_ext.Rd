% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dreal_golem_add_ext.R
\name{dreal_golem_add_ext}
\alias{dreal_golem_add_ext}
\title{Function to add to Shinydashboard}
\usage{
dreal_golem_add_ext()
}
\description{
Function to add to Shinydashboard
}
\details{
skin needs to be "blue" in the dashboardPage
}
\examples{
\dontrun{
ui <- function(id) \\{
  tagList(
    dreal_golem_add_ext(),
    # golem::favicon(),
   dashboardPage(header, sidebar, body, skin = "blue")
  )
\\}
}
}
