add2 <- function(x, y) {
  x+y
}

add2(2,3)

above <- function(x, n = 10) {
  x[x>n]
}

vektor <- c(23,2,7,9,6,11,5,8,3,1)
above(vektor)
above(vektor, 5)

my_ifelse <- function(x, exp, n) {
  if(exp == "<") {
    x[x < n]
  } else if(exp == ">") {
    x[x > n]
  } else if(exp == "<=") {
    x[x <= n]
  } else if(exp == ">=") {
    x[x >= n]
  } else if(exp == "==") {
    x[x == n]
  } else {
    x
  }
}

vektor2 <- c(23,2,7,9,6,11,5,8,3,1)
my_ifelse(vektor2, ">", 10)

columnmean <- function(x, removeNA = TRUE) {
  n <- ncol(x)
  if(removeNA == TRUE) {
    mean(x[ ,n], na.rm=TRUE)
  } else {
    mean(x[ ,n])
  }
}

x3 <- data.frame(x = 3:8, y = 6:11, z = 12:17)
columnmean(x3)