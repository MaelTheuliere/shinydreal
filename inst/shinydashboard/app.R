library(shinydashboard)
library(shiny)
library(shinydreal)

skin <- Sys.getenv("DASHBOARD_SKIN")
skin <- tolower(skin)
if (skin == "")
  skin <- "blue"

lapply(list.files("inst/shinydashboard/R", full.names = TRUE), source)

sidebar <- dashboardSidebar(
  sidebarSearchForm(label = "Search...", "searchText", "searchButton"),
  sidebarMenu(
    menuItem("Comparaison", tabName = "resume", icon = icon("dashboard"),
             badgeLabel = "ok", badgeColor = "red"),
    menuItem("ShinyDashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Shinydreal 1", icon = icon("th"), tabName = "exemple1", 
             badgeLabel = "new", badgeColor = "green"
    ),
    menuItem("Shinydreal 2", tabName = "exemple2", icon = icon("dashboard"),
             badgeLabel = "new", badgeColor = "yellow"),
    # menuItem("Résumé", tabName = "resume", icon = icon("dashboard")),
    menuItem("Sous-menu ex.", icon = icon("bar-chart-o"),
             menuSubItem("Sub-item 1", tabName = "subitem1"),
             menuSubItem("Sub-item 2", tabName = "subitem2")
    )
  )
)

# body ====
body <- dashboardBody(
  tabItems(
    # item dashboard ----
    tabItem(
      "dashboard",
      fluidRow(
        column(width = 12,
               h2("Pleins de trucs à raconter !"), 
               h3("Des trucs et d'autres trucs :"),
               tags$div(
                 class = "outertext", 
                 tags$div(
                   class = "innertext", 
                   h4(shinipsum::random_text(
                     sample(c(10:20), 1)
                   )),
                   tags$p(shinipsum::random_text(
                     sample(c(10:100), 1)
                   )), 
                   h5(shinipsum::random_text(
                     sample(c(10:20), 1)
                   )),
                   tags$p(shinipsum::random_text(
                     sample(c(10:600), 1)
                   )), 
                   h6(shinipsum::random_text(
                     sample(c(10:20), 1)
                   )),
                   tags$p(shinipsum::random_text(
                     sample(c(50:500), 1)
                   ))
                 )
               )
        )
      ),
      fluidRow(
        box(
          title = "Distribution",
          status = "primary",
          plotOutput("plot1", height = 240),
          height = 300
        ),
        tabBox(
          height = 300,
          tabPanel("View 1",
                   plotOutput("scatter1", height = 230)
          ),
          tabPanel("View 2",
                   plotOutput("scatter2", height = 230)
          )
        )
      ),
      
      # Boxes with solid headers
      fluidRow(
        box(
          title = "Histogram control - status primary",
          width = 4, solidHeader = TRUE, status = "primary",
          sliderInput("count", "Count", min = 1, max = 500, value = 120)
        ),
        box(
          title = "Appearance - no status",
          width = 4, solidHeader = TRUE,
          radioButtons("fill", "Fill", # inline = TRUE,
                       c(None = "none", Blue = "blue", Black = "black", red = "red")
          )
        ),
        box(
          title = "Scatterplot control - status warning",
          width = 4, solidHeader = TRUE, status = "warning",
          selectInput("spread", "Spread",
                      choices = c("0%" = 0, "20%" = 20, "40%" = 40, "60%" = 60, "80%" = 80, "100%" = 100),
                      selected = "60"
          )
        )
      ),
      fluidRow(
        box(
          title = "Status success",
          width = 4, solidHeader = TRUE, status = "success",
          tags$span("Du texte ici")
        ),
        box(
          title = "Status danger",
          width = 4, solidHeader = TRUE, status = "danger",
          tags$span("Du texte là")
        )
      ),
      # Solid backgrounds
      fluidRow(
        box(
          title = "Title 4",
          width = 4,
          background = "black",
          "A box with a solid black background"
        ),
        box(
          status = "danger",
          title = "Title 5",
          width = 4,
          background = "purple",
          "A box with a solid secondary background"
        ),
        box(
          title = "Title 6",
          width = 4,
          background = "yellow",
          "A box with a solid warning background"
        )
      ),
      # Other inputs
      fluidRow(
        column(
          width = 12,
          h3("Other shinydashboard inputs"),
          downloadButton("dlbuttondb", label = "downloadButton", class = "btn-primary"),
          actionButton("acbuttondb", label = "actionButton", class = "btn-secondary"),
          checkboxInput("headerdb", "checkboxInput", TRUE),
          checkboxGroupInput("variabledb2", "checkboxGroupInput",
                             c("Cylinders" = "cyl",
                               "Transmission" = "am",
                               "Gears" = "gear")),
          dateRangeInput("daterange1db", "dateRangeInput",
                         start = "2001-01-01",
                         end   = "2010-12-31"),
          fileInput("file1db", "fileInput",
                    accept = c(
                      "text/csv",
                      "text/comma-separated-values,text/plain",
                      ".csv")
          ),
          numericInput("obsdb2", "Observations:", 10, min = 1, max = 100),
          # submitButton("submitButtondb", icon("refresh")), # Do not use !!
          textAreaInput("captiondb", "textAreaInput", "Data Summary", width = "200px"),
          textInput("caption2db", "textInput", "Data Summary"),
          varSelectInput("variabledb", "varSelectInput", mtcars),
          sliderInput("obsdb", "sliderInput",
                      min = 0, max = 1000, value = 500
          )
        )
      )
    ),
    # tabitem exemple1 ----
    tabItem("exemple1",
            fluidRow(
              column(
                width = 12,
                mod_panel_3_ui("panel_3_ui_1"),
                mod_panel_1_ui("panel_1_ui_1"),
                mod_panel_2_ui("panel_2_ui_1")
              )
            )
    ),
    # tabitem exemple2 ----
    tabItem("exemple2",
            fluidRow(
              column(
                width = 12,
                mod_panel_4_ui("panel_4_ui_1"),
                mod_panel_5_ui("panel_5_ui_1")
              )
            )
    ),
    # tabitem comparaison ----
    # tabItem("comparaison",
    #         fluidRow(
    #           column(
    #             width = 12,
    #             mod_panel_comp_ui("panel_comp_ui_1")
    #           )
    #         )
    # ),
    # tabitem resume ----
    tabItem("resume",
            fluidRow(
              column(
                width = 12,
                mod_panel_resume_ui("panel_resume_ui_1")
              )
            )
    )
  )
)

# messages ====
messages <- dropdownMenu(type = "messages",
                         messageItem(
                           from = "Sales Dept",
                           message = "Sales are steady this month."
                         ),
                         messageItem(
                           from = "New User",
                           message = "How do I register?",
                           icon = icon("question"),
                           time = "13:45"
                         ),
                         messageItem(
                           from = "Support",
                           message = "The new server is ready.",
                           icon = icon("life-ring"),
                           time = "2014-12-01"
                         )
)

# notifications ====
notifications <- dropdownMenu(type = "notifications", badgeStatus = "warning",
                              notificationItem(
                                text = "5 new users today",
                                icon("users")
                              ),
                              notificationItem(
                                text = "12 items delivered",
                                icon("truck"),
                                status = "success"
                              ),
                              notificationItem(
                                text = "Server load at 86%",
                                icon = icon("exclamation-triangle"),
                                status = "warning"
                              )
)

# tasks ====
tasks <- dropdownMenu(type = "tasks", badgeStatus = "success",
                      taskItem(value = 90, color = "green",
                               "Documentation"
                      ),
                      taskItem(value = 17, color = "aqua",
                               "Project X"
                      ),
                      taskItem(value = 75, color = "yellow",
                               "Server deployment"
                      ),
                      taskItem(value = 80, color = "red",
                               "Overall project"
                      )
)

# header ====
header <- dashboardHeader(
  title = "My Dashboard",
  messages,
  notifications,
  tasks
)

# ---- Transformed as function `dreal_golem_add_ext()` ----
# golem_add_external_resources <- function(){
#   
#   addResourcePath("css", system.file("css", package = "shinydreal"))
#   addResourcePath("line-awesome", system.file("line-awesome", package = "shinydreal"))
#   # addResourcePath('img', system.file('drealjs', package = 'shinydreal'))
#   addResourcePath(
#     "js", 
#     system.file("dist/js", package = "shinydreal")
#   )
#   
#   tagList(
#     # Add here all the external resources
#     # If you have a custom.css in the inst/app/www
#     tags$link(rel="stylesheet", type="text/css", href="css/uikit.css"),
#     tags$link(rel="stylesheet", type="text/css", href="css/dashboard.css"),
#     tags$link(rel="stylesheet", type="text/css", href="https://fonts.googleapis.com/css?family=Raleway:400,600,700|Roboto+Slab:300,400,700"),
#     # tags$script(src = "drealjs/main.js"),
#     htmltools::htmlDependency(
#       "dreal","0.1.0",
#       src = system.file("dist", package = "shinydreal"),
#       stylesheet = c(
#         # "vendors/bootstrap/css/bootstrap.min.css",
#         # "vendors/jquery-ui/css/jquery-ui.min.css",
#         "fonts/lineawesome/css/line-awesome.min.css"#,
#         # "fonts/dreal/css/dreal.css",
#         # "css/uikit.css",
#         # "css/custom.css"
#       ),
#       meta = list(
#         lang="fr"
#       )#,
#       # head = HTML(
#       #   '<meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
#       #   <meta name="viewport" content="width=device-width, initial-scale=1">
#       #   <link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700|Roboto+Slab:300,400,700" rel="stylesheet"> '
#       # )
#     ),
#     shinydreal:::input_binding(), # javascript
#     shinydreal:::icons_binding() # icons
#   )
# }

# ui ====
ui <- function(id) {
  tagList(
    dreal_golem_add_ext(),
    # golem::favicon(),
    dashboardPage(header, sidebar, body, skin = "blue")
  )
}

# server ====
server <- function(input, output) {
  
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    if (is.null(input$count) || is.null(input$fill))
      return()
    
    data <- histdata[seq(1, input$count)]
    color <- input$fill
    if (color == "none")
      color <- NULL
    hist(data, col = color, main = NULL)
  })
  
  output$scatter1 <- renderPlot({
    spread <- as.numeric(input$spread) / 100
    x <- rnorm(1000)
    y <- x + rnorm(1000) * spread
    plot(x, y, pch = ".", col = "blue")
  })
  
  output$scatter2 <- renderPlot({
    spread <- as.numeric(input$spread) / 100
    x <- rnorm(1000)
    y <- x + rnorm(1000) * spread
    plot(x, y, pch = ".", col = "red")
  })
  
  callModule(mod_panel_1_server, "panel_1_ui_1")
  
  callModule(mod_panel_2_server, "panel_2_ui_1")
  
  callModule(mod_panel_3_server, "panel_3_ui_1")
  
  callModule(mod_panel_4_server, "panel_4_ui_1")
  
  callModule(mod_panel_5_server, "panel_5_ui_1")
  
  callModule(mod_panel_comp_server, "panel_comp_ui_1")
  
  callModule(mod_panel_resume_server, "panel_resume_ui_1")
}

shinyApp(ui(), server)

