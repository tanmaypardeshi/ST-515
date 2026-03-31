# Question 3
q3_var_1 <- pbinom(q=15, size=25, prob=0.3)
q3_var_2 <- pbinom(q=9, size=25, prob=0.3) 
q3_ans <- q3_var_1 - q3_var_2
q3_var_1
q3_var_2
q3_ans

# Question 5
a_5 <- dpois(6, lambda=8)
b_5 <- 1 - ppois(9, lambda=8)
c_5 <- ppois(20, lambda=20)

a_5
b_5
c_5

# Question 6
a_61 <- qnorm(0.07)
a_61
a_62 <- qnorm(0.12, lower.tail=FALSE)
a_62

b_61 <- pnorm(65,58.11,12.87)
b_62 <- pnorm(50,58.11,12.87)
b_ans <- b_61 - b_62
b_61
b_62
b_ans

# Question 7
a_7 <- dbinom(1, size=6, prob=0.10)
a_7

b_7 <- pbinom(1, size=6, prob=0.10, lower.tail=FALSE)
b_7

c_7 <- pnbinom(1, size=4, prob=0.90)
c_7

# Question 9
m1_z0 = pnorm(-1)
m1_z1 = pnorm(1)
m1_p = m1_z1 - m1_z0
m1_z0
m1_z1
m1_p


m2_z0 = pnorm(-7)
m2_z1 = pnorm(3)
m2_p = m2_z1 - m2_z0
m2_z0
m2_z1
m2_p

# Question 10
b_10 = pnorm(0.2)
b_10

c_10_1 = pnorm(-1)
c_10_2 = pnorm(1, lower.tail=FALSE)
c_10_1
c_10_2

d_10_1 = qnorm(0.0005)
d_10_2 = qnorm(0.0005, lower.tail=FALSE)
d_10_1
d_10_2

# Question 11
k1 <- 2*(1 - pnorm(1))
k2 <- 2*(1 - pnorm(2))
k3 <- 2*(1 - pnorm(3))
k1
k2
k3

# Question 12
a_12 = pexp(100, 0.01386)
a_12

b_12_1 = pexp(300, 0.01386)
b_12_2 = pexp(150, 0.01386)
b_12_ans = b_12_1 - b_12_2
b_12_1
b_12_2
b_12_ans