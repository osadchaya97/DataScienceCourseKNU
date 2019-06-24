mat <- matrix(rnorm(50), nrow = 10, ncol = 5)
apply(mat, 2, max)
apply(mat, 2, mean)
apply(mat, 1, min)
apply(mat, 2, sort)
apply(mat, 2, function(x) length(x[x < 0]))
apply(mat, 2, function(x) as.logical(length(x[x > 2])))

list1 <- list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2))
lapply(list1, sum)
lapply(list1, min)
lapply(list1, max)
sapply(list1, min)
sapply(list1, max)
tapply(InsectSprays$count, InsectSprays$spray, mean)

split_mean <- function(df) {
  s <- split( df, df$spray)
  sapply( s, function(x) mean(x$count) )
}
split_mean(InsectSprays)
