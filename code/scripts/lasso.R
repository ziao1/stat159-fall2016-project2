# Lasso Regression
library("glmnet")

#pre-modeling data processing
credit <- read.csv("data/Credit.csv")
credit <- credit[,-1]

#dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

#removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[,-1], Balance = credit$Balance)

#scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

#export scaled data
write.csv(scaled_credit, file = "./data/scaled_credit.csv")

set.seed(5)
train_set <- sample(c(1:400), size = 300)
predictors = scaled_credit[,c(1:11)]
response = scaled_credit[,c(12)]
test=(-train_set)
response_test=response[test]

## Lasso Regression
grid = 10^seq(10, -2, length = 100)
lasso_train = cv.glmnet(as.matrix(predictors[train_set,]), response[train_set], intercept = FALSE, lambda = grid, standardize = FALSE)

plot(lasso_train)
bestlam_2 = lasso_train$lambda.min
# choose best model
lasso_pred=predict(lasso_train,s=bestlam_2 ,newx=predictors[-train_set,])
lasso_test_MSE <-mean((lasso_pred-response_test)^2)
# lasso on full dataset
lasso = glmnet(predictors,response,lambda=grid, intercept = FALSE)
lasso_coef = predict(lasso,type="coefficients",s=bestlam_2)
lasso_coef[lasso_coef!=0]
lasso_official_coef  <-as.numeric(lasso_coef)[-1]
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

