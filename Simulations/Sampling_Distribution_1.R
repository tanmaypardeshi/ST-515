# Load the ggplot2 library
library(ggplot2)

# Define population parameters and simulation size
pop_mean <- 600
pop_sd <- 100
sample_size <- 25
n_simulations <- 1000

# Set seed for reproducibility
set.seed(4242)

# Use 'replicate' to run the sampling and mean calculation n times
means_vector <- replicate(n_simulations, {
  mean(rnorm(sample_size, pop_mean, pop_sd))
})

# Create a data frame for ggplot
mean_data <- data.frame(Sample_Mean = means_vector)

# Calculate summary statistics for the annotation
mean_of_means <- mean(means_vector)
sd_of_means <- sd(means_vector)
theoretical_se <- pop_sd / sqrt(sample_size)

# Guiding location for plot legend
max_density <- dnorm(pop_mean, mean = pop_mean, sd = theoretical_se)

# Create the summary text for the annotation
summary_text <- paste(
  "Theoretical Mean: ", pop_mean,
  "\nEmpirical Mean: ", round(mean_of_means, 4),
  "\nEmpirical S.D.:", round(sd_of_means, 4),
  sep = ""
)

# Create the histogram plot
plot <- ggplot(mean_data, aes(x = Sample_Mean)) +
  geom_histogram(
    aes(y = after_stat(density)),
    bins = 40,
    fill = "#A0C4FF",
    color = "darkblue",
    alpha = 0.8
  ) + 
  # Add a vertical line for the theoretical mean
  geom_vline(
    xintercept = pop_mean,
    linetype = "dashed",
    color = "darkred",
    linewidth = 1
  ) + 
  # Customize labels and title
  labs(
    title = paste("Sampling Distribution of the Mean (n = ", sample_size, ")", sep=""),
    subtitle = paste(n_simulations, "Samples from N(600, 100)"),
    x = "Sample Mean",
    y = "Density"
  ) +
  theme_bw() +
  # Place the summary text on the plot (simulatinh a legend)
  annotate(
    "text",
    x = pop_mean + 3 * theoretical_se, # Place X coordinate (right side)
    y = max_density * .95, # Place Y coordinate (near top)
    label = summary_text,
    hjust = 1, # Right-align text
    vjust = 1, # Top-align text
    size = 3.5,
    color = "darkgreen",
    fontface = "bold",
    lineheight = 1.1 # Adjust line spacing
  )

print(plot)