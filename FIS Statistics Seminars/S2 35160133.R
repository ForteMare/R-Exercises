# STATISTICS 2 SEMINAR WORK - R CODE 

# ----------------- 1. ARITHMETIC MEAN -----------------

# 1A - Import data into R 
imported_raw_data <- read.csv(file = "C:\\Users\\Sapun\\Desktop\\S\\APPDATA.csv", 
                              header = TRUE, sep = ',')
View(imported_raw_data)

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

# 1B1
library(psych)
describe(my_data[ c("price", "languages")])

# 1B2
#t.test(y_var, mu = 1.49, conf.level = 0.95, alternative = "less")
#t.test(x_var, mu = 4.63, conf.level = 0.95, alternative = "less")
# NOT WORKING, CORRECT LATER! 

# 1C

# Collect relevant variables

# 95% interval
alpha <- 0.05

n <- length(x_var)
avg <- mean(x_var)
st_dev <- sd(x_var)
a_var <- qnorm(1 - alpha)

# Print data for overview # CHECK!
n; 
avg; 
st_dev; 
a_var; 

st_dev + (a_var * st_dev / sqrt(n)) # Upper interval formula
# ----------------------------------------------------

# 2. ---------------- ARITHMETIC MEAN AND SAMPLES 

# 2A

# Create new temp variables 
z1 <- my_data$PG
z2 <- my_data$genre

freq(z1, plot = FALSE)
freq(z2, plot = FALSE)

# PG RATING 
prop.test(32, 200, p = 0.25, alternative = "greater")

# GENRE
prop.test(114, 200, p = 0.5, alternative = "greater")

# 2B 
alfa <- 0.05
z <- 1.65
zalfa2 <- 1.96
m <- 114
n <- 200
p <- m/n; 
p

sp <- p - zalfa2 * sqrt((p * (1 - p)) / n) 
sp

zg <- p + zalfa2 * sqrt((p * (1 - p)) / n)
zg
# ------------------------------------------------------


# ---------- 3. TWO INDEPENDENT SAMPLES ----------------

# ------------------------------------------------------

