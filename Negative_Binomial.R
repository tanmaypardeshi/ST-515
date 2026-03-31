# Load the package
library(ggplot2)

# Set the parameters
n <- 8
p <- 0.5

# Create a binomial data frame with x values and their binomial probabilities
binomial_data <- data.frame(
  x = 0:n,
  prob = dnbinom(x = 0:n, size = n, prob = p)
)

# Create the plot using ggplot2 with a numeric x-axis
ggplot(binomial_data, aes(x = x, y = prob)) +
  geom_bar(stat = "identity", fill= "steelblue") +
  labs(
    title= "Binomial Probability Distribtion",
    x = "Values of x",
    y = "p(x)"
  ) +
  scale_x_continuous(breaks= 0:n) + # Ensure all x values are shown as breaks
  theme_minimal()