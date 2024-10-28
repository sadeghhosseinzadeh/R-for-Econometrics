# 2. R Fundamentals:
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

# Dropping an item from a vector
# --------------------------------------------------------------------------------------------------

# Using Negative Indexing
vec <- c(1, 2, 3, 4, 5)
vec <- vec[-3]  # Removes the third element
print(vec)
# Output: 1 2 4 5

# Using Subsetting with Logical Conditions
vec <- c(1, 2, 3, 4, 5)
vec <- vec[vec != 3]  # Removes all elements equal to 3
print(vec)
# Output: 1 2 4 5

# Using setdiff Function
vec <- c(1, 2, 3, 4, 5)
vec <- setdiff(vec, 3)  # Removes element 3
print(vec)
# Output: 1 2 4 5

# Using which Function
vec <- c(1, 2, 3, 4, 5)
vec <- vec[-which(vec == 3)]  # Removes the element 3
print(vec)


# Adding Elements to a Vector
# ==================================================================================================

# Using c() Function
vec <- c(1, 2, 3)
vec <- c(vec, 4)  # Adds the element 4 to the end of the vector
print(vec)
# Output: 1 2 3 4

# Using append() Function
vec <- c(1, 2, 3)
vec <- append(vec, 4)  # Adds the element 4 to the end of the vector
print(vec)
# Output: 1 2 3 4

# Using append() Function to Add an Element at a Specific Position
vec <- c(1, 2, 3)
vec <- append(vec, 4, after = 1)  # Adds the element 4 after the first position
print(vec)
# Output: 1 4 2 3

# Using index assignment to add an element
vec <- c(1, 2, 3)
vec[length(vec) + 1] <- 4  # Adds the element 4 at the end of the vector
print(vec)
# Output: 1 2 3 4

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

?c()
# Creating a character vector
t <- c("a", "b", "c")
t  # Output: "a" "b" "c"

# Combining values into a vector
combined_vector <- c(1, 2, 3)
combined_vector  # Output: 1 2 3

# Generating a sequence
sequence <- seq(from = 2, to = 22)
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



#EX 1 
#Objective: Practice working with vectors, loops, and conditional statements in R.

# Instructions:
#   
# Create a vector of 10 random values using the rnorm() function.
# Write a loop to go through each value in the vector.
# Inside the loop:

# Take the absolute value of the number.
# If the rounded value of the number is 1 or 2, print the absolute value of the number raised to the power of 2.
# If the rounded value is 0, print zero.
# If it is none of these, print the original number.

# Run this line of code first to get the same results
set.seed(123)
#2 functions you will need: 
abs(2)
round()













#EX 1 answer

# Step 1: Create a vector of 10 random values
set.seed(123)  
random_values <- rnorm(10)
print("Random Values:")
print(random_values)

# Step 2: Loop through each value in the vector
for (value in random_values) {
  abs_value <- abs(value)
  rounded_value <- round(abs_value)
  
  # Step 3: Perform the required checks and operations
  if (rounded_value == 0) {
    print("0")
  } else if (rounded_value == 1 | rounded_value == 2) {
    squared_value <- abs_value^2
    print(squared_value)
  } else {
    print(value)
  }
}