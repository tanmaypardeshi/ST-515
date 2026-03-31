n <- 15 # set number of x-values to plot

lambda <- 8 # set the value of the parameter

# Create a data frame with x values and their biomial probabilties
poisson_data <- data.frame(
  x = 0:n,
  prob = dpois(x = 0:n, lambda=lambda)
)

# Create the plot using ggplot2 with a numeric x-axis
ggplot(poisson_data, aes(x=x, y=prob)) +
  geom_bar(stat="identity", fill="steelblue")
  labs(
    title = "Poisson Probability Distribution",
    x = "Values of x",
    y = "p(x)"
  ) +
  scale_x_continuous(breaks=0:n) + # Ensure all x values are shows as breaks
  theme_minimal()