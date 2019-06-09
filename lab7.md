```
install.packages("stringr")
library(stringr)
```

**Частина 1**   
```
prepare_set <- function(file_name) {
```
1.Зчитуємо файл
  ```
  f <- na.omit(read.csv(file = file_name, skip = 1, header = TRUE, encoding = "UTF-8", stringsAsFactors = FALSE))
```

2.Першому стовпцю дати назву “Country”
  ```
  colnames(f)[1] <- "Country" 
  ```

3.Згенерувати назви останніх стовпців
```
  c <- colnames(f) #отримуємо назві цсіх стовпців
  c <- sub("X01..","Gold",c)
  c <- sub("X02..","Silver",c)
  c <- sub("X03..","Bronze",c)
  c <- sub("X..","",c)
  colnames(f) <- c
  ```

4.Необхідно привести назви країн до виду "Afghanistan", "Algeria" і т.п.
```  a <- str_split(f[,1], "\\(", simplify = TRUE)
  f[,1] <- str_trim(a[,1])
  ```

5.Додайте до дата фрейму новий стовпець “ID”, в який запишіть трибуквений код країна.
```  b <- str_split(a[,2], "\\)", simplify = TRUE)
  f <- cbind(ID = b[,1], f)
 ```

6.Видаліть з дата фрейму останню строку “Totals”
```
  f <- f[-nrow(f),]
  
  return(f)
}

olympics <- prepare_set("C:/Users/Алюнтик/Desktop/Новая папка/olympics.csv")



answer_one <- function(olympics) {
  m <- olympics$Country[olympics$Gold == max(olympics$Gold)] 
  return(m)
}

answer_one(olympics)



answer_two <- function(olympics) {
  a <- olympics
  a <- rbind(aa = (olympics$Gold - olympics$Gold.1), a)
  a <- a$Country[a$aa == max(a$aa)]
  return(a)
}

answer_two(olympics)

answer_three <- function(olympics) {
  a <- olympics
  tg <- sum(olympics$Gold) + sum(olympics$Gold.1)
  a <- rbind(aa = (olympics$Gold - olympics$Gold.1)/tg, a)
  a <- a$Country[a$aa == max(a$aa)]
  return(a)
}

answer_three(olympics)

answer_four <- function(olympics) {
  a <- olympics
  a <- rbind(Points = (a$Gold*3 + a$Silver*2 + a$Bronze + a$Gold.1*3 + a$Silver.1*2 + a$Bronze.1 + a$Gold.2*3 + a$Silver.2*2 + a$Bronze.2), a)
  a <- a[,c("Country","Points")]
  return(a)
}

answer_four(olympics)
```

**Частина 2**   
```
census_df <- read.csv("C:/Users/kosadcha/census.csv", stringsAsFactors = FALSE)
```

colnames(census_df)

```answer_five <- function(census_df) {
  a <- aggregate(CTYNAME ~ STNAME, census_df, length)
  a <- a$STNAME[a$CTYNAME == max(a$CTYNAME)]
  return(a)
}

answer_five(census_df)


answer_six <- function(census_df) {
  a <- census_df[,c("STNAME","CENSUS2010POP")]
  a <- aggregate(CENSUS2010POP ~ STNAME, a, sum)
  a <- a[order(-a$CENSUS2010POP),]
  a <- a[1:3,1]
  return(a)
}

answer_six(census_df)


answer_seven <- function(census_df) {
  a <- census_df[,10:15]
  a$MAX <- apply(a, 1, max)
  a$MIN <- apply(a, 1, min)
  a <- cbind(STNAME = census_df$STNAME, a)
  a$ABS <- abs(a$MAX - a$MIN)
  a <- aggregate(ABS ~ STNAME, a, sum)
  b <- subset(a, ABS == max(ABS))  
  b <- as.character(b$STNAME)
  return(b)
}

answer_seven(census_df)



answer_eight <- function(census_df) {
  a <- subset(census_df, (census_df$REGION == 1 | census_df$REGION == 4) & census_df$POPESTIMATE2015 > census_df$POPESTIMATE2014 & census_df$STNAME == "Washington")[1:5,c("STNAME", "CTYNAME")]
   return(а)
}

answer_eight(census_df)
```