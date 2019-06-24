file_data <- read.csv(file = "C:/Desktop/Katya/4/hw1_data.csv")

colnames(file_data)

head(file_data, 6)

nrow(file_data)

tail(file_data, 10)

length(is.na(file_data))

mean(file_data[, "Ozone"], na.rm = TRUE)

print(part_of_the_dataset <- subset(file_data, file_data$Ozone > 31 & file_data$Temp > 90))
mean(part_of_the_dataset$Solar.R, na.rm = TRUE)

mean(subset(file_data$Temp, file_data$Month == 6), na.rm = TRUE)

max(subset(f$Ozone, f$Month == 5), na.rm = TRUE)
