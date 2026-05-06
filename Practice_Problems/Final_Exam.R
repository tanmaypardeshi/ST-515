# Question 1
b <- pnorm(0.1178, lower.tail=FALSE)
b

c <- pnorm(1.4434, lower.tail=FALSE)
c

# Question 7
t_star <- qt(0.005, df = 4)
t_star

# Question 8
power.t.test(
  n = NULL,
  sd = 20,
  delta = 10,
  power = 0.90,
  type = "one.sample",
  alternative = "one.sided"
)