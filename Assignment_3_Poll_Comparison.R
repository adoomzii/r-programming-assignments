# Assignment 3: Analyzing 2016 Poll Data in R

library(ggplot2)

# Define and Inspect the Data

Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll   <- c( 12,      75,      43,    19,      1,        21,       19)

df_polls <- data.frame(Name, ABC_poll, CBS_poll)

str(df_polls)
head(df_polls)

# Compute Summary Statistics

mean(df_polls$ABC_poll)
median(df_polls$CBS_poll)
range(df_polls[, c("ABC_poll","CBS_poll")])

df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

df_polls

# Visualize bar chart

poll_plot <- ggplot(df_polls, aes(x = Name)) +
  geom_col(aes(y = ABC_poll), fill ="steelblue",
           position = position_nudge(x = -0.2), width = 0.4) +
  geom_col(aes(y = CBS_poll), fill = "firebrick",
           position = position_nudge(x = 0.2), width = 0.4) +
  labs(title = "2016 Candidate Polling: ABC (Blue) vs CBS (Red)",
      x = "Candidate", y = "Polling %")

poll_plot

# Save plot and embed into blog

ggsave("Poll_comparison.png", plot = poll_plot, width = 8, height = 5, dpi = 150)

