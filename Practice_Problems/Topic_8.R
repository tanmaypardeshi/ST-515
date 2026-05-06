# Question 1
p_value_1 <- pt(1, df = 29)
p_value_1 
p_value_2 <- pt(1, df = 29, lower.tail=FALSE)
p_value_2 
p_value_3 <- pt(-1, df = 29) + pt(1, df = 29, lower.tail=FALSE)
p_value_3

# Question 2
p_value <- pnorm(3.3730, lower.tail = FALSE)
p_value

# Question 3
my_list <- c(3192, 3124, 3153, 3145, 3093, 3466, 3355, 2979, 3182, 3227,
             3256, 3332, 3204, 3282, 3170)
mean(my_list)
sd(my_list)

p_value <- 2 * pt(0.3512, df = 14, lower.tail = FALSE)
p_value

# Question 4
p_value <- pnorm(2.5381, lower.tail = FALSE)
p_value

# Question 5
p_value <- pnorm(-0.50, lower.tail = FALSE)
p_value

# Question 6
power.t.test(
  n = NULL, 
  delta = 2,
  sd = 5,
  sig.level = 0.10,
  power = 0.80,
  type = "one.sample",
  alternative = "two.sided"
)

p_value <- 2 * pt(1.0606, df=49, lower.tail = FALSE)
p_value

# Question 7
p_value <- pt(-1.89, df = 9)
p_value