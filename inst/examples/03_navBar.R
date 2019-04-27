library(shinydreal)
library(shiny)
ui <- function(request){
  dr_navbarPage(
    menu = dr_navItems(
      dr_navItem(id = "un","Am"),
      dr_navItem(id = "deux","Stram"),
      dr_navItem(id = "trois","Gram")
    ), 
    body = tagList(
      dr_panel(
        id = "un",
        h3("IRIS"),
        dr_row(
          dr_col_6(
            plotOutput("plot1")
          ),
          dr_col_6(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tellus urna, placerat in tortor ac, imperdiet sollicitudin mi. Integer vel dolor mollis, feugiat sem eu, porttitor elit. Sed aliquam urna sed placerat euismod. In risus sem, ornare nec malesuada eu, ornare quis dui. Nunc finibus fermentum sollicitudin. Fusce vel imperdiet mi, ac faucibus leo. Cras massa massa, ultricies et justo vitae, molestie auctor turpis. Vestibulum euismod porta risus euismod dapibus. Nullam facilisis ipsum sed est tempor, et aliquam sapien auctor."
          )
        )
      ),
      dr_panel(
        id = "deux",
        h3("AIRQUALITY"),
        dr_row(
          dr_col_6(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tellus urna, placerat in tortor ac, imperdiet sollicitudin mi. Integer vel dolor mollis, feugiat sem eu, porttitor elit. Sed aliquam urna sed placerat euismod. In risus sem, ornare nec malesuada eu, ornare quis dui. Nunc finibus fermentum sollicitudin. Fusce vel imperdiet mi, ac faucibus leo. Cras massa massa, ultricies et justo vitae, molestie auctor turpis. Vestibulum euismod porta risus euismod dapibus. Nullam facilisis ipsum sed est tempor, et aliquam sapien auctor."
          ),
          dr_col_6(
            plotOutput("plot2")
          )
        )
        
      ),
      dr_panel(
        id = "trois",
        h3("MTCARS"),
        dr_row(
          dr_col_6(
            plotOutput("plot3")
          ),
          dr_col_6(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tellus urna, placerat in tortor ac, imperdiet sollicitudin mi. Integer vel dolor mollis, feugiat sem eu, porttitor elit. Sed aliquam urna sed placerat euismod. In risus sem, ornare nec malesuada eu, ornare quis dui. Nunc finibus fermentum sollicitudin. Fusce vel imperdiet mi, ac faucibus leo. Cras massa massa, ultricies et justo vitae, molestie auctor turpis. Vestibulum euismod porta risus euismod dapibus. Nullam facilisis ipsum sed est tempor, et aliquam sapien auctor."
          )
        )
      )
    )
  )
}

server <- function(input, output, session){
  output$plot1 <- renderPlot({
    plot(iris)
  })
  output$plot2 <- renderPlot({
    plot(airquality)
  })
  output$plot3 <- renderPlot({
    plot(mtcars)
  })
}

shinyApp(ui, server)