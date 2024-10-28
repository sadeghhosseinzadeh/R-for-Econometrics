# First R Programming Section for Econometrics
# Advanced Econometrics I with Prof. Mehrara
# By Sadegh Hossein Zadeh, TA of the Course
# Contact: sadeghhosseinzadehba@gmail.com

# What We Are Going to Learn in This Section:

# How to Install R and RStudio
# 1. Principles of Programming
# 2. R Fundamentals
# 3. Matrices and How to Work with Them
# 4. Data Frames and How to Work with Them:


#  How to Install R and RStudio:
# ==================================================================================================
# For R, go to the website: https://cran.r-project.org/
# For RStudio, go to the website: https://www.rstudio.com/products/rstudio/download/


# 1. Principles of Programming
# ==================================================================================================

# A. Types of Variables and Using Variables
# --------------------------------------------------------------------------------------------------

# Integer
x <- 5L
x
typeof(x)  # Output: "integer"

# Double
y <- 2.7
typeof(y)  # Output: "double"

# Complex
z <- 6 - 4i
typeof(z)  # Output: "complex"

# Character
a <- "k"
typeof(a)  # Output: "character"

# Logical
x2 <- T
typeof(x2)  # Output: "logical"

x3 <- FALSE
typeof(x3)  # Output: "logical"

# Searching the variable
x  # Output: 5
print(x)
show(x)

# Performing operations with variables
var2 <- x + y
var2  # Output: 7.7

var3 <- x / y
var3  # Output: 1.851852

# String operations
name <- "Reza"
lastname <- "Hosseini"

fullname <- paste(name, lastname)
fullname  # Output: "Reza Hosseini"

# Basic calculations
2 + 3  # Output: 5
5 - 10  # Output: -5
2 * 5  # Output: 10
4 / 2  # Output: 2
2 ** 3  # Output: 8
2 ^ 3  # Output: 8
5 %% 2  # Output: 1
5 %/% 2  # Output: 2


# B. Logical Variables and Operators
# --------------------------------------------------------------------------------------------------

# Logical operators
# ==  (equal to)
# !=  (not equal to)
# <   (less than)
# >   (greater than)
# <=  (less than or equal to)
# >=  (greater than or equal to)
# !   (logical NOT)
# |   (logical OR)
# &   (logical AND)
# isTRUE(x)  (checks if x is TRUE)

# Examples of logical operations
5 < 6  # Output: TRUE
10 > 11  # Output: FALSE
12 == 36 / 3  # Output: TRUE

# Using isTRUE function
result <- 55 < 2
isTRUE(result)  # Output: FALSE
typeof(result)  # Output: "logical"

# Logical NOT operator
result2 <- !TRUE  # Output: FALSE
result2

# Logical OR (|) operator
# The result is TRUE if at least one of the conditions is TRUE

condition1 <- TRUE
condition2 <- F

result_or <- condition1 | condition2
result_or  # Output: TRUE

# Example with numeric comparisons
result_or2 <- (5 > 3) | (2 > 4)
result_or2  # Output: TRUE

# Logical AND (&) operator
# The result is TRUE only if both conditions are TRUE

result_and <- condition1 & condition2
result_and  # Output: FALSE

# Example with numeric comparisons
result_and2 <- (5 > 3) & (2 < 4)
result_and2  # Output: TRUE



# C. While and For Loops, If Statements
# --------------------------------------------------------------------------------------------------

# While Loop
# This loop will print "hello" indefinitely. Be cautious with infinite loops.
while (TRUE) {
  print("hello")
}

# Example of a while loop with a counter
counter <- 5
while (counter < 22) {
  print(counter)  # Output: 5 ... 22
  counter <- counter + 1
}

# For Loop
# This loop will print "econ" 12 times
for (i in 1:12) {
  print("econ")
}

# This loop will print "econ" 7 times
for (i in 5:11) {
  print("econ")
}

# If Statement

# Remove any existing variable named 'answer'
rm(answer)

# Generate a random number from a normal distribution
x <- rnorm(1)

# Check the value of x and assign a message to 'answer'
if (x > 1) {
  answer <- "greater than 1"
} else {
  if (x >= -1) {
    answer <- "between -1 and 1"
  } else {
    answer <- "less than -1"
  }
}


# A shorter way to write the same if statement
if (x > 1) {
  answer <- "greater than 1"
} else if (x >= -1) {
  answer <- "between -1 and 1"
} else {
  answer <- "less than -1"
}