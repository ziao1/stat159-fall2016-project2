## Exploratory Data Analysis
## Association between Response and Predictors

## Correlation Matrix
correlation_matrix = cor(credit[,c(1,2,3,4,5,6,11)])
save(correlation_matrix,
     file = "./data/correlation-matrix.Rdata")

## Scatter Plot Matrix
jpeg("./images/scatterplot-matrix.png")
pairs(credit[,c(1,2,3,4,5,6,11)])
dev.off()

## ANOVA
anova = aov(credit$Balance ~ credit$Income + credit$Limit + credit$Rating + credit$Cards + credit$Age + credit$Education)
save(anova,
     file = "./data/anova.Rdata")

## Conditional Boxplots
balance_male = credit$Balance[credit$Gender == ' Male']
balance_female = credit$Balance[credit$Gender == 'Female']
jpeg("./images/Conditional Boxplot of Male.png")
boxplot(balance_male, main = "Conditional Boxplot of Balance of Male", xlab = "Balance")
dev.off()

jpeg("./images/Conditional Boxplot of Female.png")
boxplot(balance_female, main = "Conditional Boxplot of Balance of Female", xlab = "Balance")
dev.off()

balance_student = credit$Balance[credit$Student == 'Yes']
balance_nonstudent = credit$Balance[credit$Student == 'No']
jpeg("./images/Conditional Boxplot of Student.png")
boxplot(balance_student, main = "Conditional Boxplot of Balance of Student", xlab = "Balance")
dev.off()

jpeg("./images/Conditional Boxplot of Nonstudent.png")
boxplot(balance_nonstudent, main = "Conditional Boxplot of Balance of Nonstudent", xlab = "Balance")
dev.off()

balance_married = credit$Balance[credit$Married == 'Yes']
balance_unmarried = credit$Balance[credit$Married == 'No']
jpeg("./images/Conditional Boxplot of Married.png")
boxplot(balance_married, main = "Conditional Boxplot of Balance of Married", xlab = "Balance")
dev.off()

jpeg("./images/Conditional Boxplot of Unmarried.png")
boxplot(balance_unmarried, main = "Conditional Boxplot of Balance of Unmarried", xlab = "Balance")
dev.off()


balance_aa = credit$Balance[credit$Ethnicity == 'African American']
balance_a = credit$Balance[credit$Ethnicity == 'Asian']
balance_c = credit$Balance[credit$Ethnicity == 'Caucasian']
jpeg("./images/Conditional Boxplot of African American.png")
boxplot(balance_aa, main = "Conditional Boxplot of Balance of African American", xlab = "Balance")
dev.off()

jpeg("./images/Conditional Boxplot of Asian.png")
boxplot(balance_a, main = "Conditional Boxplot of Balance of Asian", xlab = "Balance")
dev.off()

jpeg("./images/Conditional Boxplot of Caucasian.png")
boxplot(balance_c, main = "Conditional Boxplot of Balance of Caucasian", xlab = "Balance")
dev.off()