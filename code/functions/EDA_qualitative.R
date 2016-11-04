## Exploratory Data Analysis
## Qualitative Variables

## Histograms for quantitative variables
jpeg("./images/Histogram of Income.png")
hist(credit$Income, main = "Histogram of Income", xlab = "Income")
dev.off()

jpeg("./images/Histogram of Limit.png")
hist(credit$Limit, main = "Histogram of Limit", xlab = "Limit")
dev.off()

jpeg("./images/Histogram of Rating.png")
hist(credit$Rating, main = "Histogram of Rating", xlab = "Rating")
dev.off()

jpeg("./images/Histogram of Cards.png")
hist(credit$Cards, main = "Histogram of Cards", xlab = "Cards")
dev.off()

jpeg("./images/Histogram of Age.png")
hist(credit$Age, main = "Histogram of Age", xlab = "Age")
dev.off()

jpeg("./images/Histogram of Education.png")
hist(credit$Education, main = "Histogram of Education", xlab = "Education")
dev.off()

## Boxplots for quantitative variables
jpeg("./images/Boxplot of Income.png")
boxplot(credit$Income, main = "Boxplot of Income", xlab = "Income")
dev.off()

jpeg("./images/Boxplot of Limit.png")
boxplot(credit$Limit, main = "Boxplot of Limit", xlab = "Limit")
dev.off()

jpeg("./images/Boxplot of Rating.png")
boxplot(credit$Rating, main = "Boxplot of Rating", xlab = "Rating")
dev.off()

jpeg("./images/Boxplot of Cards.png")
boxplot(credit$Cards, main = "Boxplot of Cards", xlab = "Cards")
dev.off()

jpeg("./images/Boxplot of Age.png")
boxplot(credit$Age, main = "Boxplot of Age", xlab = "Age")
dev.off()

jpeg("./images/Boxplot of Education.png")
boxplot(credit$Education, main = "Boxplot of Education", xlab = "Education")
dev.off()

## Frequency and Relative Frequency for qualitative variables
male = sum(credit$Gender == ' Male')
female = sum(credit$Gender == 'Female')
male_prob = male/400
female_prob = female/400

student = sum(credit$Student == 'Yes')
nonstudent = sum(credit$Student == 'No')
student_prob = student/400
nonstudent_prob = nonstudent/400

married = sum(credit$Married == 'Yes')
unmarried = sum(credit$Married == 'No')
married_prob = married/400
unmarried_prob = unmarried/400

african_american = sum(credit$Ethnicity == 'African American')
asian = sum(credit$Ethnicity == 'Asian')
caucasian = sum(credit$Ethnicity == 'Caucasian')
african_american_prob = african_american/400
asian_prob = asian/400
caucasian_prob = caucasian/400

## Bar Charts for qualitative variables
jpeg("./images/Bar Chart of Gender.png")
barplot(table(credit$Gender), main="Bar Chart for Gender")
dev.off()

jpeg("./images/Bar Chart of Student.png")
barplot(table(credit$Student), main="Bar Chart for Student")
dev.off()

jpeg("./images/Bar Chart of Married.png")
barplot(table(credit$Married), main="Bar Chart for Married")
dev.off()

jpeg("./images/Bar Chart of Ethnicity.png")
barplot(table(credit$Ethnicity), main="Bar Chart for Ethnicity")
dev.off()

