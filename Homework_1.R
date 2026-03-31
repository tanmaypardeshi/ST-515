set.seed(1284)

Set1 <- seq(1, 50000)

Omega <- sample(Set1, replace = TRUE)

A <- sample(Omega, 100, replace = FALSE)
B <- sample(Omega, 100, replace = FALSE)
C <- sample(Omega, 100, replace = FALSE)

50000 %in% Omega
50000 %in% C
48231 %in% Omega
48231 %in% A
2707 %in% B

intersect(A, B)
intersect(A, C)
intersect(B, C)