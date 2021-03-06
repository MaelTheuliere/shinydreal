% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rows.R
\name{dr_panel}
\alias{dr_panel}
\alias{dr_row}
\alias{dr_col}
\alias{dr_col_12}
\alias{dr_col_6}
\alias{dr_col_4}
\alias{dr_col_3}
\title{Élément de corps de page}
\usage{
dr_panel(id, ...)

dr_row(...)

dr_col(width, ...)

dr_col_12(...)

dr_col_6(...)

dr_col_4(...)

dr_col_3(...)
}
\arguments{
\item{id}{ID, pour le \code{dr_panel}}

\item{...}{Élément à insérer}

\item{width}{largeur de la colonne, pour \code{dr_col}.}
}
\value{
Une liste HTML.
}
\description{
\code{dr_panel} est un panel pour les navbarPage et le sidebarPage.
\code{dr_row} crée une nouvelle ligne dans l'UI, \code{dr_col(width = X)} crée
une colonne de largeur X. \code{dr_col_*} 12, 6, 4 et 3 crééent des éléments
de largeur 12, 6, 4 et 3 respectivement.
}
