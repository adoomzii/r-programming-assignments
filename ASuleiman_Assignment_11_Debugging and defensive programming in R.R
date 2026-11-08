# LIS 4370 - Module #11
# By: Adam Suleiman

# Helper used by tukey_multiple()
tukey.outlier <- function(x) {
  q   <- quantile(x, probs = c(0.25, 0.75))
  iqr <- q[2] - q[1]
  (x < q[1] - 1.5 * iqr) | (x > q[2] + 1.5 * iqr)
}

# 1. Reproduce the error
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# 3 & 4: Fix the code and verify
corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

corrected_tukey(test_mat)

# 5.
safe_tukey <- function(x) {
  if (!is.matrix(x)) stop("x must be a matrix.")
  if (!is.numeric(x)) stop("x must be numeric (non-numeric values found).")
  corrected_tukey(x)
}

safe_tukey(test_mat)