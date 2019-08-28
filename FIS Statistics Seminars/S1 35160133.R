# ------ 1. DESCRIPTION AND EDITING OF DATA ------

# Importing the file: NOTICE THIS IS A TEMPORARY LOCATION!
imported_raw_data <- read.csv(file = "C:\\Users\\Sapun\\Desktop\\S\\ABC.csv", header = TRUE, sep = ',')

# Display the imported file 
imported_raw_data

# Display data
#View(imported_raw_data) 

# Editing variables
assigned_vars <- c("price", "cont_rating", "prime_genre", "lang.num")
renamed_vars <- c("price", "pg", "genre", "languages") # PG is short for Parental Guidance

my_data <- imported_raw_data[assigned_vars]
my_data

names(my_data) <- renamed_vars
View(my_data)

# -----------------------------------------------------------------

# ------ 2. NUMERIC VARIABLE ANALYSIS OF PRICE AND LANGUAGES ------
# Assagning new variables for brevity: 
y_var <- my_data$price
x_var <- my_data$languages

summary(y_var)

range(y_var) # Returns Range of Values
diff(range(y_var)) # Returns Lagged Difference
IQR(y_var) # Returns the Inter Quartile Range
sd(y_var) # Returns the Standard Deviation
var(y_var) # Returns Correlation, Variance, and Covariance

summary(x_var)

range(x_var) # Returns Range of Values
diff(range(x_var)) # Returns Lagged Difference
IQR(x_var) # Returns the Inter Quartile Range
sd(x_var) # Returns the Standard Deviation
var(x_var) # Returns Correlation, Variance, and Covariance

# Create a histogram and a boxplot for numeric variables
hist(y_var) # Create a histogram 
boxplot(y_var) # Create a boxlot 

hist(x_var) # Create a histogram TURNED OFF
boxplot(x_var) # Create a boxlot TURNED OFF



# Plot Diagram 
plot(x_var, y_var, ylab = "Price", xlab = "Languages", 
     main = "Plot Diagram for Variables Price and Languages")

# Pearson Correlation Coefficient calculation
cor.test(x_var, y_var, method = "pearson") # Order of X and Y does not matter

# Relationships between numeric variables
lm(y_var~x_var, data = my_data) # This is the correct order

# Plotting the graph with correlations
plot(x_var, y_var, ylab = "Price", xlab = "Languages", 
     main = "Plot Diagram for Variables Price and Languages")
abline(lm(y_var~x_var, data = my_data), col = "green")

# Calculating Determination coefficient
summary(lm(y_var~x_var, data = my_data))

# -----------------------------------------------------------------

# ------ 3. DESCRIPTIVE VARIABLE ANALYSIS OF GENRE AND CONTENT RATING ------

#Creating abbreviated variables
a <- my_data$pg
b <- my_data$genre


# Displaying frequencies for PG rating, not adequate
table(a)

# Displaying frequencies for genre
table(b)

# Graphical display of information with barplot
barplot(prop.table(table(a)), main = "Structure of PG Rating", 
        col = rainbow(4), ylab = "Percentage", xlab = "PG Rating")

# Graphical display of information with piechart
pie(prop.table(table(b)), main = "Structure of Genre", col = c("yellow", "cyan"))

# Making a contingency table 
addmargins(table(a, b))

# Creating double structure - 3.E 
addmargins(prop.table(table(a, b)) * 100)

# Display of double structure
dt <- prop.table(table(b, a)) * 100
barplot(dt, col = c("blue", "red"), legend.text = c("Games", "Other"), 
        main = "Structure of Genre and PG Rating", xlab = "PG Rating", ylab = "Percentage")

# Q3 - F 
calc <- table(b, a)
chi <- chisq.test(calc)
chi$expected

# Q3 - G
assocstats(calc)

# -------------------------- FINISH -----------------------------------
