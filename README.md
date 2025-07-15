# shiny-mtcars-data-dashboard

## 📊 Overview

This is an interactive R Shiny web application designed for **comprehensive exploratory data analysis (EDA)** of the well-known `mtcars` dataset. It provides a user-friendly interface to visualize relationships and distributions of both numerical and categorical variables through an expanded set of interactive plot types, making data patterns and insights easy to discover.

---

## ✨ Features

* **Dynamic Variable Selection:** Choose any continuous or categorical variable from the `mtcars` dataset for analysis.
* **Distribution of Numerical Variables:**
    * **Histograms:** Customize the number of bins and select from various fill colors (default, blue, red, yellow, green) to visualize numerical variable distributions.
    * **Box Plots:** See the spread and potential outliers of continuous variables.
    * **Density Plots:** Visualize the probability density function of continuous variables, showing the shape of their distribution.
* **Distribution of Categorical Variables:**
    * **Bar Charts:** Visualize the frequency count for each category of the selected variable.
    * **Pie Charts:** Display the proportion of each category, offering a clear view of part-to-whole relationships.
    * **Consistent Categorical Coloring:** Ensures that the same category (e.g., '4' cylinders) uses the same color across all relevant plots (bar and pie charts) for improved clarity.
* **Plots for Observing Data Correlation:**
    * **Scatter Plots:** Explore bivariate relationships between continuous variables (e.g., `mpg` vs. `wt`), with points optionally colored by a categorical variable. A linear trend line helps visualize overall correlation.
    * **Correlation Matrix (Correlogram):** Provides an overview of pairwise correlations among multiple continuous variables in the dataset, using visual cues (circles) to represent strength and direction.
* **Responsive Design:** The application layout adapts gracefully to different screen sizes, providing a seamless experience on various devices.

---

## 🚀 Live Application

Experience the app in action!

➡️ **[View the Live Application on shinyapps.io](https://entityebisu.shinyapps.io/Data_Exploration_Mtcars_with_R_Shiny/)**
