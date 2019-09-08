# Spremenljivke: 
# rating_count_tot - User Rating counts (for all version)
# rating_count_ver - User Rating counts (for current version)
# prime_genre - Primary Genre
# cont_rating - Content Rating

# 1


originalni_podaci <- read.csv(file = "C:\\Users\\Buric\\Desktop\\FIS\\StatistikaII\\Aplikacije.csv", 
                              header = TRUE, sep = ',')
View(originalni_podaci)

originalne_spremenljivke <- c("rating_count_tot", 
                              "rating_count_ver", "prime_genre", "cont_rating")
moje_spremenljivke <- c("rejtingTOT", "rejtingVER", "zanr", "minGodina") 

moji_podaci <- originalni_podaci[originalne_spremenljivke]
moji_podaci

names(moji_podaci) <- moje_spremenljivke
View(moji_podaci)

y_var <- moji_podaci$rejtingTOT
x_var <- moji_podaci$rejtingVER

# 1B - Arithmetic mean for numeric variables

library(psych)
describe(moji_podaci[ c("rejtingTOT", "rejtingVER")])

t.test(y_var)
t.test(x_var)

alfa <- 0.05

n <- length(x_var)
prosek <- mean(x_var)
st_deviacija <- sd(x_var)
sprem_temp <- qnorm(1 - alfa)

n; 
prosek; 
st_deviacija; 
sprem_temp; 

st_deviacija + (sprem_temp * st_deviacija / sqrt(n)) 

sprem1 <- moji_podaci$minGodina
sprem2 <- moji_podaci$zanr

sprem1
sprem2

freq(sprem1, plot = FALSE)
freq(sprem2, plot = FALSE)

prop.test(32, 200, p = 0.25, alternative = "greater")
prop.test(114, 200, p = 0.5, alternative = "greater")

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

describeBy(x_var, group = sprem2, mat = TRUE)

var.test(x_var ~ sprem2, data = my_data)

 
t.test(x_var ~ sprem2, data = my_data, var.equal = TRUE)


tabela1 <- table(sprem1, sprem2)
tabela1

hiTest <- chisq.test(tabela1)
hiTest

hiTest$observed
hiTest$expected

hiTestN1 <- chisq.test(table(sprem1, sprem2))
hiTestN1

plot(x_var, y_var, main = "Grafikon", 
     xlab = "Rejting verzije", ylab = "Totalni rejting")

cor(x_var, y_var)

cor.test(x_var, y_var, alternative = "greater")

lm(y_var ~ x_var)

plot(x_var, y_var, main = "Grafikon", xlab = "Rejting po verziji", 
     ylab = "Totalni rejting")
abline(lm(y_var ~ x_var), col = "black")

summary(lm(y_var ~ x_var))
