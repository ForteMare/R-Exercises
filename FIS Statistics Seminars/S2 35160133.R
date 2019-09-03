# STATISTICS 2 SEMINAR WORK - R CODE 

# ----------------- 1. ARITHMETIC MEAN -----------------

# 1A - Import data into R 
imported_raw_data <- read.csv(file = "C:\\Users\\Sapun\\Desktop\\S\\APPDATA.csv", 
                              header = TRUE, sep = ',')
#View(imported_raw_data)

# Renaming variables 
assigned_vars <- c("price", "cont_rating", "prime_genre", "lang.num")
renamed_vars <- c("price", "PG", "genre", "languages") # PG is short for Parental Guidance

my_data <- imported_raw_data[assigned_vars]
my_data

names(my_data) <- renamed_vars
View(my_data)

# Abbreviated 
y_var <- my_data$price
x_var <- my_data$languages

# 1B - Arithmetic mean for numeric variables
library(psych)
describe(my_data[c("price", "languages")])

t.test(x_var, mu = 1.49, conf.level = 0.95, alternative = "less")

# ------------------------------------------------------

