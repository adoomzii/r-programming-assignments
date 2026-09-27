# LIS 4370 - Assignment #5: Matrix Algebra in R
# Adam Suleiman

# 1. Create the matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

# 2. Inspect dimensions
dim(A)  # should be 10 x 10
dim(B)  # 10 x 100 - not square

# 3. Compute inverse and determinant
# For A
invA <- tryCatch(solve(A), error = function(e) e)
detA <- tryCatch(det(A),   error = function(e) e)
invA
detA

# For B
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)
invB
detB

