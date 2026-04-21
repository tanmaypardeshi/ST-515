# Question 1
b_1 = pgamma(24, shape=4, scale=6)
b_2 = pgamma(12, shape=4, scale=6)
b_ans = b_1 - b_2
b_1
b_2
b_ans

c_1 = pgamma(24, shape=4, scale=6, lower.tail=FALSE)
c_1

d_1 = qgamma(0.005, shape=4, scale=6, lower.tail=FALSE)
d_1