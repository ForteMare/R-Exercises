#Unlike matrices that could only hold one value at the time, the DataFrame can hold multiple

# DataFrames will be shown with R's default database of cars
mtcars # See the entire DataFrame
summary(mtcars) # Get the summary
head(mtcars) # See the beginning part of the frame
tail(mtcars) # See the end part of the frame
str(mtcars) # Shows the structure of the data


#------CREATING A CUSTOM DATA SET------
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial Planet", "Terrestrial Planet", "Terrestrial Planet", 
          "Terrestrial Planet", "Gas Giant", "Gas Giant", "Gas Giant", "Gas Giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Creating a data frame out of the data set
planets_df <- data.frame(name, type, diameter, rotation, rings)
planets_df

# Accessing data in DataFrame the same as everywhere else
planets_df[,3]
planets_df[2,4]
planets_df[, "rings"]
#planets_df["rings", ] For some reason does not work correctly. Works well on mrcars

# **IMPORTANT** Alternative to the above selection method is using the $ sign
planets_df$name

# Using subset is the more elegant way of finding elements in a DS
subset(planets_df, diameter < 1)

# Sorting elements in any data set using order() function
# This persistently does not work on this computer!!!
dmt <- c(1000, 10, 100)
order(dmt)
reorder <- dmt[order(dmt)]
reorder

# Using order on the planets DataFrame
positions <- order(planets_df$diameter)
positions
planets_df[positions,] #This is the working way on how to order DF

