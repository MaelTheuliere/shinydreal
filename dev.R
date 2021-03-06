file.create("LICENCE")
write("COPYRIGHT DREAL - 2019", "LICENCE")

usethis::use_build_ignore("app.R")

usethis::use_test()

usethis::use_vignette("a_getting_started")
usethis::use_vignette("b_inputs")


# Documentation
attachment::att_to_description(extra.suggests = c(
  "pkgdown", "emo", "shinipsum", "shinydashboard", "dplyr"))

# Le pkgdown
visualidentity::build_pkgdown(
  yml = system.file("pkgdown/_pkgdown.yml", package = "thinkridentity"),
  favicon = system.file("pkgdown/favicon.ico", package = "thinkridentity"),
  move = TRUE, clean_before = TRUE, clean_after = TRUE
)


# visualidentity::open_pkgdown_function(path = "inst/docs")
# pkg::open_pkgdown()

## __ deploy pkgdown on rsconnect
usethis::use_git_ignore("docs/rsconnect")
usethis::use_git_ignore("inst/docs/rsconnect")
usethis::use_git_ignore("rsconnect")

rsconnect::accounts()
account_name <- rstudioapi::showPrompt("Rsconnect account", "Please enter your username:", "name")
account_server <- rstudioapi::showPrompt("Rsconnect server", "Please enter your server name:", "1.1.1.1")
origwd <- setwd("inst/docs")
rsconnect::deployApp(
  ".",                       # the directory containing the content
  appFiles = list.files(".", recursive = TRUE), # the list of files to include as dependencies (all of them)
  appPrimaryDoc = "index.html",                 # the primary file
  appName = "shinydreal",                   # name of the endpoint (unique to your account on Connect)
  appTitle = "shinydreal",                  # display name for the content
  account = account_name,                # your Connect username
  server = account_server                    # the Connect server, see rsconnect::accounts()
)
setwd(origwd)

# Install from gitlab
thinkridentity::open_install_git_with_pwd()

# Docker run
# docker run -d -e PASSWORD=coucou -p 8787:8787 rocker/verse
