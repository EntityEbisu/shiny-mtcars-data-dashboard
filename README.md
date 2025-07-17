# shiny-mtcars-data-dashboard

##  Overview

This is an interactive R Shiny web application designed for **comprehensive exploratory data analysis (EDA)** of the well-known `mtcars` dataset. It provides a user-friendly interface to visualize relationships and distributions of both numerical and categorical variables through an expanded set of interactive plot types, making data patterns and insights easy to discover.

---

##  Features

* **Dynamic Variable Selection:** Choose any continuous or categorical variable from the `mtcars` dataset for analysis.
* **Distribution of Numerical Variables:**
    * **Histograms:** Customize the number of bins and select from various fill colors (default, blue, red, yellow, green) to visualize numerical variable distributions.
    * **Box Plots:** See the spread and potential outliers of continuous variables.
    * **Density Plots:** Visualize the probability density function of continuous variables, showing the shape of their distribution.
* **Distribution of Categorical Variables:**
    * **Bar Charts:** Visualize the frequency count for each category of the selected variable.
    * **Pie Charts:** Display the proportion of each category, offering a clear view of part-to-whole relationships.
* **Plots for Observing Data Correlation:**
    * **Scatter Plots:** Explore bivariate relationships between continuous variables (e.g., `mpg` vs. `wt`), with points optionally colored by a categorical variable. A linear trend line helps visualize overall correlation.
    * **Correlation Matrix (Correlogram):** Provides an overview of pairwise correlations among multiple continuous variables in the dataset, using visual cues (circles) to represent strength and direction.
* **Responsive Design:** The application layout adapts gracefully to different screen sizes, providing a seamless experience on various devices.

---

##  Technologies Used

* **R**: The core programming language.
* **Shiny**: For building the interactive web application.
* **tidyverse**: A collection of R packages essential for data manipulation and visualization, including:
    * `ggplot2`: For creating sophisticated plots.
    * `dplyr`: For data wrangling.
    * `tidyr`, `purrr`, `forcats`, `stringr`.
* **`corrplot`**: Specifically for generating the correlation matrix.
* **`scales`**: For managing plot aesthetics, especially for consistent color mapping and formatting.
* **`renv`**: For project environment management and ensuring reproducibility of the package dependencies.

---

##  Live Application

Experience the app in action!

➡️ **[View the Live Application on shinyapps.io](https://entityebisu.shinyapps.io/Data_Exploration_Mtcars_with_R_Shiny/)**

---

## ⚙️ Local Installation & Usage

To run this application on your local machine, follow these steps:

1.  **Prerequisites:**
    * Install [R](https://cran.r-project.org/).
    * Install [RStudio](https://posit.co/download/rstudio-desktop/).
    * Install [Git](https://git-scm.com/downloads).
    * (Windows users only) Install [Rtools](https://cran.r-project.org/bin/windows/Rtools/) appropriate for your R version.

2.  **Clone the Repository:**
    ```bash
    git clone https://github.com/EntityEbisu/shiny-mtcars-data-dashboard.git
    cd shiny-mtcars-data-dashboard
    ```

3.  **Open the Project in RStudio:**
    * Open RStudio.
    * Go to `File > Open Project...` and select the `Lab4.Rproj` file within the cloned directory.

4.  **Restore the R Environment:**
    * Once the project opens, `renv` will likely prompt you to activate the project. Confirm `Yes`.
    * In the RStudio Console, run:
        ```R
        renv::restore()
        ```
    * Type `y` when prompted to confirm the installation of necessary packages. `renv` will download and install all required packages into an isolated project library, ensuring reproducibility.

5.  **Run the Application:**
    * After `renv::restore()` completes successfully, run the app from the RStudio Console:
        ```R
        shiny::runApp()
        ```
    * The application should launch in your default web browser or RStudio's Viewer pane.

##  Author

* **[Nguyen Trong Minh]**
    * [GitHub Profile Link](https://github.com/EntityEbisu/)

---
