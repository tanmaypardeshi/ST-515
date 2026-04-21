# Define the number of data points
n <- 200

# Generate data for different scenarios
# Use rnorm() to generate data directly from a normal distribution
set.seed(123) # For reproducibility
normal_data <- data.frame(
  sample = rnorm(n, mean = 0, sd = 1),
  type = "A: Normal Data"
)

# B: Medium Departure from Normality (e.g. a slightly skewed/heavy-tailed dist)
# A t-distribution with small df, or a mild exponential distribution
set.seed(456)
medium_departure_data <- data.frame(
  sample = rt(n, df = 5), # t-distribution with df = 5 has heavier tails than normal
  type = "B: Medium Departure (t)"
)

# C: Large Departure from Normality (e.g. a highly skewed/very heavy-tailed dist)
# An exponential distribution is a good example of strong non-normality
set.seed(789)
large_departure_data <- data.frame(
  sample = rexp(n , rate = 1), # Exponential distribution  (highly skewed)
  type = "C: Large Departure (Exp)"
)

# Combine all data into a single data frame for ggplot
plot_data <- rbind(normal_data, medium_departure_data, large_departure_data)

# Ensure 'type' is a factor for consistent plotting order
plot_data$type <- factor(plot_data$type, 
                         levels = c("A: Normal Data",
                                    "B: Medium Departure (t)",
                                    "C: Large Departure (Exp)"))

# Generate the Q-Q plot using ggplot
ggplot(plot_data, aes(sample = sample)) + 
  stat_qq(color = "steelblue", alpha = 0.8) + # Q-Q points
  stat_qq_line(color = "red", linetype = "dashed") + # Reference points
  facet_wrap(~ type, scales = "free") + # Create separate plots for each scenario
  labs(
    title = "Q-Q Plots: Comparing Sample Quantities to Normal Quantiles",
    x = "Theoretical Quantiles (Standard Normal)",
    y = "Sample Quantities"
  ) + 
  theme_minimal() +
  theme(plot.title  = element_text(hjust = 0.5)) # Center the title

