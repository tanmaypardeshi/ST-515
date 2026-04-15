# Question 1
ans <- pnorm(2.0203, lower.tail=FALSE)
ans

# Question 2
a_2 <- pnorm(-1.5, lower.tail=FALSE)
a_2
b_2 <- pnorm(4.75, lower.tail=FALSE)
b_2

# Question 4
a_4 <- pnorm(-0.5)
a_4

b_4 <- pnorm(-1.1185)
b_4

c_4 <- qnorm(0.01)
c_4

# Question 5
ans <- pt(2.8284, df=7, lower.tail = FALSE)
ans

# Question 6
p_1 = pnorm(-0.4716)
p_2 = pnorm(0.4716, lower.tail=FALSE)
p_val = p_1 + p_2
p_1
p_2
p_val

# Question 7
power.t.test(
  n = NULL, 
  delta = 0.3,
  sd = 4,
  sig.level = 0.05,
  power = 0.9,
  type = "one.sample",
  alternative = "one.sided"
)

# Question 8
power.t.test(
  n = NULL, 
  delta = 25,
  sd = 80,
  sig.level = 0.05,
  power = 0.975,
  type = "one.sample",
  alternative = "one.sided"
)

b_8 <- pt(2.5989, df=134, lower.tail=FALSE)
b_8