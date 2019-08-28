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


plot(xsprem, ysprem, ylab = "treunutniR", xlab = "sveR", 
     main = "Regresijski grafikon")

cor.test(xsprem, ysprem, method = "pearson") 

lm(ysprem~xsprem, data = my_data) 

plot(xsprem, ysprem, ylab = "trenutniR", xlab = "sveR", 
     main = "Linija linearne regresije na regresijkom grafikonu")
abline(lm(ysprem~x_var, data = my_data), col = "red")

summary(lm(ysprem~xsprem, data = my_data))

# 3

prva <- podatki$sadrzaj
druga <- podatki$zanr

freq(prva, plot = FALSE)

freq(druga, plot = FALSE)

barplot(prop.table(table(prva)), main = "Struktura rod. sadrzaja", 
        col = rainbow(8), ylab = "Procenti", xlab = "rejting sadrzaja")

pie(prop.table(table(druga)), main = "Struktura zanra", col = rainbow(6))

addmargins(table(prva, druga))

addmargins(prop.table(table(druga, prva)) * 100)

dt <- prop.table(table(druga, prva)) * 100
barplot(dt, col = c("blue", "red"), legend.text = c("Games", "Other"), 
        main = "Vrste igri po sadrzaju", 
        xlab = "Sadrzaj", ylab = "Procenti")

racunica <- table(druga, prva)
ki <- chisq.test(racunica)
ki$expected

assocstats(racunica)
