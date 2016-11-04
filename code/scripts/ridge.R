#pre-modeling data processing
credit <- read.csv("~/Stat159/proj2/data/Credit.csv")
credit <- credit[,-1]

#dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

#removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[,-1], Balance = credit$Balance)

#scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

#export scaled data
write.csv(scaled_credit, file = "./data/scaled_credit.csv")

#training and testing sets
set.seed(5)
train_set <- sample(c(1:400), size = 300)
predictors = scaled_credit[,c(1:11)]
response = scaled_credit[,c(12)]
test=(-train_set)
response_test=response[test]

##Ridge regression
grid <- 10^seq(10, -2, length = 100)
model_data <-scaled_credit[train_set,]
ridge_train <- cv.glmnet(model_data[,-12], y = model_data[,12] , intercept = FALSE, 
                         standardize = FALSE, lambda = grid, alpha = 0)

#lambda min
bestlam_1 <- ridge_train$lambda.min

# choose best model
ridge_pred=predict(ridge_train,s=bestlam_1 ,newx=predictors[-train_set,])
ridge_test_MSE <-mean((ridge_pred-response_test)^2)

#ridge on full dataset
ridge = glmnet(predictors,response,lambda=grid, intercept = FALSE, alpha = 0)
ridge_coef = predict(ridge,type="coefficients",s=bestlam_1)
ridge_official_coef <-as.numeric(ridge_coef)[-1]

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
