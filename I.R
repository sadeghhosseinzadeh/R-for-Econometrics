# First R Programming Section for Econometrics
# Advanced Econometrics I with Prof. Mehrara
# By Sadegh Hossein Zadeh, TA of the Course
# Contact: sadeghhosseinzadehba@gmail.com

# What We Are Going to Learn in This Section:

# 1. How to Install R and RStudio
# 2. Principles of Programming
# 3. R Fundamentals
# 4. Matrices and How to Work with Them
# 5. Data Frames and How to Work with Them

# 1. How to Install R and RStudio:
# ==================================================================================================
# For R, go to the website: https://cran.r-project.org/
# For RStudio, go to the website: https://www.rstudio.com/products/rstudio/download/

# 2. Principles of Programming
# ==================================================================================================

# A. Types of Variables and Using Variables
# --------------------------------------------------------------------------------------------------
# Integer
x <- 5L
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

name <- "Reza"
lastname <- "Hosseini"

fullname <- paste(name, lastname)
fullname # Output: "Reza Hosseini"

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
condition2 <- FALSE

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






# 3. R Fundamentals:
# ==================================================================================================

# A. Vectors and Vector Operations
# --------------------------------------------------------------------------------------------------

# Creating a numeric vector
Vector <- c(1, 2, 33, 4, 777)
Vector  # Output: 1 2 33 4 777

# Checking the type of the vector
is.numeric(Vector)  # Output: TRUE
is.integer(Vector)  # Output: FALSE
is.double(Vector)   # Output: TRUE

# Creating another numeric vector (corrected syntax)
v2 <- c(4, 11, 333, 0)
is.numeric(v2)  # Output: TRUE
is.integer(v2)  # Output: FALSE
is.double(v2)   # Output: TRUE

# Creating a character vector (corrected syntax)
v3 <- c("R", "R15", "word", "3")
v3  # Output: "R" "R15" "word" "3"
is.numeric(v3)  # Output: FALSE
is.integer(v3)  # Output: FALSE
is.double(v3)   # Output: FALSE

# Two more ways to create a vector
# Using seq() function to create a sequence
seq(2, 31)  # Output: 2 3 4 ... 31
2:31        # Output: 2 3 4 ... 31

# Creating a sequence with a step
v4 <- seq(2, 31, 3)
v4  # Output: 2 5 8 11 14 17 20 23 26 29

# Using rep() function to replicate values
v5 <- rep(2, 100)
rep("s", 15)  # Output: "s" "s" "s" ... (15 times)

# Replicating a vector
b <- rep(v4, 3)
b  # Output: 2 5 8 11 14 17 20 23 26 29 2 5 8 11 14 17 20 23 26 29 2 5 8 11 14 17 20 23 26 29

# Accessing elements using brackets
f <- c("A", "B", "C", "D", "E", "F")
f  # Output: "A" "B" "C" "D" "E" "F"

f[1]  # Output: "A"
f[3]  # Output: "C"
f[-1]  # Output: "B" "C" "D" "E" "F"
ff <- f[-2]
ff  # Output: "A" "C" "D" "E" "F"
f[1:4]  # Output: "A" "B" "C" "D"

f[c(1, 2, 3)]  # Output: "A" "B" "C"
f[c(-2, -3)]  # Output: "A" "D" "E" "F"
f[-2:-5]  # Output: "A" "F"

# Why vectors?
# Generating a vector of random numbers
x1 <- rnorm(4)
x1  # Output: A vector of 4 random numbers

# Using a for loop to print each element
for (i in x1) {
  print(i)
}

# Printing each element individually
print(x1[1])
print(x1[2])
print(x1[3])
print(x1[4])

# Conventional loop to print each element
for (j in 1:4) {
  print(x1[j])
}

# Vectorized operations
n <- 10000000
e1 <- rnorm(n)
e2 <- rnorm(n)

# Vectorized multiplication
e3 <- e1 * e2

# De-vectorized multiplication
d <- rep(NA, n)
for (i in 1:n) {
  d[i] <- e1[i] * e2[i]
}


# B. Functions in R
# --------------------------------------------------------------------------------------------------

# Generating random numbers
# rnorm() generates 'n' random numbers from a normal distribution with specified mean and standard deviation
random_numbers <- rnorm(n = 4, sd = 6)
random_numbers  # Output: A vector of 4 random numbers with standard deviation 6

# Creating a character vector
t <- c("a", "b", "c")
t  # Output: "a" "b" "c"

# Combining values into a vector
combined_vector <- c(1, 2, 3)
combined_vector  # Output: 1 2 3

# Generating a sequence
sequence <- seq(from = 2, to = 22, along.with = t)
sequence  # Output: 2 12 22

# Replicating values
replicated_values <- rep(1:3, times = 5)
replicated_values  # Output: 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3

# Printing values
print("Hello, R!")  # Output: "Hello, R!"

# Checking types of variables
is_numeric <- is.numeric(t)
is_integer <- is.integer(t)
is_double <- is.double(t)
is_character <- is.character(t)

# Output: FALSE for numeric, integer, and double; TRUE for character
is_numeric  # Output: FALSE
is_integer  # Output: FALSE
is_double  # Output: FALSE
is_character  # Output: TRUE

# Checking the type of an object
type_of_t <- typeof(t)
type_of_t  # Output: "character"

# Basic statistical functions
numbers <- c(1, 2, 3, 4, 5)

sum(numbers)  # Output: 15
prod(numbers)  # Output: 120
mean(numbers)  # Output: 3
median(numbers)  # Output: 3
sd(numbers)  # Output: 1.581139
min(numbers)  # Output: 1
range(numbers)  # Output: 1 5
sqrt(16)  # Output: 4
paste("Hello", "world!")  # Output: "Hello world!"
summary(numbers)  # Output: Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#         1.0     2.0     3.0     3.0     4.0     5.0

#How to get help?

help(sum)
?sqrt

# C. Packages in R
# --------------------------------------------------------------------------------------------------

#How to install

install.packages("ggplot2")
?qplot()
?ggplot()

library(ggplot2)

# 4. Matrices and How to Work with Them:
# ==================================================================================================

# A. Matrices and Matrix Operations
# B. Visualizing with matplot

# 5. Data Frames and How to Work with Them:
# ==================================================================================================

# A. Importing and Exploring Data
#method 1
data1 <- read.csv(file.choose())
#method 2
getwd()


#windows:
setwd("c....")
#mac:
setwd("")
getwd()
rm(data1)

#exploring:
data1
nrow(data1)
ncol(data1)
head(data1, n=10)
tail(data1,n=5)
str(data1)
summary(data1)

# B. Basic Operations with Data Frames
# C. Visualizing with qplot
