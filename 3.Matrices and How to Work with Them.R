# 4. Matrices and How to Work with Them:
# ==================================================================================================

# A. Matrices
# --------------------------------------------------------------------------------------------------

# How to build matrices

# First approach: Using matrix() function
matrix_example <- matrix(1:6, nrow = 2, ncol = 3)
print(matrix_example)
# Output:
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

# Using rbind() function
rbind_example <- rbind(c(1, 2, 3), c(4, 5, 6))
print(rbind_example)
# Output:
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

# Using cbind() function
cbind_example <- cbind(c(1, 2, 3), c(4, 5, 6))
print(cbind_example)
# Output:
#      [,1] [,2]
# [1,]    1    4
# [2,]    2    5
# [3,]    3    6

# How to access each element in the matrix

matrix_example[1, ]
matrix_example[, 2]
element <- matrix_example[1, 2]
print(element)
# Output: 3

matrix_example[1:2, 2:3]
matrix_example[c(1,3),]
matrix_example[c("name of the row",""),]


# How to name dimensions and rows and columns for vectors and matrices

# Using names() for vectors
vector_example <- c(1, 2, 3)
names(vector_example) <- c("A", "B", "C")
print(vector_example)
# Output: 
# A B C 
# 1 2 3

# Clearing names
names(vector_example) <- NULL
print(vector_example)
# Output: 
# [1] 1 2 3

# Using rownames() and colnames() for matrices
rownames(matrix_example) <- c("Row1", "Row2")
colnames(matrix_example) <- c("Col1", "Col2", "Col3")
colnames(matrix_example)
print(matrix_example)
# Output:
#       Col1 Col2 Col3
# Row1    1    3    5
# Row2    2    4    6

# How to access elements in a matrix with dimension names
matrix_example["Row1", 2]
matrix_example[2, "Col2"]
element_with_names <- matrix_example["Row1", "Col2"]
print(element_with_names)
# Output: 3


# B. Matrix Operations
# --------------------------------------------------------------------------------------------------
# Adding Matrices


# Creating two matrices
matrix1 <- matrix(1:9, nrow = 3, ncol = 3)
matrix2 <- matrix(9:1, nrow = 3, ncol = 3)

# Adding the matrices element-wise
add_result <- matrix1 + matrix2
print(add_result)
# Output:
#      [,1] [,2] [,3]
# [1,]   10   10   10
# [2,]   10   10   10
# [3,]   10   10   10

# Subtracting Matrices

# Subtracting the matrices element-wise
sub_result <- matrix1 - matrix2
print(sub_result)
# Output:
#      [,1] [,2] [,3]
# [1,]   -8   -6   -4
# [2,]   -2    0    2
# [3,]    4    6    8

# Dividing and Multiplying Matrices


# Element-wise multiplication
mul_result <- matrix1 * matrix2
print(mul_result)
# Output:
#      [,1] [,2] [,3]
# [1,]    9   16   21
# [2,]   24   25   24
# [3,]   21   16    9

# Element-wise division
div_result <- matrix1 / matrix2
print(div_result)
# Output:
#      [,1] [,2]      [,3]
# [1,]  0.1  0.5 3.0000000
# [2,]  2.0  1.0 0.6666667
# [3,]  1.75 2.0 9.0000000

# Mathematical Matrix Multiplication


# Matrix multiplication (dot product)
matmul_result <- matrix1 %*% matrix2
print(matmul_result)
# Output:
#      [,1] [,2] [,3]
# [1,]   30   24   18
# [2,]   84   69   54
# [3,]  138  114   90


# C. Visualizing with matplot
?matplot