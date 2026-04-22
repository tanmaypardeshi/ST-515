# Question 1
a_1_z_star <- qnorm(0.10)
a_1_z_star

b_1_z_star <- qnorm(0.15)
b_1_z_star

c_1_z_star <- qnorm(0.04)
c_1_z_star

# Question 2
a_2_z_star <- qt(0.10, df = 19)
a_2_z_star

b_2_z_star <- qt(0.01, df = 19)
b_2_z_star

# Question 3
a_3_z_star <- qnorm(0.005)
a_3_z_star

# Question 4
library(ggplot2)
data <- c(418, 421, 421, 422, 425, 421, 431, 434, 434, 437, 439, 446, 447, 448,
          453, 454, 463, 465)
df <- data.frame(values = data)

ggplot(df, aes(x = "", y = values)) +
  geom_boxplot(fill = "steelblue") +
  labs(title = "Boxplot of degree of polymerization for paper specimens", 
       y = "Viscosity x Concentration", x = "")

mean(data)
sd(data)

t_star <- qt(0.025, df = 16)
t_star