1. Написати функцію pmean, яка обчислює середнє значення (mean) забруднення сульфатами або нітратами серед заданого переліка моніторів. Ця функція приймає три аргументи: «directory», «pollutant», «id». Directory–папка, в якій розміщені дані, pollutant–вид забруднення, id–перелік моніторів. Аргумент idмає значення за замовчуванням 1:332. Функція повинна ігнорувати NA значення. 
```pmean <- function(directory, pollutant, id = 1:332) {
  temp <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  my <- data.frame()
  for (i in id) {
    my <- rbind(my, na.omit(read.csv(temp[i])))
  }
  
  if(pollutant == "sulfate") {
    return(mean(my$sulfate))
  } else if (pollutant == "nitrate") {
    return(mean(my$nitrate))
  } else {
    print("Неправильне введення!")
  }
}

p <- "C:/Users/Алюнтик/Desktop/Новая папка/specdata"
pmean(p, "sulfate", 1:10)
pmean(p, "sulfate", 55)
pmean(p, "nitrate")
```



2. Написати функцію complete, яка виводить кількість повних спостережень (the number of completely observed cases) для кожного файлу. Функція приймає два аргументи: «Directory» та «id»та повертає dataframe, в якому перший стовпчик –ім’я файлу, а другий –кількість повних спостережень.
```complete <- function(directory, id) {
  temp <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  my <- data.frame()
  for (i in id) {
    my <- rbind(my, data.frame(id = i, nobs = nrow(na.omit(read.csv(temp[i])))))
  }
  return(my)
}

complete(p, 1)
complete(p, c(2, 4, 8, 10, 12))
complete(p, 50:60)
```



3. Написати функцію corr, яка приймаєдва аргументи: directory(папка, де знаходяться файли спостережень) та threshold(порогове значення, за замовчуванням дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів, кількість повних спостережень для яких більше порогового  значення.  Функція  повинна  повернути  вектор  значень кореляцій. Якщо ні один монітор не перевищує порогового значення, функція повинна повернути numericвектор довжиною 0. Для обчислення кореляції між сульфатами та нітратами використовуйте вбудовану функцію 
«cor»з параметрами за замовчуванням.
```corr <- function(directory, threshold = 0) {
  temp <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  ve <- character(0)
  for (i in 1:length(temp)) {
    a <- na.omit(read.csv(temp[i]))
    nobs <- nrow(a)
    if(nobs > threshold){
      ve <- c(ve, cor(a$sulfate, a$nitrate))
    }
  }
  return(as.numeric(ve))
}

cr <- corr(p, 150)
head(cr); summary(cr)

cr <- corr(p, 400)
head(cr); summary(cr)

cr <- corr(p, 5000)
head(cr); summary(cr)
```