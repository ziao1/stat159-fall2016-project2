#setwd("C:/Users/Lydia/Documents/Stat159/proj2")
scaled_credit <-read.csv(file = "./data/scaled_credit.csv")

##OLS
ols <-lm(Balance~., data = data.frame(scaled_credit))
ols_coeffs <- as.numeric(ols$coefficients)[-1]
