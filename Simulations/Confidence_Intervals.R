library(tidyverse)
# --- Confidence Level Simulation using t-critical values ---
simulate_ci_t <- function(num_simulations, sample_size,
                          pop_mean, pop_sd, ci_level = 0.95) {
  alpha <- 1 - ci_level
  df <- sample_size - 1 # Degrees of freedom
  t_critical <- qt(1 - alpha / 2, df = df)
  results <- tibble(
    simulation_id = 1:num_simulations,
    sample_mean = NA_real_,
    sample_sd = NA_real_,
    margin_error = NA_real_,
    lower_bound = NA_real_,
    upper_bound = NA_real_,
    contains_pop_mean = NA
  )
  for (i in 1:num_simulations) {
    sample_data <- rnorm(sample_size, mean = pop_mean, sd = pop_sd)
    sample_mean <- mean(sample_data)
    sample_sd <- sd(sample_data)
    6
    # Margin of Error = t_critical * (sample_sd / sqrt(n))
    margin_error <- t_critical * (sample_sd / sqrt(sample_size))
    lower_bound <- sample_mean - margin_error
    upper_bound <- sample_mean + margin_error
    results$sample_mean[i] <- sample_mean
    results$sample_sd[i] <- sample_sd
    results$margin_error[i] <- margin_error
    results$lower_bound[i] <- lower_bound
    results$upper_bound[i] <- upper_bound
    results$contains_pop_mean[i] <- (pop_mean >= lower_bound & pop_mean <= upper_bound)
  }
  prop_contained_actual <- mean(results$contains_pop_mean)
  list(
    simulation_results = results,
    prop_contained = prop_contained_actual,
    ci_level_target = ci_level,
    pop_mean = pop_mean,
    sample_size = sample_size
  )
}
# Run the simulation
set.seed(456)
sim_output_t <- simulate_ci_t(num_simulations = 50, sample_size = 15,
                              pop_mean = 5, pop_sd = 2, ci_level = 0.95)
sim_df_t <- sim_output_t$simulation_results %>%
  # Use the original simulation_id for the y-axis, which is 1, 2, 3...
  # This makes the order arbitrary (random) based on when it was simulated.
  mutate(simulation_id_ordered = simulation_id)
# --- ggplot2 Code for Visualization ---
ggplot(sim_df_t, aes(y = simulation_id_ordered)) +
  # Confidence intervals (lines)
  geom_segment(aes(x = lower_bound, xend = upper_bound,
                   color = contains_pop_mean),
               linewidth = 0.8) +
  # Sample means (points)
  geom_point(aes(x = sample_mean), color = "darkgreen", size = 1) +
  # Vertical line for population mean
  geom_vline(xintercept = sim_output_t$pop_mean, linetype = "solid",
             color = "black", linewidth = 0.7) +
  # Colors for intervals
  scale_color_manual(values = c("FALSE" = "red", "TRUE" = "darkgreen")) +
  # --- Header Annotations (Adjusted based on the new data frame name) ---
  # CI Level
  annotate("text", x = min(sim_df_t$lower_bound) - 0.2,
           y = max(sim_df_t$simulation_id_ordered) + 6,
           label = "CI Level", vjust = 0, size = 3) +
  annotate("text", x = min(sim_df_t$lower_bound) - 0.2,
           y = max(sim_df_t$simulation_id_ordered) + 4,
           label = paste0(sim_output_t$ci_level_target), hjust = 0.5, size = 3) +
  # Containing mu
  annotate("text", x = min(sim_df_t$lower_bound) + 0.5,
           y = max(sim_df_t$simulation_id_ordered) + 6,
           label = "Containing mu", vjust = 0, size = 3) +
  annotate("text", x = min(sim_df_t$lower_bound) + 0.5,
           y = max(sim_df_t$simulation_id_ordered) + 4,
           label = sum(sim_df_t$contains_pop_mean), hjust = 0.5, size = 3) +
  # Total
  annotate("text", x = max(sim_df_t$upper_bound) - 0.5,
           y = max(sim_df_t$simulation_id_ordered) + 6,
           label = "Total", vjust = 0, size = 3) +
  annotate("text", x = max(sim_df_t$upper_bound) - 0.5,
           y = max(sim_df_t$simulation_id_ordered) + 4,
           label = nrow(sim_df_t), hjust = 0.5, size = 3) +
  # Prop. contained
  annotate("text", x = max(sim_df_t$upper_bound) + 0.2,
           y = max(sim_df_t$simulation_id_ordered) + 6,
           label = "Prop. contained", vjust = 0, size = 3) +
  annotate("text", x = max(sim_df_t$upper_bound) + 0.2,
           y = max(sim_df_t$simulation_id_ordered) + 4,
           label = round(sim_output_t$prop_contained, 3), hjust = 0.5, size = 3) +
  # Theme adjustments
  theme_minimal() +
  labs(title = "t-Distribution Confidence Interval Simulation (Random Order)",
       subtitle = paste0("Sample Size (n) = ", sim_output_t$sample_size),
       x = "Value",
       y = "Simulation Run") +
  theme(
    legend.position = "none",
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    plot.margin = margin(t = 20, r = 10, b = 10, l = 10)
  ) +
  coord_cartesian(xlim = c(min(sim_df_t$lower_bound, sim_df_t$upper_bound,
                               sim_output_t$pop_mean) - 0.5,
                           max(sim_df_t$lower_bound, sim_df_t$upper_bound,
                               sim_output_t$pop_mean) + 0.5),
                  ylim = c(0, max(sim_df_t$simulation_id_ordered) + 8),
                  clip = "off")