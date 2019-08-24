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