# 1. 

# Uvoz dokumenta
original <- read.csv(file = "C:\\Users\\Sapun\\Desktop\\S\\ABC.csv", header = TRUE, sep = ',')

# Pregled originala
View(original) 

# Menjanje spremenljivki
dodeljene_sprem <- c("rating_count_tot", "rating_count_ver", "prime_genre", "cont_rating")
moje_sprem <- c("sveR", "trenutniR", "zanr", "sadrzaj") 

podatki <- original[dodeljene_sprem]
podatki

names(podatki) <- moje_sprem
View(podatki)

# 2
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

hist(ysprem) # Create a histogram 
boxplot(ysprem) # Create a boxlot 

hist(xsprem) # Create a histogram
boxplot(xsprem) # Create a boxlot


plot(xsprem, ysprem, ylab = "rejtingSVE", xlab = "Languages", 
     main = "Regression Plot for Variables Price and Languages")

cor.test(xsprem, ysprem, method = "pearson") 

lm(ysprem~x_var, data = my_data) # This is the correct order

plot(xsprem, ysprem, ylab = "rejtingSVE", xlab = "Languages", 
     main = "Linear Regression Plot for Variables Price and Languages")
abline(lm(ysprem~x_var, data = my_data), col = "blue")

summary(lm(ysprem~x_var, data = my_data))

# 3

prva <- podatki$sadrzaj
druga <- podatki$zanr

# Displaying frequencies for PG rating, not adequate
freq(prva, plot = FALSE)

# Displaying frequencies for genre
freq(druga, plot = FALSE)

# Graphical display of information with barplot
barplot(prop.table(table(prva)), main = "PG Rating Structure", 
        col = rainbow(8), ylab = "Percentage", xlab = "PG Rating")

# Graphical display of information with piechart
pie(prop.table(table(druga)), main = "Structure of Genre", col = rainbow(6))

# Making a contingency table 
addmargins(table(prva, druga))

# Creating double structure
addmargins(prop.table(table(druga, prva)) * 100)

# Display of double structure
dt <- prop.table(table(druga, prva)) * 100
barplot(dt, col = c("blue", "red"), legend.text = c("Games", "Other"), 
        main = "Game Types According to PG Rating", 
        xlab = "PG Rating", ylab = "Percentage")

# Frequency Table 
racunica <- table(druga, prva)
ki <- chisq.test(racunica)
ki$expected

# Q3 - G
assocstats(racunica)
