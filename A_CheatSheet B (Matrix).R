# Matrix is a collection of elements of the *same data type*. Numeric, char, boolean. Arranged to a fixed number of rows!

# Here is how to create a matrix:
# 1. What elements will make the matrix
# 2. TRUE or FALSO on whether it is made by rows
# 3. Third argument is how many rows it will have
matrix(1:10, byrow = TRUE, nrow = 2)

# Alternatively
matrix(1:10, byrow = FALSE, nrow = 2)
matrix(1:10, byrow = FALSE, ncol = 2)