variable1 <- "Kateryna Osadcha"
variable2 <- 1997
variable3 <- 1997L
variable4 <- 4 + 1i
variable5 <- TRUE


vektor1 <- c(5:75)
vektor2 <- c(3.14, 2.71, 0, 13)
vektor3 <- rep(TRUE, times=100)


matrix1 <- matrix(c(0.5,3.9,0,2,1.3,131,2.2,7,3.5,2.8,4.6,5.1), ncol = 3)
matrix2 <- cbind(c(0.5,3.9,0,2),c(1.3,131,2.2,7),c(3.5,2.8,4.6,5.1))


list1 <- list(TRUE, 1997, 2020L, "Osadcha", 2+1i)


factor1 <- factor(c("baby", "adult","baby", "child", "child", "child"), levels = c("baby", "child","adult"))


vektor4 <- c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)
match(NA, vektor4)
sum(is.na(vektor4))


dataframe <- data.frame(x = 1:4, y = 5:8, z = c(T, F))
print(dataframe)


colnames(dataframe) <- c("a", "b", "c")