
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinydreal

Package de template Shiny DREAL.

Pour lire les tutos, rendez-vous dans le menu “Articles” de cette page.

Pour lire la documentation des fonctions, rendez-vous dans le menu
“Reference” de cette page.

## Avant de commencer

Étant un template `{shiny}`, `{shinydreal}` fonctionne en combinaison
avec `{shiny}` (il faut donc charger les deux).

``` r
library(shiny)
library(shinydreal)
#> 
#> Pour lancer l'aide
#> tapez : `dr_help()`
#> Pour voir une app de demo
#> utiliser : `app_dashboard(browse = FALSE)`
#> 
```

Il existe trois examples d’apps dans l’application. On peut les lister
en lançant :

``` r
dr_examples()
#> [1] "01_fluidpage.R" "02_sideBar.R"   "03_navBar.R"
```

Ensuite, chaque example peut être relancé en utilisant le nom de l’app
en paramètre de la fonction.

``` r
dr_examples("01_fluidpage.R")
```

## Example de flexdashboard

``` r
flex <- system.file("flexdashboard", package = "shinydreal")
browseURL(flex)
```
