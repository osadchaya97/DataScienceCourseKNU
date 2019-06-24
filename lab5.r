
pmean <- function(directory, pollutant, id = 1:332) {
  
  list_files <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  new_dataframe <- data.frame() 
  
  for (i in id) {
    new_dataframe <- rbind(new_dataframe, na.omit(read.csv(list_files[i]))) 
  }
  
  if(pollutant == "sulfate") {
    mean(new_dataframe$sulfate)
  } else if (pollutant == "nitrate") {
    mean(new_dataframe$nitrate)
  } else {
    print("Wrong input!")
  }
}

directory <- "C:/Users/Katya/Desktop/2/specdata"

pmean(directory, "sulfate", 1:10)
pmean(directory, "sulfate", 55)
pmean(directory, "nitrate")

complete <- function(directory, id) {
  
  list_files <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  dataframe <- data.frame() 
  
  for (i in id) {
    dataframe <- rbind(dataframe, data.frame(id = i, nobs = nrow(na.omit(read.csv(list_files[i]))))) 
  }
  dataframe 
}

complete(directory, 1)
complete(directory, c(2, 4, 8, 10, 12))
complete(directory, 50:60)

corr <- function(directory, threshold = 0) {
  
  list_files <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  data_vektor <- character(0) 
  
  for (i in 1:length(list_files)) {
    info <- na.omit(read.csv(list_files[i])) 
    nobs <- nrow(info)
    
    if(nobs > threshold){
      data_vektor <- c(data_vektor, cor(info$sulfate, info$nitrate))
    }
  }
  as.numeric(data_vektor)
}

cr <- corr(directory, 150)
head(cr); summary(cr)

cr <- corr(directory, 400)
head(cr); summary(cr)

cr <- corr(directory, 5000)
head(cr); summary(cr)