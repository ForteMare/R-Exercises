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
total_film_earnings <- rowSums(star_wars_matrix)
total_film_earnings
total_region_earnings <- colSums(star_wars_matrix)
total_region_earnings

# Adding columns to matrix
original_wars_matrix <- cbind(star_wars_matrix, total_film_earnings)
original_wars_matrix

# ------ ADDING PREQUELS ------
box_office_prequels <- c(474.5, 552.5, 310.7, 338.7, 380.3, 468.5)
names_prequels <- c("The Phantom Menace", "Attack of The Clones", "Revenge of The Sith")
star_wars_matrix2 <- matrix(box_office_prequels, byrow = TRUE, nrow = 3)
colnames(star_wars_matrix2) <- region
rownames(star_wars_matrix2) <- names_prequels

star_wars_matrix2
#------------------------------

# Combining originals and prequels. Notice we use matrix without sums! 
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)
all_wars_matrix
