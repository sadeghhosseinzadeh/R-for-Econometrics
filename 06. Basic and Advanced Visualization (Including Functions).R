# 6. Basic and Advanced Visualization (Including Functions)
# ==================================================================================================

# A. Visualization with ggplot2 
# B. How to Build a Function

# Loading the Data 
# --------------------------------------------------------------------------------------------------
setwd("D:\\DARS\\TA\\R\\II")  # Set working directory
library(wooldridge)  # Load the wooldridge package
data("hprice1")  # Load the wage1 dataset

# A. Visualization with ggplot2 
# --------------------------------------------------------------------------------------------------
# A word about mplot, qplot, and ggplot2 

# How to Install and Load ggplot2 
install.packages("ggplot2")  # Install ggplot2 package from CRAN
library(ggplot2)  # Load ggplot2 library

# Aesthetics
# --------------------------------------------------------------------------------------------------
# The foundation
ggplot(data = hprice1, aes(x = lotsize, y = price))

# Adding geometry
ggplot(data = hprice1, aes(x = lotsize, y = price)) + geom_point()


# Why do we need the geom part? 
a <- ggplot(data = hprice1, aes(x = lotsize, y = price))
# Point
a + geom_point()

# Line
a + geom_line()
# Multi-layer
a + geom_line() + geom_point()

# Overriding aes
a + geom_point(aes(x = sqrft))


# How to color it?
# Mapping
b <- ggplot(data = hprice1, aes(x = lotsize, y = price))
b + geom_point(aes(color = bdrms))

# Setting
b + geom_point(color = "darkred")

# Mapping
b <- ggplot(data = hprice1, aes(x = lotsize, y = price))
b + geom_point(aes(size = bdrms))

# Setting
b + geom_point(size = 3)

# Histograms and Density Charts
# --------------------------------------------------------------------------------------------------
g <- ggplot(data = hprice1, aes(x = price))
g + geom_histogram(binwidth = 30)

# Add color
g + geom_histogram(binwidth = 20, aes(fill = factor(bdrms)), colour = "black")

# Density plot 
ggplot(hprice1, aes(x = sqrft)) +
  geom_density(fill = "green")

# Layering 
# --------------------------------------------------------------------------------------------------
y <- ggplot(data = hprice1, aes(x = price))
y + geom_histogram(binwidth = 20, fill = "white", colour = "blue")

# Or
y <- ggplot()
y + geom_histogram(data = hprice1, binwidth = 20, aes(x = price), fill = "white", colour = "blue")

# Statistical Transformation  
# --------------------------------------------------------------------------------------------------
x <- ggplot(data = hprice1, aes(x = price, y = sqrft))
x + geom_point() + geom_smooth(fill = NA)

# Boxplot

# Boxplot showing price vs. number of bedrooms
ggplot(data = hprice1, aes(x = factor(bdrms), y = price)) +
  geom_boxplot(size = 1.2)

# Facets
# --------------------------------------------------------------------------------------------------
u <- ggplot(data = hprice1, aes(x = price))
u + geom_histogram(binwidth = 20, aes(fill = factor(bdrms)), colour = "black")

u + geom_histogram(binwidth = 20, aes(fill = bdrms), colour = "black") + facet_grid(bdrms ~ .)

# Scatterplot 
w <- ggplot(data = hprice1, aes(x = lotsize, y = price, colour = bdrms))
w + geom_point(size = 3)

# Facet 
w + geom_point(size = 3) + facet_grid(bdrms ~ .)
w + geom_point(size = 3) + facet_grid(bdrms ~ colonial)
w + geom_point(size = 3) + geom_smooth() + facet_grid(bdrms ~ colonial)

# Coordinates
# --------------------------------------------------------------------------------------------------
f <- ggplot(data = hprice1, aes(x = lotsize, y = price))
f + geom_point() 
f + geom_point() + xlim(0, 25000) + ylim(0, 400)

# For histogram we zoom
d <- ggplot(data = hprice1, aes(x = price))
d + geom_histogram(binwidth = 30) + coord_cartesian(ylim = c(0, 10))

# Theme
# --------------------------------------------------------------------------------------------------
o <- ggplot(data = hprice1, aes(x = lotsize, y = price))
k <- o + geom_point()
k

# Adding labels to axes
k + xlab("Lot Size (sqft)") + ylab("Price") + ggtitle("Lot Size vs Price") +
  theme(axis.title.x = element_text(colour = "blue", size = 14),
        axis.title.y = element_text(colour = "green", size = 14),
        axis.text.x = element_text(size = 12),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 12),
        plot.title = element_text(colour = "darkred", size = 16))

# B. How to Build a Function
# --------------------------------------------------------------------------------------------------

# Define a simple function
my_function <- function(argument1, argument2) {
  # Perform some operations
  result <- argument1 + argument2
  
  # Return the result
  return(result)
}

# Example usage of the function
my_function(5, 3)


#Example 2
create_plot <- function(data, x_var, y_var, x_label, y_label, plot_title) {
  ggplot(data = data, aes(x = .data[[x_var]], y = .data[[y_var]])) +
    geom_point() +
    xlab(x_label) +
    ylab(y_label) +
    ggtitle(plot_title) +
    theme(
      axis.title.x = element_text(colour = "blue", size = 14),
      axis.title.y = element_text(colour = "blue", size = 14),
      axis.text.x = element_text(size = 12),
      legend.title = element_text(size = 14),
      legend.text = element_text(size = 12),
      plot.title = element_text(colour = "darkred", size = 16)
    )
}

# Example usage of the function
# Assuming hprice1 is already loaded
create_plot(hprice1, "lotsize", "price", "Lot Size (sqft)", "Price", "Lot Size vs Price")

