# Import libraries
library(shiny)
library(ggplot2)
library(tidyverse) # For data manipulation (e.g., select, count, mutate)
library(scales)    # For scales::percent in pie chart labels
library(corrplot)  # For correlation matrix visualization

# Define server logic
shinyServer(function(input, output) {
  
  # TASK 6: Histogram for numerical variables (p1)
  output$p1 <- renderPlot({
    p <- ggplot(mtcars, aes(x = !!input$continuous_variable)) +
      labs(y = "Number of Cars", title = paste("Histogram of", input$continuous_variable))
    
    # Logic to apply fill color based on user input
    fill_color <- if (input$hist_fill == "default") {
      "grey" # A common default color for histograms
    } else {
      input$hist_fill # Use the color selected from radio buttons
    }
    
    p + geom_histogram(bins = input$bins, fill = fill_color, color = "black")
  })
  
  # TASK 7: Boxplot for numerical variables (p2)
  output$p2 <- renderPlot({
    ggplot(mtcars, aes(y = !!input$continuous_variable)) +
      geom_boxplot(fill = "lightblue", color = "darkblue") + # Added some aesthetic colors
      labs(title = paste("Boxplot of", input$continuous_variable)) +
      coord_flip() # Often better for single boxplots to make them horizontal
  })
  
  # NEW Plot: Density Plot for numerical variables (p7)
  output$p7 <- renderPlot({
    ggplot(mtcars, aes(x = !!input$continuous_variable)) +
      geom_density(fill = "steelblue", alpha = 0.6, color = "darkblue") + # Added fill and border color
      labs(title = paste("Density Plot of", input$continuous_variable),
           x = input$continuous_variable,
           y = "Density")
  })
  
  # TASK 8: Bar chart for categorical variables (p3)
  output$p3 <- renderPlot({
    ggplot(data = mtcars,
           aes(x = factor(!!input$categorical_variable),
               fill = factor(!!input$categorical_variable))) +
      geom_bar() +
      labs(x = input$categorical_variable,
           y = "Count",
           title = paste("Count of", input$categorical_variable)) +
      theme(legend.position = "none") # Hide redundant legend when fill is mapped to x-axis
  })
  
  # NEW Plot: Pie Chart for categorical variables (p5)
  output$p5 <- renderPlot({
    # Calculate counts and percentages for the selected categorical variable
    category_counts <- mtcars %>%
      count(!!input$categorical_variable, name = "count") %>% # Rename 'n' to 'count' for clarity
      mutate(percentage = count / sum(count))
    
    ggplot(category_counts, aes(x = "", y = percentage, fill = !!input$categorical_variable)) +
      geom_bar(width = 1, stat = "identity") +
      coord_polar("y", start = 0) + # Transform bar chart to pie chart
      labs(title = paste("Proportion of", input$categorical_variable), fill = input$categorical_variable) + # Add legend title
      theme_void() + # Minimal theme for pie chart
      theme(plot.title = element_text(hjust = 0.5), # Center plot title
            legend.title = element_text(size = 12)) + # Adjust legend title size
      geom_text(aes(label = scales::percent(percentage, accuracy = 0.1)), # Format percentages
                position = position_stack(vjust = 0.5), color = "black", size = 4) # Add percentage labels
  })
  
  
  # TASK 9: Scatter plot for correlation (p4)
  output$p4 <- renderPlot({
    ggplot(mtcars, aes(x = !!input$continuous_variable,
                       y = wt, # Fixed 'wt' as Y-axis for correlation observation
                       color = factor(!!input$categorical_variable))) +
      geom_point(size = 3, alpha = 0.7) +
      labs(title = paste("Relationship between", input$continuous_variable, "and Weight (wt)"),
           color = input$categorical_variable) +
      geom_smooth(method = "lm", se = FALSE, color = "darkgrey") # Add a linear trend line for overall relationship
  })
  
  # NEW Plot: Correlation Matrix (Correlogram) for correlation (p6)
  output$p6 <- renderPlot({
    # Define a vector of truly continuous variable names from mtcars for correlation analysis
    # These are variables that are not typically treated as factors/categories
    continuous_for_corr <- c("mpg", "disp", "hp", "drat", "wt", "qsec")
    
    # Select only these specified continuous columns from the mtcars dataset
    numerical_cols_for_corrplot <- mtcars %>%
      select(all_of(continuous_for_corr))
    
    # Check if there are at least two numerical columns to compute a correlation matrix
    if (ncol(numerical_cols_for_corrplot) < 2) {
      # If not enough columns, display an informative message instead of an error
      return(ggplot() +
               geom_text(aes(x = 0.5, y = 0.5, label = "Not enough continuous variables selected for correlation plot."),
                         size = 5, color = "red") +
               theme_void())
    }
    
    # Calculate the correlation matrix
    M <- cor(numerical_cols_for_corrplot, use = "pairwise.complete.obs") # Handle any potential NAs gracefully
    
    # Render the correlation plot using corrplot
    corrplot(M,
             method = "circle",      # Type of plot: circles, numbers, etc.
             type = "upper",         # Display only the upper triangle of the matrix
             order = "hclust",       # Order variables by hierarchical clustering
             tl.col = "black",       # Color of text labels (variable names)
             tl.srt = 45,            # Angle of text labels (45 degrees rotation)
             addCoef.col = "black",  # Add correlation coefficients as numbers
             diag = FALSE            # Do not show correlations on the diagonal (self-correlation is 1)
    )
  })
})