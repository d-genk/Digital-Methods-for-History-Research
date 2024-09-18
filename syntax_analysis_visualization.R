# R vs Python Syntax

# --- Variables and Assignment ---
# In R, we use <- or = to assign values, similar to = in Python
x <- 10   # In R, you can also use x = 10, but <- is preferred
y <- 5

# In Python: x = 10

a <- b <- c <- 10  # Assigns 10 to a, b, and c simultaneously

# R supports basic arithmetic operations like Python
result <- x + y
result

# --- Data Types ---
# R has similar data types to Python: numeric, character (string), and logical (boolean)

num <- 42          # Numeric (similar to Python's int or float)
text <- "Hello!"   # Character (similar to Python's string)
is_true <- TRUE    # Logical (like Python's True/False)

# --- Whitespace in R ---
# In R, whitespace (spaces, tabs, and newlines) generally **doesn't matter** for code execution.
# It's mainly used to improve code readability. For example:

a <- 5 + 3  # This works
a <- 5+3    # This also works, but less readable

# You can break a long line of code into multiple lines for readability:
long_calc <- 1 + 2 + 3 -
  4 + 5 + 6
long_calc

# Unlike Python, indentation and whitespace don't define code blocks in R. Braces {} are used instead.

# --- Lists vs Vectors ---
# In Python: lists can hold multiple types of objects
# In R: vectors (created with c()) hold elements of the same type
vec <- c(1, 2, 3, 4, 5)   # Numeric vector
vec_text <- c("a", "b", "c")  # Character vector

# Create a numeric vector
vec <- c(10, 20, 30, 40, 50)

# Access the first element
vec[1]  # Output: 10

# Access the third element
vec[3]  # Output: 30

# Access multiple elements
vec[c(2, 4)]  # Output: 20, 40

# Get elements greater than 25
vec[vec > 25]  # Output: 30, 40, 50

# Assign multiple values at once from a vector
vals <- c(1, 2, 3)
a <- vals[1]
b <- vals[2]
c <- vals[3]

print(a)  # Output: 1
print(b)  # Output: 2
print(c)  # Output: 3

# Create a list
my_list <- list(name = "Alice", age = 30, scores = c(85, 90, 95))

# Access the "name" element (by name)
my_list[["name"]]  # Output: "Alice"
my_list$name       # Output: "Alice"

# Access the second element (by position)
my_list[[2]]  # Output: 30

# Access the "scores" element and its third value
my_list[["scores"]][3]  # Output: 95

# R lists are similar to Python lists: they can hold multiple types of objects
my_list <- list(1, "apple", TRUE)  # Equivalent to Python's list: [1, "apple", True]

# Assign different values to multiple variables using a list
vars <- list(a = 1, b = 2, c = 3)

# Extract the values
a <- vars$a
b <- vars$b
c <- vars$c

print(a)  # Output: 1
print(b)  # Output: 2
print(c)  # Output: 3

# --- Control Structures ---
# If statements in R are similar to Python, but R uses brackets {} for code blocks

if (x > y) {
  print("x is greater than y")
} else {
  print("x is less than or equal to y")
}

# In Python:
# if x > y:
#     print("x is greater than y")
# else:
#     print("x is less than or equal to y")

x <- 10

if (x > 10) {
  print("x is greater than 10")
} else if (x == 10) {
  print("x is equal to 10")
} else {
  print("x is less than 10")
}

# --- Loops ---
# A "for" loop in R is similar to Python's loop over lists
for (i in vec) {
  print(i)
}

# In Python:
# for i in vec:
#     print(i)

# Initialize a variable
x <- 1

# While loop
while (x <= 5) {
  print(x)
  x <- x + 1  # Increment the variable to avoid an infinite loop
}

x <- 1
while (x <= 5) {
  if (x == 3) {
    break  # Exit the loop when x is 3
  }
  print(x)
  x <- x + 1
}

# --- Functions ---
# Functions in R are similar to Python's def keyword, but you use the function() keyword in R
add_numbers <- function(a, b) {
  return(a + b)
}

add_numbers(5, 3)

# In Python:
# def add_numbers(a, b):
#     return a + b


# --- Part 2: Exploring and Analyzing Data with R ---

# --- Introduction to R Data Frames ---

# A data frame in R is one of the most commonly used data structures for storing datasets.
# It is similar to a table or spreadsheet where:
# - Rows represent individual observations or records.
# - Columns represent variables or features, and each column can contain data of different types (e.g., numeric, character, factor).

# Creating a data frame using the data.frame() function by combining vectors of equal length:
people <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),  # Column of names (character type)
  Age = c(25, 30, 35),                  # Column of ages (numeric type)
  Gender = c("F", "M", "M")             # Column of genders (character type)
)

# Print the data frame to see the structure
print(people)

# Output:
#      Name Age Gender
# 1   Alice  25      F
# 2     Bob  30      M
# 3 Charlie  35      M

# --- Accessing Data Frame Elements ---

# You can access individual columns, rows, or specific elements within a data frame.

# Access a column by using the $ operator or square brackets [] to select a column by name:
people$Name        # Selects the "Name" column
people[, "Age"]    # Another way to select the "Age" column

# Access a specific row using square brackets with the row index:
people[1, ]        # Selects the first row

# Access a specific element by providing both row and column indices:
people[1, 2]       # Selects the element in the 1st row and 2nd column (Age of Alice)

# --- Key Functions for Data Frames ---

# The str() function displays the structure of the data frame, including the types of each column.
str(people)

# The summary() function provides a summary of each column in the data frame (useful for numerical data).
summary(people)

# The head() and tail() functions display the first or last few rows of the data frame.
head(people)
tail(people)

# Let's use the "mtcars" dataset, a built-in dataset in R that contains data about various car models
data("mtcars")  # Load the dataset

# Preview the data
head(mtcars)  # Equivalent to Python's df.head()

# Basic Summary Statistics
summary(mtcars)  # Provides a summary of the dataset (min, max, median, etc.)

# In Python, you'd use:
# df.describe()

# Finding the mean and median of a specific column
mean(mtcars$mpg)   # Mean miles per gallon
median(mtcars$mpg) # Median miles per gallon

# In Python:
# df['mpg'].mean()

# Filtering data: Find cars with more than 6 cylinders
cars_with_more_cylinders <- mtcars[mtcars$cyl > 6, ]
cars_with_more_cylinders

# In Python:
# cars_with_more_cylinders = df[df['cyl'] > 6]

# Selecting the rows with more than 6 cylinders and only the 'mpg' and 'hp' columns
mtcars[mtcars$cyl > 6, c("mpg", "hp")]

mtcars[, c("mpg", "hp")]  # All rows, only 'mpg' and 'hp' columns

# --- Exploring Historical Data ---
# Load a dataset relevant to digital history (simple dataset on historical population growth)
historical_data <- data.frame(
  Year = c(1800, 1850, 1900, 1950, 2000),
  Population = c(5000000, 23000000, 76000000, 151000000, 281000000)
)

# View the data
historical_data

# Calculate growth rates over time
# The growth rate is calculated using the formula:
# (current_population - previous_population) / previous_population * 100
# diff(historical_data$Population) computes the difference between consecutive population values.
# historical_data$Population[-length(historical_data$Population)] excludes the last population value
# so that the division aligns correctly with the shortened result of diff().
# c(NA, ...) prepends NA to the GrowthRate vector to account for the first year where growth rate can't be calculated.
historical_data$GrowthRate <- c(NA, diff(historical_data$Population) / historical_data$Population[-length(historical_data$Population)] * 100)

# View the updated data
historical_data

# --- Part 3: Visualizing Data with R ---

# Visualization is key in R, and the ggplot2 package is powerful for this.
# Let's go through several types of plots and explain what each function does.

# --- Bar Plot: Visualizing Car Cylinder Counts ---

# --- Installing and Importing Packages in R ---

# In R, packages extend the functionality of the base language.
# Commonly used packages include ggplot2 for visualization, dplyr for data manipulation, etc.

# --- Installing Packages ---
# To install a package in R, you use the install.packages() function.
# This downloads and installs the package from CRAN (the Comprehensive R Archive Network).

# Example: Installing the ggplot2 package for data visualization
install.packages("ggplot2")

# --- Importing (Loading) Packages ---
# After installing a package, you need to load it into your R session with the library() function.

# Example: Loading the ggplot2 package
library(ggplot2)

# Once the package is loaded, you can use its functions. For example:
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point()

# --- Understanding the Plus Sign (+) in ggplot2 ---

# In ggplot2, the plus sign (+) is used to "add layers" to the plot.
# You start by defining the basic plot structure using ggplot(), which sets the data and aesthetic mappings (aes).
# Then, you use + to add additional components or layers to the plot, such as geometries (e.g., geom_point() for scatter plots),
# scales, labels, themes, and more.

# Example:
ggplot(data = mtcars, aes(x = hp, y = mpg)) +  # This creates the basic plot object with hp on x-axis and mpg on y-axis.
  geom_point()  # The + adds a layer that plots points (scatter plot).

# The plus sign effectively "chains" different layers and components of the plot together.
# Without the + sign, R would not know to continue adding components, and your plot would be incomplete.

# --- Comparison to Python ---
# In Python, you use pip to install packages and import to load them.
# Example in Python:
# Installing a package with pip: pip install matplotlib
# Importing a package in Python: import matplotlib.pyplot as plt

# In R, install.packages() is equivalent to pip, and library() is equivalent to Python's import statement.

# --- Checking if a Package is Already Installed ---
# You can check if a package is installed before trying to load it. If it's not installed, you can install it programmatically.

# This block of code checks if ggplot2 is installed and loads it.
# If ggplot2 is not installed, it installs the package and then loads it.
if (!require(ggplot2)) {
  install.packages("ggplot2")  # Installs ggplot2 if not already installed
  library(ggplot2)             # Loads ggplot2 after installation
}
# If ggplot2 is already installed and successfully loaded, require() returns TRUE
# and the code inside the if block will NOT be executed.

# --- Conclusion ---
# Packages are essential to extend the functionality of R. Always use install.packages() to install,
# and library() to load the package into your session for use. This is very similar to Python, where
# pip installs packages, and import loads them for use in your scripts.

# In this bar plot, we visualize the number of cars based on their cylinder count.
library(ggplot2)

# Explanation:
# - `aes(x = factor(cyl))` means we are using the `cyl` column as the x-axis, but converting it to a factor (i.e., categorical data).
# - `geom_bar()` creates a bar plot, and `fill = "lightblue"` sets the color of the bars.
# - `theme_minimal()` is a ggplot2 theme for a clean plot design.
# - `labs()` adds labels to the plot, like title, x-axis, and y-axis labels.

ggplot(data = mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "lightblue") +
  theme_minimal() +
  labs(title = "Number of Cars by Cylinder Count", x = "Cylinders", y = "Count")

# --- Line Plot: Visualizing Historical Population Growth ---
# Now, we'll visualize the growth of population over time using a line plot.
# Line plots are useful for showing trends over time.

# Explanation:
# - `aes(x = Year, y = Population)` tells ggplot that the x-axis represents the year, and the y-axis represents population.
# - `geom_line()` creates a line plot, and `geom_point()` adds points to the line for each data point.
# - The colors and sizes of the lines and points are customized with the `color`, `size`, and `theme_minimal()` makes it clean and modern.

ggplot(data = historical_data, aes(x = Year, y = Population)) +
  geom_line(color = "blue", size = 1.2) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(title = "Population Growth Over Time", x = "Year", y = "Population")

# --- Scatter Plot: Visualizing Relationships ---
# Scatter plots are useful for visualizing the relationship between two continuous variables.
# Here, we visualize the relationship between horsepower (hp) and miles per gallon (mpg) in the mtcars dataset.

# Explanation:
# - `aes(x = hp, y = mpg)` means the x-axis represents horsepower and the y-axis represents miles per gallon.
# - `geom_point()` creates the scatter plot, with each point representing a car.
# - `color = "darkred"` sets the color of the points, and `size = 3` makes the points larger for clarity.

ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "darkred", size = 3) +
  theme_minimal() +
  labs(title = "Relationship between Horsepower and Miles per Gallon", x = "Horsepower", y = "Miles per Gallon")

# --- Domain-Relevant Example: Historical Data ---
# Finally, let's visualize the growth rate over time for the historical population data.

# Explanation:
# - Similar to the previous line plot, `aes(x = Year, y = GrowthRate)` maps the year to the x-axis and growth rate to the y-axis.
# - `geom_line()` and `geom_point()` create the line plot and add points to it.
# - This allows us to see the changes in growth rate over time.

ggplot(data = historical_data, aes(x = Year, y = GrowthRate)) +
  geom_line(color = "green", size = 1.2) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(title = "Population Growth Rate Over Time", x = "Year", y = "Growth Rate (%)")

# --- Save a Plot ---
# You can save any plot to a file with ggsave
# Explanation:
# - `ggsave()` saves the last plot created to a file. You can specify the filename and dimensions.

ggsave("population_growth.png", width = 8, height = 6)

# Create a plot with a light background
p <- ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "darkred", size = 3) +
  theme_minimal() +  # Ensures minimal, clean design
  theme(panel.background = element_rect(fill = "white"),   # Light panel background
        plot.background = element_rect(fill = "white"))    # Light plot background

p

# Save the plot to a file
ggsave("plot_light_background.png", plot = p, width = 8, height = 6)

# --- Interactive Plots in R ---

# You can create interactive plots in R using packages like `plotly` or `ggiraph`.
# These allow you to add features like hover tooltips, zooming, and clickable elements to your plots.

# --- Method 1: Using plotly for Interactive Plots ---

# Step 1: Install and load the plotly package
# plotly allows you to easily convert ggplot2 plots to interactive plots.
install.packages("plotly")
library(plotly)

# Step 2: Create a basic ggplot2 scatterplot
p <- ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "darkred", size = 3) +
  theme_minimal() +
  labs(title = "Interactive Scatterplot with plotly", x = "Horsepower", y = "Miles per Gallon")

# Step 3: Convert the ggplot2 plot to an interactive plotly plot
interactive_plot <- ggplotly(p)

# Step 4: Display the interactive plot in RStudio
# You can hover over points to see coordinates, zoom, and pan.
interactive_plot

# Step 5: Save the interactive plot as an HTML file for sharing
# The resulting file can be opened in a web browser with full interactivity.
htmlwidgets::saveWidget(interactive_plot, "interactive_plot_plotly.html")


# --- Method 2: Using ggiraph for Interactive Plots ---

# ggiraph allows for adding hover tooltips and clickable elements to ggplot2 plots.

# Step 1: Install and load the ggiraph package
install.packages("ggiraph")
library(ggiraph)

# Step 2: Create a scatterplot with interactive tooltips using ggiraph
# Here, we add tooltips to each point showing the car's row name (e.g., model name)
p <- ggplot(mtcars, aes(x = hp, y = mpg, tooltip = rownames(mtcars))) +
  geom_point_interactive(color = "darkred", size = 3) +  # Use geom_point_interactive for interactive points
  theme_minimal() +
  labs(title = "Interactive Scatterplot with ggiraph", x = "Horsepower", y = "Miles per Gallon")

# Step 3: Render the interactive plot in RStudio
# Hover over the points to see the car model as a tooltip.
girafe(ggobj = p)

# Step 4: Save the interactive plot as an HTML file
# This file can be opened in a web browser with full interactivity.
ggiraph::girafe(ggobj = p) %>%
  htmlwidgets::saveWidget("interactive_plot_ggiraph.html")

# --- Summary ---
# - `plotly`: Converts ggplot2 plots into interactive visualizations with hover effects, zooming, and panning.
# - `ggiraph`: Adds interactivity directly to ggplot2 plots, including hover tooltips and clickable elements.
# - Both packages allow saving the interactive plots as HTML files for easy sharing or embedding on websites.