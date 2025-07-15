# Import libraries
library(shiny)
library(ggplot2)

# Define server logic
shinyServer(function(input, output) {
  # TASK 6
  output$p1 <- renderPlot({
    # Base ggplot object
    p <- ggplot(mtcars, aes(x = !!input$continuous_variable)) +
      labs(y = "Number of Cars", title = paste("Trend of ", input$continuous_variable))
    
    # Determine the fill color based on input$hist_fill
    fill_color <- if (input$hist_fill == "default") {
      "grey" # Or NULL to let ggplot choose its default if it truly means no specific fill
    } else {
      input$hist_fill # Use the selected color from the radio buttons
    }
    
    # Add geom_histogram with the determined fill color
    # Add color = "black" for borders to make bins more distinct
    p + geom_histogram(bins = input$bins, fill = fill_color, color = "black")
  })
  
  # TASK 7: Boxplot
  output$p2 <- renderPlot({
    ggplot(mtcars, aes(y = !!input$continuous_variable)) +
      geom_boxplot() +
      labs(title = paste("How", input$continuous_variable, "value is spread")) +
      coord_flip()
  })
  
  # TASK 8: Bar chart
  output$p3 <- renderPlot({
    ggplot(data = mtcars,
           aes(x = factor(!!input$categorical_variable),
               fill = factor(!!input$categorical_variable))) +
      geom_bar() +
      labs(x = input$categorical_variable,
           title = paste("Trend of", input$categorical_variable))
  })
  
  # TASK 9: Scatter plot
  output$p4 <- renderPlot({
    ggplot(mtcars, aes(x = !!input$continuous_variable,
                       y = wt,
                       color = factor(!!input$categorical_variable))) +
      geom_point(size = 3) +
      labs(title = paste("Distribution of", input$continuous_variable, "with respect to Weight"))
  })
})