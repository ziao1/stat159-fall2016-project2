## Partial Least Squares Regression
library(pls)
#pre-modeling data processing
credit <- read.csv("data/Credit.csv")
credit <- credit[,-1]

#dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

#removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[,-1], Balance = credit$Balance)

#scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

set.seed(5)
train_set <- sample(c(1:400), size = 300)
predictors = scaled_credit[,c(1:11)]
response = scaled_credit[,c(12)]
test=(-train_set)
response_test=response[test]
## Partial Least Squares Regression
pls_fit = plsr(Balance ~ ., data = data.frame(scaled_credit), subset = train_set, scale = FALSE, validation ="CV")
summary(pls_fit)
best_para = which(pls_fit$validation$PRESS == min(pls_fit$validation$PRESS))
validationplot(pls_fit, val.type="MSEP")
# choose best model
pls_pred = predict(pls_fit,predictors[-train_set,],ncomp=9)
pls_test_MSE <-mean((pls_pred-response_test)^2)
# PLS on full dataset
pls = plsr(Balance ~ ., data = data.frame(scaled_credit), scale = FALSE, ncomp=9)
summary(pls)
pls_official_coefficients <- as.numeric(pls$coefficients[,,9])
save(pls_fit,
     best_para,
     pls_test_MSE,
     file = "./data/pls_results.Rdata")
sink(file ="./data/pls_results.txt")
cat("PLS Model")
cat("\n")
pls_fit
cat("\n")
cat("Best Parameter")
cat("\n")
best_para
cat("\n")
cat("PLS Test MSE")
cat("\n")
pls_test_MSE
sink()