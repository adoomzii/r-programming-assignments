# LIS 4370: Assignment #8: Input/Output, String Manipulation, and the plyr Package
# By: Adam Suleiman

# Step 1:

student6 <- read.table(file.choose(), header = TRUE, sep = ",", stringsAsFactors = FALSE)

library(plyr)
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

# Step 2:

i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

# Step 3:

write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)