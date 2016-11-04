setwd("C:/Users/Lydia/Documents/Stat159/proj2")
library(pls)

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