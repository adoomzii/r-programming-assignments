# Assignment #6: Matrix Operations and Construction
# By: Adam Suleiman

# Task 1: Matrix Addition & Subtraction

A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)
  
A
B

# Addition

A_plus_B <- A + B
A_plus_B

# Subtraction

A_minus_B <- A - B
A_minus_B

# Task 2: Create a Diagonal Matrix

D <- diag(c(4, 1, 2, 3))
D

# Task 3: Construct a Custom 5 x 5 Matrix

M <- cbind(c(3, 2, 2, 2, 2), rbind(1, diag(3, 4)))
M