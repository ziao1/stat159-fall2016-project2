# PCR
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

## Principal Components Regression
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

