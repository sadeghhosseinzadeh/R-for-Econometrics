
# 5. Data Handling with R Packages and Data Types
# ==================================================================================================

# A. Understanding R Packages
# B. Using the Wooldridge Package for Datasets
# C. Essential Packages
# D. Different Types of Data in Econometrics


# A. Understanding R Packages
# --------------------------------------------------------------------------------------------------
setwd("D:\\DARS\\TA\\R\\II")  # Set working directory

# What is a package?
# A package in R is a bundle of R functions, compiled code, and sample data. It extends R's functionality by adding new features and tools.

# Installing a package:
# Install the 'ggplot2' package for data visualization
install.packages("ggplot2")

# Loading a package into the R environment:
# Load the 'ggplot2' library
library(ggplot2)

# Exploring package documentation:
# Access the 'ggplot2' help documentation
help(package = "ggplot2")
?ggplot2


# B. Using the Wooldridge Package for Datasets
# --------------------------------------------------------------------------------------------------

# Description:
# The `wooldridge` package contains datasets from Jeffrey Wooldridge's textbooks on econometrics, making it an excellent resource for applied econometrics.

# Installing and loading the package:
# Install the 'wooldridge' package from CRAN
install.packages("wooldridge")
#or
install.packages("remotes")
remotes::install_github("JustinMShea/wooldridge")

# Load the 'wooldridge' library
library(wooldridge)

# Load a dataset (e.g., wage1)
data(wage1)

# View the first few rows
head(wage1)

# Explore the structure and summary of the dataset
str(wage1)
summary(wage1)

# C. Essential Packages
# --------------------------------------------------------------------------------------------------

# Install and load necessary libraries
install.packages("magrittr")
install.packages("tidyverse")

library(magrittr)   # For the pipe operator
library(tidyverse)  # For data manipulation functions

# Load the dataset
data("wage1", package = "wooldridge")

# Basic Example: Selecting Columns

# Select specific columns without the pipe operator
selected_data <- select(wage1, wage, educ, exper)
head(selected_data)

# Select specific columns with the pipe operator
wage1 %>% 
  select(wage, educ, exper) %>% 
  head()
# The pipe operator (%>%) passes the result of one function directly into the next.

# Filtering Rows

# Filter rows where wage is greater than 10 with the pipe operator
wage1 %>% 
  filter(wage > 10) %>% 
  head()
# filter() subsets the data based on the condition wage > 10.

# Creating New Variables

# Create a new variable logwage with the pipe operator
wage1 %>% 
  mutate(logwage = log(wage)) %>% 
  head()
# mutate() creates new variables or transforms existing ones.

# Summarizing Data

# Calculate mean wage with the pipe operator
wage1 %>% 
  summarise(mean_wage = mean(wage, na.rm = TRUE))
# summarise() calculates summary statistics for the data.

# Grouping and Summarizing Data

# Group by female and calculate mean wage for each group with the pipe operator
wage1 %>% 
  group_by(female) %>% 
  summarise(mean_wage = mean(wage, na.rm = TRUE))
# group_by() groups the data by 'female', and summarise() calculates the mean wage for each group.

# Arranging Data

# Arrange data by wage in descending order with the pipe operator
wage1 %>% 
  arrange(desc(wage)) %>% 
  head()
# arrange() sorts the data by wage in descending order.

# Advanced Pipe Operations

# Compound Assignment Pipe Operator (%<>%)

# Create a new variable logwage and assign the result back to wage1 using the compound assignment pipe operator
wage1 %<>% mutate(logwage = log(wage))
# %<>% pipes the left-hand side value through the right-hand side expression and assigns the result back to the left-hand side variable.

# Tee Operator (%T>%)

# Print intermediate results without affecting the pipeline using the tee operator
wage1 %>%
  mutate(logwage = log(wage)) %T>%
  head(10) %>%
  summarise(mean_logwage = mean(logwage, na.rm = TRUE))
# %T>% is used for printing or plotting intermediate results without affecting the overall pipeline.

# Exposition Pipe Operator (%$%)

# Refer to the columns of the dataset directly using the exposition pipe operator
wage1 %>% 
  filter(female == 1) %$%
  mean(wage, na.rm = TRUE)
# %$% exposes the columns of the data frame to the function on the right-hand side.


# D. Different Types of Data in Econometrics
# --------------------------------------------------------------------------------------------------

# 1. Cross-sectional Data
# Cross-sectional data consists of observations on multiple entities at a single point in time or over a single time period.

# Load the cross-sectional dataset
data("wage1")

# Select specific variables
wage1 %>% 
  select(wage, lwage, educ, exper, expersq, tenure, married, female) %>%
  head(10)
  

# 2. Time Series Data
# Time series data consists of observations on a single entity over multiple time periods.

# Load the time series dataset
data("prminwge")

# Select specific variables
prminwge %>% select(year, avgmin, avgcov, prunemp, prgnp) %>%
  head(10)
table(prminwge$year)

# 3. Pooled Cross Sections
# Pooled cross-sectional data involves combining cross-sectional data from different time periods. Each observation is a different entity at each time period.

# Load the pooled cross sections dataset
data("hprice3")

# Select specific variables
hprice3 %<>% select(year, y81, price, lprice, rooms, baths)

table(hprice3$year)

# 4. Panel Data
# Panel data consists of observations on multiple entities over multiple time periods. Each entity is observed at multiple time periods.

# Load the panel dataset
data("wagepan")

# Select specific variables
wagepan %<>% select(nr, year, lwage, exper, educ, hours)

table(wagepan$year)
