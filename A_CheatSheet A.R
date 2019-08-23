# Setting up some data for examples below
even <- c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)
odd <- c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19)
week <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
weektemp <- c(22, 27, 31, 25, 33, 34, 35)

# Arithmetic result 
3 + 2

# Variables

x <- 15
x

# Renaming variables? 
k <- c(5, 7, 8, 13)
z <-k
z

# Vectors of equal size test
eq1 <- c(5, 12, 13)
eq2 <- c(14, 7, 10)
eq1 + eq2

# Vectors of unequal size test
ueq1 <- c(4, 7, 9)
ueq2 <- c(5, 10)
ueq1 + ueq2 #Displays a warning message and continues adding by repeating the vector

# Naming objects in vectors
names(weektemp) <- week
weektemp

# Sum calculates all elements in a vector
sum(degrees)

# Selecting elements in a vector. Numbers go from 1 to vector size
degrees[2]

# Selecting some elements in a vector
wkdays <- week[c(1, 2, 3, 4, 5)]
wkdays
wkends <- week[c(6, 7)]
wkends

# Short hand for selecting elements
weektemp[2:6]

# You can also call vectors by name
weektemp["Thursday"]
weektemp[c("Tuesday", "Sunday")]

# calculating the average (mean)
mean(weektemp)

#Using comparison operators on vectors
weektemp >= 29
