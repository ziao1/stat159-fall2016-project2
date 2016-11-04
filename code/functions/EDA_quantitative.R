setwd("C:/Users/Lydia/Documents/Stat159/proj2")
credit <- read.csv("~/Stat159/proj2/data/Credit.csv")
credit <- credit[,-1]

## Exploratory Data Analysis
## Quantitative Variables
range <- vector()
max <- vector()
min <- vector()
for (i in 1:ncol(credit)){
  if (class(credit[, i]) == "factor") {
    
  }
  else {
    range[i] <-max(credit[,i]) - min(credit[,i], na.rm = TRUE)
    max[i] <-max(credit[,i], na.rm = TRUE)
    min[i] <-min(credit[,i], na.rm = TRUE)
  }
}

median <- vector()
first_quartile <- vector()
third_quartile <- vector()
IQR <- vector()
for (i in 1:ncol(credit)){
  if (class(credit[, i]) == "factor") {
    
  }
  else {
    median[i] <-median(credit[,i], na.rm = TRUE)
    first_quartile[i] <-quantile(credit[,i], probs =c(0.25), na.rm = TRUE)
    third_quartile[i] <-quantile(credit[,i], probs =c(0.75), na.rm = TRUE)
    IQR[i] <- IQR(credit[,i], na.rm = TRUE)
  }
}

mean <- vector()
sd <- vector()
for (i in 1:ncol(credit)){
  if (class(credit[, i]) == "factor") {
    
  }
  else {
    mean[i] <-mean(credit[,i], na.rm = TRUE)
    sd[i] <- sd(credit[,i], na.rm = TRUE)
  }
}

first_quartile <-as.numeric(na.omit(first_quartile))
third_quartile <-as.numeric(na.omit(third_quartile))
IQR <-as.numeric(na.omit(IQR))
max <-as.numeric(na.omit(max))
min <-as.numeric(na.omit(min))
range <-as.numeric(na.omit(range))
median <- as.numeric(na.omit(median))
sd <-as.numeric(na.omit(sd))
mean <-as.numeric(na.omit(mean))

summ_stats <-matrix(c(min, max, range, first_quartile, third_quartile, IQR, mean, sd), 7, 8)
colnames(summ_stats) <-c("min", "max", "range", "first_quartile", "third_quartile", "IQR", "mean", "sd")
rownames(summ_stats) <- c("Income", "Limit", "Rating", "Cards", "Age", "Education", "Balance")

sink(file ="./data/eda-output.txt")
summ_stats
sink()
