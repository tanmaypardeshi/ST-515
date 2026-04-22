# Load the necessary library
library(ggplot2)
library(dplyr) # For data manipulation (optional, but good practice)
# 1. Define the degrees of freedom (df) for the t-distributions
df_values <- c(1, 5, 30) # Examples: df=1 (Cauchy), df=5, df=30 (approaching Normal)
# 2. Define the range of x-values for plotting
x_range <- seq(-5, 5, length.out = 500)
# 3. Create a data frame for the t-distributions
# Use the dt() function (density of t distribution)
t_data <- data.frame()
for (df in df_values) {
  temp_data <- data.frame(
    x = x_range,
    density = dt(x_range, df = df),
    Distribution = paste0("t-distribution (df=", df, ")")
  )
  t_data <- rbind(t_data, temp_data)
}
# 4. Create a data frame for the standard normal distribution
# Use the dnorm() function (density of normal distribution)
normal_data <- data.frame(
  x = x_range,
  density = dnorm(x_range, mean = 0, sd = 1),
  Distribution = "Standard Normal"
)
# 5. Combine the data frames
plot_data <- rbind(t_data, normal_data)
# 6. Generate the ggplot
ggplot(plot_data, aes(x = x, y = density, color = Distribution)) +
  geom_line(linewidth = 1) + # Plot lines for the densities
  labs(
    title = "t-Distributions vs. Standard Normal Distribution",
    x = "x",
    y = "Probability Density",
    color = "Distribution Type"
  ) +
  scale_color_manual(
    values = c(
      "Standard Normal" = "black", # Standard Normal in a distinct color
      "t-distribution (df=1)" = "red",
      "t-distribution (df=5)" = "blue",
      "t-distribution (df=30)" = "green4"
    )
  ) +
  theme_minimal() + # Use a clean theme
  theme(legend.position = "right")