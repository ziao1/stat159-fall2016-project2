##regression models
library("glmnet")
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


##OLS
ols <-lm(Balance~., data = data.frame(scaled_credit))
ols_coeffs <- as.numeric(ols$coefficients)[-1]

##Ridge regression
grid <- 10^seq(10, -2, length = 100)
model_data <-scaled_credit[train_set,]
ridge_train <- cv.glmnet(model_data[,-12], y = model_data[,12] , intercept = FALSE, 
                         standardize = FALSE, lambda = grid)

#lambda min
bestlam_1 <- ridge_train$lambda.min

# choose best model
ridge_pred=predict(ridge_train,s=bestlam_1 ,newx=predictors[-train_set,])
ridge_test_MSE <-mean((ridge_pred-response_test)^2)

#ridge on full dataset
ridge = glmnet(predictors,response,lambda=grid, intercept = FALSE)
ridge_coef = predict(ridge,type="coefficients",s=bestlam_1)
ridge_coef[ridge_coef!=0]
ridge_official_coef <-as.numeric(lasso_coef)[-1]

save(ridge_train,
     bestlam_1,
     ridge_test_MSE,
     file = "./data/ridge_results.Rdata")
sink(file ="./data/ridge_results.txt")
cat("Ridge Model")
cat("\n")
ridge_train
cat("\n")
cat("Best Lambda")
cat("\n")
bestlam_1
cat("\n")
cat("Lasso Test MSE")
cat("\n")
ridge_test_MSE
sink()

## Lasso Regression
grid = 10^seq(10, -2, length = 100)
lasso_train = cv.glmnet(predictors[train_set,], response[train_set], intercept = FALSE, lambda = grid, standardize = FALSE)

plot(lasso_train)
bestlam_2 = lasso_train$lambda.min
# choose best model
lasso_pred=predict(lasso_train,s=bestlam_2 ,newx=predictors[-train_set,])
lasso_test_MSE <-mean((lasso_pred-response_test)^2)
# lasso on full dataset
lasso = glmnet(predictors,response,lambda=grid, intercept = FALSE)
lasso_coef = predict(lasso,type="coefficients",s=bestlam_2)
lasso_coef[lasso_coef!=0]
lasso_official_coef  <-as.numeric(ridge_coef)[-1]
save(lasso_train,
     bestlam_2,
     lasso_test_MSE,
     file = "./data/lasso_results.Rdata")
sink(file ="./data/lasso_results.txt")
cat("Lasso Model")
cat("\n")
lasso_train
cat("\n")
cat("Best Lambda")
cat("\n")
bestlam_2
cat("\n")
cat("Lasso Test MSE")
cat("\n")
lasso_test_MSE
sink()

## Principal Components Regression
library(pls)
pcr_fit = pcr(Balance ~ ., data = data.frame(scaled_credit), subset = train_set, scale = FALSE, validation ="CV")
summary(pcr_fit)
best_para_1 = which(pcr_fit$validation$PRESS == min(pcr_fit$validation$PRESS))
validationplot(pcr_fit, val.type="MSEP")
# choose best model
pcr_pred = predict(pcr_fit,predictors[-train_set,],ncomp=11)
pcr_test_MSE <-mean((pcr_pred-response_test)^2)
# PCR on full dataset
pcr = pcr(Balance ~ ., data = data.frame(scaled_credit), scale = FALSE, ncomp=11)
summary(pcr)
pcr_official_coefficients <- as.numeric(pcr$coefficients[,,11])
save(pcr_fit,
     best_para_1,
     pcr_test_MSE,
     file = "./data/pcr_results.Rdata")
sink(file ="./data/pcr_results.txt")
cat("PLS Model")
cat("\n")
pcr_fit
cat("\n")
cat("Best Parameter")
cat("\n")
best_para_1
cat("\n")
cat("PCR Test MSE")
cat("\n")
pcr_test_MSE
sink()

## Partial Least Squares Regression
library(pls)
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
