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

range(ysprem) 
diff(range(ysprem)) 
IQR(ysprem)
sd(ysprem) 
var(ysprem) 

summary(xsprem)

range(xsprem) 
diff(range(xsprem)) 
IQR(xsprem) 
sd(xsprem) 
var(xsprem) 

hist(ysprem)  
boxplot(ysprem)  

hist(xsprem) 
boxplot(xsprem) 


plot(xsprem, ysprem, ylab = "rejtingSVE", xlab = "Languages", 
     main = "Regresijski grafikon")

cor.test(xsprem, ysprem, method = "pearson") 

lm(ysprem~x_var, data = my_data) 

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
