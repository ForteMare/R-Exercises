# Matrix is a collection of elements of the *same data type*. Numeric, char, boolean. Arranged to a fixed number of rows!

# Here is how to create a matrix:
# 1. What elements will make the matrix
# 2. TRUE or FALSO on whether it is made by rows
# 3. Third argument is how many rows it will have
matrix(1:10, byrow = TRUE, nrow = 2)

# Alternatively
matrix(1:10, byrow = FALSE, nrow = 2)
matrix(1:10, byrow = FALSE, ncol = 2)


# Adding Star Wars data from DataCamp.
# Box office in millions. First is domestic B.O. and second Intl. 
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Compiling into matrix
# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)
box_office

# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE)
star_wars_matrix

# Naming rows and columns in SW matrix
region <- c("US", "Intl.")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of The Jedi")

colnames(star_wars_matrix) <- region
rownames(star_wars_matrix) <- titles

star_wars_matrix

# Calculate sums by matrix row and column!
worldwide_total <- rowSums(star_wars_matrix)
worldwide_total
total_worldwide <- colSums(star_wars_matrix)
total_worldwide
