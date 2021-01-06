ui <- fluidPage(
    sidebarLayout(
        titlePanel('Graph'),
        sidebarPanel(
    selectInput('sex', 'Select Sex', 'F', choices = c('M', 'F')),
    sliderInput('Year', 1900, 2020, 1900)
        ),
        mainPanel(
            plotOutput('plot')
        )
  
                    
                    )
)

server <- function(input, output, session) {
    
    output$plot <- renderPlot({ 
            tn <- get_top_names(input$Year, input$sex)
            ggplot(get_top_names(tn, aes(year, sex)) + geom_col())

    })
}

shinyApp(ui = ui, server = server)