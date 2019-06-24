install.packages("stringr")
library(stringr)

prepare_set <- function(file_name) {
  dataframe <- na.omit(read.csv(file = file_name, skip = 1, header = TRUE, encoding = "UTF-8", stringsAsFactors = FALSE))
  colnames(dataframe)[1] <- "Country"

  name_col <- colnames(dataframe) 
  name_col <- sub("X01..", "Gold", name_col)
  name_col <- sub("X02..", "Silver", name_col)
  name_col <- sub("X03..", "Bronze", name_col)
  name_col <- sub("X..","", name_col)
  name_col <- sub("X.U.2116..","", name_col)
  
  colnames(dataframe) <- name_col
  country <- str_split(dataframe[,1], "\\(", simplify = TRUE)
  dataframe[,1] <- str_trim(country[,1])
  short_country <- str_split(country[,2], "\\)", simplify = TRUE)
  dataframe <- cbind(ID = short_country[,1], dataframe)
  dataframe <- dataframe[-nrow(dataframe),
}

olympics <- prepare_set("C:/Users/Katya/Desktop/2/olympics.csv")



answer_one <- function() {
  olympics$Country[olympics$Gold == max(olympics$Gold)] 
}

print(answer_one())



answer_two <- function() {
  temp <- olympics
  temp$difference <- abs(temp$Gold - temp$Gold.1)
  temp <- temp$Country[temp$difference == max(temp$difference)]
}

print(answer_two())



answer_three <- function() {
  temp <- olympics
  total_gold <- sum(temp$Gold) + sum(temp$Gold.1)
  temp$difference <- (temp$Gold - temp$Gold.1) / total_gold
  temp <- temp$Country[temp$difference == max(temp$difference)]
}

print(answer_three())



answer_four <- function() {
  temp <- olympics
  temp$Points <- (temp$Gold + temp$Gold.1 + temp$Gold.2) * 3 + (temp$Silver + temp$Silver.1 + temp$Silver.2) * 2 + temp$Bronze  + temp$Bronze.1 + temp$Bronze.2
  temp <- temp[,c("Country","Points")]
}

print(answer_four())

census_df <- read.csv("C:/Users/Katya/Desktop/2/census.csv", stringsAsFactors = FALSE)


answer_five <- function() {
  temp <- aggregate(CTYNAME ~ STNAME, census_df, length)
  temp <- temp$STNAME[temp$CTYNAME == max(temp$CTYNAME)]
}

print(answer_five())


answer_six <- function() {
  temp <- census_df[,c("STNAME","CENSUS2010POP")]
  temp <- aggregate(CENSUS2010POP ~ STNAME, temp, sum)
  temp <- temp[order(-temp$CENSUS2010POP),]
  temp <- temp[1:3,1]
}

print(answer_six())

answer_seven <- function() {
  temp <- census_df[,10:15]
  
  temp$MAX <- apply(temp, 1, max)
  temp$MIN <- apply(temp, 1, min)
  temp <- cbind(STNAME = census_df$STNAME, temp)
  temp$ABS <- abs(temp$MAX - temp$MIN)
  
  temp <- aggregate(ABS ~ STNAME, temp, sum)
  temp <- subset(temp, ABS == max(ABS))  
  temp <- as.character(temp$STNAME)
}

print(answer_seven())

answer_eight <- function() {
  subset(census_df, (census_df$REGION == 1 | census_df$REGION == 4) & census_df$POPESTIMATE2015 > census_df$POPESTIMATE2014 & census_df$STNAME == "Washington")[1:5,c("STNAME", "CTYNAME")]
}

print(answer_eight())