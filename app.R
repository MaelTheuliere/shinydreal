# rsconnect::appDependencies
if (!require(pkgload)) { install.packages("pkgload", repos = "https://cloud.r-project.org"); require(pkgload)}
# if (!require(shinydashboard)) { install.packages("shinydashboard", repos = "https://cloud.r-project.org"); require(shinydashboard)}
# if (!require(remotes)) { install.packages("remotes", repos = "https://cloud.r-project.org"); require(remotes)}
# if (!require(plotly)) { install.packages("remotes", repos = "https://cloud.r-project.org"); require(plotly)}
# if (!require(shinipsum)) { remotes::install_github("ThinkR-open/shinipsum"); require(shinipsum)}
# remotes::install_github("ThinkR-open/shinipsum")
# if (!require(emo)) { remotes::install_github("hadley/emo"); require(emo)}
# remotes::install_github("hadley/emo")

pkgload::load_all()
options("golem.app.prod" = TRUE)

# run_app()
# addResourcePath("resources", system.file("resources", package = "bloomsubventions"))
# addResourcePath('img', system.file('img', package = 'bloomsubventions'))
# shinyApp(ui = app_ui(), server = app_server)

app_dashboard()
