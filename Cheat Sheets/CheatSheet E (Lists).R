# Lists are a sort of super-objects that can contain matrices, vectors, data-frames...
# Objects do not need to be related

# Adding data: 
# Vector
my_vector <- 1:10
# Matrix
my_matrix <- matrix(1:9, ncol = 3)
# DataFrame
my_df <- mtcars[1:10,]

# Constructing a list with these elements: 
my_list <- list(my_vector, my_matrix, my_df)
my_list

# Renaming elements in my list 
names(my_list) <- c("My Vector", "My Matrix", "My Data Frame")
my_list

# Selecting elements in the list
my_list[[1]]
my_list$`My Data Frame`$mpg
my_list[[3]][2]

# Adding elements to the list 
add_vector <- c(1, 2, 3)
full_list <- c(my_list, hello = add_vector) # How do you add a vector, but not as separate elements?
full_list

