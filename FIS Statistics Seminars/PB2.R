# Spremenljivke: 
# rating_count_tot - User Rating counts (for all version)
# rating_count_ver - User Rating counts (for current version)
# prime_genre - Primary Genre
# cont_rating - Content Rating

# 1


# 1A - Import data into R 
originalni_podaci <- read.csv(file = "C:\\Users\\Sapun\\Desktop\\S\\APPDATA.csv", 
                              header = TRUE, sep = ',')
#View(originalni_podaci)

# Nove spremenljivke
originalne_spremenljivke <- c("rating_count_tot", 
                              "rating_count_ver", "prime_genre", "cont_rating")
moje_spremenljivke <- c("rejtingTOT", "rejtingVER", "zanr", "minGodina") 

moji_podaci <- originalni_podaci[originalne_spremenljivke]
moji_podaci

names(moji_podaci) <- moje_spremenljivke
#View(moji_podaci)

# Abbreviated 
y_var <- moji_podaci$rejtingTOT
x_var <- moji_podaci$rejtingVER

# 1B - Arithmetic mean for numeric variables

# 1B1
library(psych)
describe(moji_podaci[ c("rejtingTOT", "rejtingVER")])

# 1B2
t.test(y_var)
t.test(x_var)
# NOT WORKING, CORRECT LATER! 

# 1C

# Collect relevant variables

# 95% interval
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

# 2

# 2A

# Create new temp variables 
sprem1 <- moji_podaci$minGodina
sprem2 <- mmoji_podaci$zanr

sprem1
sprem2

freq(sprem1, plot = FALSE)
freq(sprem2, plot = FALSE)

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

# 3

# 3A
describeBy(x_var, group = sprem2, mat = TRUE)

# 3B 
var.test(x_var ~ z2, data = my_data)

# 3C 
t.test(x_var ~ z2, data = my_data, var.equal = TRUE)

# 4

# 4A - Contingency Table 

my_table <- table(sprem1, sprem2)
my_table

# 4B - Chi Squared
chiTest <- chisq.test(my_table)
chiTest

chiTest$observed
chiTest$expected

# 4C 
new_chiTest <- chisq.test(table(sprem1, sprem2))
new_chiTest
# 5

# 5A 
plot(x_var, y_var, main = "Radiation Chart", 
     xlab = "Number of Languages", ylab = "App Price")

# 5B - Pearson correlation coefficient
cor(x_var, y_var)

# 5C Testing
cor.test(x_var, y_var, alternative = "greater")

# 5D Dependancy between variables
lm(y_var ~ x_var)

plot(x_var, y_var, main = "Radiation Chart", xlab = "Number of Languages", 
     ylab = "App Price")
abline(lm(y_var ~ x_var), col = "orange")

# 5E 
summary(lm(y_var ~ x_var))
# ------------------------------------------------------
