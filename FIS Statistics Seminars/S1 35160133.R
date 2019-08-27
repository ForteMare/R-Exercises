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
#View(my_data)

# -----------------------------------------------------------------

# ------ 2. NUMERIC VARIABLE ANALYSIS OF PRICE AND LANGUAGES ------
# Assagning new variables for brevity: 
x1 <- my_data$price
x2 <- my_data$languages

summary(x1)

range(x1) # Returns Range of Values
diff(range(x1)) # Returns Lagged Difference
IQR(x1) # Returns the Inter Quartile Range
sd(x1) # Returns the Standard Deviation
var(x1) # Returns Correlation, Variance, and Covariance

summary(x2)

range(x2) # Returns Range of Values
diff(range(x2)) # Returns Lagged Difference
IQR(x2) # Returns the Inter Quartile Range
sd(x2) # Returns the Standard Deviation
var(x2) # Returns Correlation, Variance, and Covariance

# Create a histogram and a boxplot for numeric variables
hist(x1) # Create a histogram TURNED OFF
boxplot(x1) # Create a boxlot TURNED OFF

#hist(x2) # Create a histogram TURNED OFF
boxplot(x2) # Create a boxlot TURNED OFF

# Plotting the graph 
plot(x1, x2, xlab = "App Price", ylab = "Number of Languages", 
     main = "Plot Diagram for Variables Price and No. of Languages")

# Pearson Correlation Coefficient calculation
cor.test(x1, x2, method = "pearson")

# Relationships between numeric variables
lm(x1~x2, data = my_data)

# Plotting the graph with correlations
plot(x1, x2, xlab = "App Price", ylab = "Number of Languages", 
     main = "Plot Diagram for Variables Price and No. of Languages")
abline(lm(x1~x2, data = my_data), col = "blue")

# Calculating Determination coefficient
summary(lm(x1~x2, data = my_data))

# -----------------------------------------------------------------

# ------ 3. DESCRIPTIVE VARIABLE ANALYSIS OF GENRE AND CONTENT RATING ------

#Creating abbreviated variables
y1 <- my_data$pg
y2 <- my_data$genre


# Displaying frequencies for PG rating, not adequate
table(y1)

# Displaying frequencies for genre
table(y2)

# Graphical display of information with barplot
barplot(prop.table(table(y1)), main = "Structure of PG Rating", 
        col = rainbow(4), ylab = "Percentage", xlab = "PG Rating")

# Graphical display of information with piechart
pie(prop.table(table(y2)), main = "Structure of Genre", col = c("yellow", "cyan"))

# Making a contingency table 
addmargins(table(y1, y2))

# Creating double structure - 3.E 
addmargins(prop.table(table(y1, y2)) * 100)

# Display of double structure
dt <- prop.table(table(y2, y1)) * 100
barplot(dt, col = c("blue", "red"), legend.text = c("Games", "Other"), 
        main = "Structure of Genre and PG Rating", xlab = "PG Rating", ylab = "Percentage")

# Q3 - F 
calc <- table(y2, y1)
chi <- chisq.test(calc)
chi$expected

# Q3 - G
assocstats(calc)

# -------------------------- FINISH -----------------------------------
