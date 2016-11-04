## Analysis

### Exploratry Data Analysis

**Quantitative Variables**

There are 7 quantitative variables in the dataset, including Income, Limit, Rating, Cards, Age, Education, Balance. For each of the variable, we computed minimum, maximum, range, median, quantile, IQR, mean, and standard deviation for each variable.

The following table is the summary statistics

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/eda_output.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/eda_output.png)

Then we make Histograms and Boxplots for each of the variables

* For Predictor Age:

Boxplot

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Age.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Age.png)

Histogram

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Age.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Age.png)

* For Predictor Cards

Boxplot

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Cards.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Cards.png)

Histogram

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Cards.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Cards.png)

* For Predictor Education

Boxplot

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Education.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Education.png)

Histogram

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Education.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Education.png)

* For Predictor Income

Boxplot

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Income.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Income.png)

Histogram

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Income.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Income.png)

* For Predictor Limit

Boxplot

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Limit.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Limit.png)

Histogram

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Limit.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Limit.png)

* For Predictor Rating

Boxplot

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Rating.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Boxplot%20of%20Rating.png)

Histogram

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Rating.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Histogram%20of%20Rating.png)

**Qualitative Variables**

There are 4 qualitative variables in the dataset, including Ethinicity, Gender, Married, Student. For each of the variable, we computed the frequency of each category within the variable and visualize the results by Bar Chart.

Ethinicity

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Bar%20Chart%20of%20Ethnicity.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Bar%20Chart%20of%20Ethnicity.png)

Gender

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Bar%20Chart%20of%20Gender.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Bar%20Chart%20of%20Gender.png)

Married

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Bar%20Chart%20of%20Married.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Bar%20Chart%20of%20Married.png)

Student

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Bar%20Chart%20of%20Student.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Bar%20Chart%20of%20Student.png)

**Association**

To study the association between predictors and response variable, we first calculate the correlation matrix among all predictors.

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/correlation_matrix.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/correlation_matrix.png)


Then we visualize the scatterplot mattrix

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/scatterplot-matrix.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/scatterplot-matrix.png)

Analysis of variance (ANOVA) is a collection of statistical models used to analyze the differences among group means and their associated procedures (such as "variation" among and between groups)

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/anova.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/anova.png)

Finally we visualize the conditional boxplots of Balance conditioned to each category of Gender, Ethnicity, Student and Married.


Ethinicity

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20African%20American.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20African%20American.png)

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Caucasian.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Caucasian.png)

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Asian.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Asian.png)

Gender

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Female.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Female.png)

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Male.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Male.png)

Married

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Married.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Married.png)

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Unmarried.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Unmarried.png)

Student

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Student.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Student.png)

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Nonstudent.png>](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Conditional%20Boxplot%20of%20Nonstudent.png)



