vektor <- rnorm(100)
vektor[10] 
vektor[10:20] 
vektor[20:29] 

y <- data.frame(a = rnorm(100), b = 1:100, cc = sample(letters, 100, replace = TRUE))
tail(y, 10) 
y[10:20, ] 
y[10, 2] 
y$cc 

vektor2 <- c(1, 2, 3, NA, 4, NA, 5, NA)
na.omit(vektor2) 
mean(vektor2) 
mean(vektor2, na.rm=TRUE) #середнє значення всіх елементів вектору без NA