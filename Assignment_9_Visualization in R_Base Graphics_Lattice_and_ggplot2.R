# LIS 4370: Assignment #9: Visualization in R – Base Graphics, Lattice, and ggplot2
# By: Adam Suleiman
# Chosen dataset: airquality

data("airquality", package = "datasets")
head(airquality)

# Base R Graphics

# Scatter plot
plot(airquality$Temp, airquality$Ozone,
     main = "Base: Temp vs. Ozone",
     xlab = "Temp",
     ylab = "Ozone")

# Histogram
hist(airquality$Ozone,
     main = "Base: Distribution of Ozone",
     xlab = "Ozone")

# Lattice Graphics
library(lattice)

# Conditional scatter plot (small multiples)
xyplot(Ozone ~ Temp | factor(Month),
       data = airquality,
       main = "Lattice: Ozone vs. Temp by Month")

# Box-and-whisker plot
bwplot(Ozone ~ factor(Month),
       data = airquality,
       main = "Lattice: Ozone by Month")

# ggplot2
library(ggplot2)

# Scatter plot with smoothing
ggplot(airquality, aes(x = Temp, y = Ozone, color = factor(Month))) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "ggplot2: Ozone vs. Temp with trend by Month")

# Faceted histogram
ggplot(airquality, aes(Ozone)) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~ Month) +
  labs(title = "ggplot2: Ozone distribution by Month")