# ------ 1. DESCRIPTION AND EDITING OF DATA ------

# Importing the file: NOTICE THIS IS A TEMPORARY LOCATION!
original <- read.csv(file = "C:\\Users\\Sapun\\Desktop\\S\\ABC.csv", header = TRUE, sep = ',')

# Display the imported file 
original

# Display data
View(original) 

# Editing variables
dodeljene_sprem <- c("rating_count_tot", "rating_count_ver", "prime_genre", "cont_rating")
moje_sprem <- c("sveR", "trenutniR", "zanr", "sadrzaj") # PG is short for Parental Guidance

podatki <- original[dodeljene_sprem]
podatki

names(podatki) <- moje_sprem
View(podatki)

# -----------------------------------------------------------------

# ------ 2. NUMERIC VARIABLE ANALYSIS OF PRICE AND LANGUAGES ------
# Assigning new variables for brevity: 
ysprem <- podatki$trenutniR
xsprem <- podatki$sveR

summary(ysprem)

range(ysprem) # Returns Range of Values
diff(range(ysprem)) # Returns Lagged Difference
IQR(ysprem) # Returns the Inter Quartile Range
sd(ysprem) # Returns the Standard Deviation
var(ysprem) # Returns Correlation, Variance, and Covariance

summary(xsprem)

range(xsprem) # Returns Range of Values
diff(range(xsprem)) # Returns Lagged Difference
IQR(xsprem) # Returns the Inter Quartile Range
sd(xsprem) # Returns the Standard Deviation
var(xsprem) # Returns Correlation, Variance, and Covariance

# Create a histogram and a boxplot for numeric variables
hist(ysprem) # Create a histogram 
boxplot(ysprem) # Create a boxlot 

hist(xsprem) # Create a histogram
boxplot(xsprem) # Create a boxlot



# Regression Plot Diagram 
plot(xsprem, ysprem, ylab = "rejtingSVE", xlab = "Languages", 
     main = "Regression Plot for Variables Price and Languages")

# Pearson Correlation Coefficient calculation
cor.test(xsprem, ysprem, method = "pearson") # Order of X and Y does not matter

# Relationships between numeric variables
lm(ysprem~x_var, data = my_data) # This is the correct order

# Plotting the graph with correlations
plot(xsprem, ysprem, ylab = "rejtingSVE", xlab = "Languages", 
     main = "Linear Regression Plot for Variables Price and Languages")
abline(lm(ysprem~x_var, data = my_data), col = "blue")

# Calculating Determination coefficient
summary(lm(ysprem~x_var, data = my_data))

# -----------------------------------------------------------------

# ------ 3. DESCRIPTIVE VARIABLE ANALYSIS OF GENRE AND CONTENT RATING ------

#Creating abbreviated variables
a <- podatki$sadrzaj
b <- podatki$zanr

# Displaying frequencies for PG rating, not adequate
freq(a, plot = FALSE)

# Displaying frequencies for genre
freq(b, plot = FALSE)

# Graphical display of information with barplot
barplot(prop.table(table(a)), main = "PG Rating Structure", 
        col = rainbow(8), ylab = "Percentage", xlab = "PG Rating")

# Graphical display of information with piechart
pie(prop.table(table(b)), main = "Structure of Genre", col = rainbow(6))

# Making a contingency table 
addmargins(table(a, b))

# Creating double structure
addmargins(prop.table(table(b, a)) * 100)

# Display of double structure
dt <- prop.table(table(b, a)) * 100
barplot(dt, col = c("blue", "red"), legend.text = c("Games", "Other"), 
        main = "Game Types According to PG Rating", 
        xlab = "PG Rating", ylab = "Percentage")

# Frequency Table 
racunica <- table(b, a)
ki <- chisq.test(racunica)
ki$expected

# Q3 - G
assocstats(racunica)

# -------------------------- FINISH -----------------------------------
