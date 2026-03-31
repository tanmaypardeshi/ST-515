# Question 3

b_3_1 <- pexp(5, rate = 1/6)
b_3_2 <- pexp(10, rate = 1/6)
b_3_ans <- b_3_2 - b_3_1
b_3_1
b_3_2
b_3_ans

# Question 4

a_4 <- dpois(6, lambda=8)
a_4

b_4 <- ppois(9, lambda=8, lower.tail=FALSE)
b_4

c_4 <- ppois(20, lambda=20)
c_4

# Question 7
a_7 <- dbinom(8, size=17, prob=0.73)
a_7

b_7 <- pbinom(12, size=17, prob=0.73, lower.tail=FALSE)
b_7

c_7_1 <- pbinom(12, size=17, prob=0.73)
c_7_2 <- pbinom(3, size=17, prob=0.73)
c_7_ans <- c_7_1 - c_7_2
c_7_1
c_7_2
c_7_ans

# Question 9
a_9 <- pnorm(1.686)
a_9

b_9 <- pnorm(7.163, lower.tail=FALSE)
b_9

c_9_1 <- pnorm(1.6861)
c_9_2 <- pnorm(-0.5031)
c_9_ans <- c_9_1 - c_9_2
c_9_1
c_9_2
c_9_ans

d_9 <- qnorm(0.01, lower.tail=FALSE)
d_9

# Question 10
a_10 <- dnbinom(2, size=2, prob=0.2)
a_10

b_10 <- pnbinom(2, size=2, prob=0.2)
b_10

# Question 11

a_11 <- dnbinom(10, size=5, prob=0.2)
a_11

b_11 <- pnbinom(10, size=5, prob=0.2, lower.tail=FALSE)
b_11