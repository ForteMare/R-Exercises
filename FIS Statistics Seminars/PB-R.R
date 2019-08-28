# 1. 

# Uvoz dokumenta
original <- read.csv(file = "C:\\Korisnik\\Buric\\Dokumenti\\FIS\\Statistika1\\podaci.csv", 
                     header = TRUE, sep = ',')

# Pregled originala
View(original) 

# Menjanje spremenljivki
dodeljene_sprem <- c("rating_count_tot", "rating_count_ver", "prime_genre", "cont_rating")
moje_sprem <- c("sveR", "trenutniR", "zanr", "sadrzaj") 
podatki <- original[dodeljene_sprem]
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
abline(lm(ysprem~xsprem, data = my_data), col = "yellow")

summary(lm(ysprem~xsprem, data = my_data))

# 3

prva <- podatki$sadrzaj
druga <- podatki$zanr

freq(prva, plot = FALSE)

freq(druga, plot = FALSE)

barplot(prop.table(table(prva)), main = "Struktura rod. sadrzaja", 
        col = "blue", ylab = "Procenti", xlab = "rejting sadrzaja")

pie(prop.table(table(druga)), main = "Struktura zanra", col = c("blue", "white"))

addmargins(table(druga, prva))

addmargins(prop.table(table(druga, prva)) * 100)

tempo <- prop.table(table(druga, prva)) * 100
barplot(tempo, col = c("black", "white"), legend.text = c("Games", "Other"), 
        main = "Vrste igri po sadrzaju", 
        xlab = "Sadrzaj", ylab = "Procenti")

racunica <- table(druga, prva)
ki <- chisq.test(racunica)
ki$expected

assocstats(racunica)
