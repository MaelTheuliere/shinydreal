library(shinydreal)
library(shiny)
ui <- function(request){
  dr_fluidPage(
    h1("Fluid page"), 
    h2("Exemple de dr_fluidPage"), 
    dr_row(
      dr_col_6(
        dr_tableOutput("table")
      ), 
      dr_col_6(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tellus urna, placerat in tortor ac, imperdiet sollicitudin mi. Integer vel dolor mollis, feugiat sem eu, porttitor elit. Sed aliquam urna sed placerat euismod. In risus sem, ornare nec malesuada eu, ornare quis dui. Nunc finibus fermentum sollicitudin. Fusce vel imperdiet mi, ac faucibus leo. Cras massa massa, ultricies et justo vitae, molestie auctor turpis. Vestibulum euismod porta risus euismod dapibus. Nullam facilisis ipsum sed est tempor, et aliquam sapien auctor."
      )
    ), 
    dr_row(
      dr_col_6(
        h3("Afficher le graph ?"),
        dr_onOff("on")
      ), 
      dr_col_6(
        plotOutput("plot")
      )
    )
  )
}

server <- function(input, output, session){
  
  output$table <- renderTable({
    head(iris)
  })
  
  observe({
    print(input$on)
  })
  
  observeEvent( input$on , {
    if (input$on){
      output$plot <- renderPlot({
        plot(iris)
      })
    } else {
      output$plot <- renderPlot({
        NULL
      })
    }
  })
  
}

shinyApp(ui, server)