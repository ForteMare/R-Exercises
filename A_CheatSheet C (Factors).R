# Factors are used for categorical variables, like gender
gender_vector <- c("Male", "Female", "Female", "Male", "Male")

# Use a factor() function to make a factor
factor_gender_vector <- factor(gender_vector)
factor_gender_vector #Displays what factors exist within the vector

# **NOTICE:**
# Nominal categorical variable is without an implied order, like gender
# Ordinal categorical variable is ordered, such as temperature (low, med., high)

# Ordering variables
temperature_vector <- c("LOW", "MEDIUM", "HIGH")
factor_temperature_vector <- factor(temperature_vector, ordered = TRUE, levels = temperature_vector)
# levels = temperature vector is short-hand for c(...)
factor_temperature_vector

# There is a way to rename factors!
levels(factor_temperature_vector) <- c("lo", "med", "hi")
factor_temperature_vector

# To see summary of the data use the following function
summary(factor_gender_vector)

# Another example for ordering factors 
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))
factor_speed_vector

# Choosing elements in a factor vector
da2 <- factor_speed_vector[2]
da5 <- factor_speed_vector[5]

da2 > da5







