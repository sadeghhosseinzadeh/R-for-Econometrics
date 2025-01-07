# 4. Data Frames and How to Work with Them:
# ==================================================================================================

# A. Importing and Exploring Data

# Method 1: Importing data using a file chooser dialog
titanic <- read.csv(file.choose())

# Method 2: Importing data from a working directory
# Get the current working directory
getwd()

# Change the working directory
# For Windows:
setwd("D:\\DARS\\TA\\R")
# For Mac:
setwd("/path/to/your/directory")  # Replace with the actual path
getwd()

# Import data from a specific path
titanic <- read.csv("D:/DARS/TA/R/titanic.csv")
# Or, if the file is in the working directory
rm(titanic)  # Remove any existing 'titanic' object
titanic <- read.csv("titanic.csv")

# Exploring the data
titanic          # Display the entire dataset
nrow(titanic)    # Number of rows
ncol(titanic)    # Number of columns
head(titanic, n=10)  # First 10 rows
tail(titanic, n=5)   # Last 5 rows
str(titanic)    # Structure of the dataset
summary(titanic) # Summary statistics

# Using the $ operator to access columns
titanic[3, 4]        # Value at 3rd row, 4th column
titanic[3, "Name"]    # Value at 3rd row, 'Name' column
titanic$Survived      # Entire 'Survived' column
titanic$Age[3]        # 3rd value in 'Age' column
titanic[, "Age"]      # Entire 'Age' column

is.factor(titanic$Sex)
titanic$Sex <- as.factor(titanic$Sex)

# Finding categories (levels) in a factor column
levels(titanic$Sex)  # Replace 'colname' with the actual column name

# B. Basic Operations with Data Frames

# Subsetting data frames
titanic[1:5, ]       # First 5 rows
titanic[c(1, 5), ]   # 1st and 5th rows


# Checking if subsets are data frames
is.data.frame(titanic[1, ])   # Single row subset
is.data.frame(titanic[, 1])   # Single column subset
is.data.frame(titanic[, 1, drop = FALSE])  # Single column subset, keeping it as a data frame

# Element-wise multiplication of columns
titanic$Age * titanic$Survived

# Adding a new column
titanic$new_column <- titanic$Age + titanic$Survived
head(titanic, n=5)

# Adding another new column with a sequence
titanic$new_column2 <- 1:3
head(titanic, n=10)

# Removing a column
titanic$new_column2 <- NULL

# Filtering Data Frames

# Display the first 5 rows
head(titanic, 5)

# Create a filter for ages less than 20
filter <- titanic$Age < 20  

# Apply the filter to the data frame
titanic[filter, ]

# Alternative filtering methods
titanic[titanic$Age > 22, ]
titanic[titanic$Age > 22 & titanic$Pclass == 2, ]
titanic[titanic$Sex == "female", ]

# Find all information about a specific row
titanic[3, ]  # Replace 3 with the row number you are interested in

# Building Data Frames

# Create three long vectors
a <- 400:500
b <- 300:400
c <- 200:300

# Combine vectors into a data frame
df <- data.frame(a, b, c)

# Display the first few rows of the data frame
head(df)

# Rename columns
colnames(df) <- c("g", "f", "r")

# Alternatively, create the data frame with named columns
rm(df)
df <- data.frame(g = a, f = b, r = c)

# Works also for rbind and cbind functions

# Merging Data Frames

# Display the first few rows of both data frames
data2 <- read.csv("D:\\DARS\\TA\\R\\titanic2.csv")
head(titanic)
head(data2)

# Merge the data frames by matching columns
merged <- merge(titanic, data2, by.x = "PassengerId", by.y = "ID")
head(merged)










