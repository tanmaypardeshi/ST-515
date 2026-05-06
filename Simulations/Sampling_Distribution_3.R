# Load the ggplot2 library
library(ggplot2)

# Define population parameters and simulation size
prob_success <- 0.5
sample_size <- 300
n_simulations <- 1000

# Set seed for reproducibility
set.seed(4242)

# Use 'replicate' to run the sampling and mean calculation n times
prop_vector <- replicate(n_simulations, {
  rbinom(1, size=sample_size, prob=prob_success)/sample_size
})

# Create a dataframe for ggplot
prop_data <- data.frame(Sample_Prop = prop_vector)

# Create the histogram plot
plot <- ggplot(prop_data, aes(x = Sample_Prop)) +
  geom_histogram(
    aes(y = after_stat(density)),
    bias = 40,
    fill = "#A0C4FF",
    color = "darkblue",
    alpha = 0.8
  ) + 
  # Add a vertical line for the theoretical mean
  geom_vline(
    xintercept = prob_success,
    linetype = "dashed",
    color = "darkred",
    linewidth = 1
  ) + 
  # Customize labels and title
  labs(
    title = paste("Sampling Distribution of the Proportion (n = ", sample_size, ")", sep = ""),
    subtitle = paste(n_simulations, " Samples from Bin(", sample_size, ", ", prob_success, ")", sep = ""),
    x = "Sample Proportion",
    y = "Density"
  ) +
  theme_bw()

print(plot)