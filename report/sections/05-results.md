## Results

 Since it is a continuous prediction problem, we choose Least Squares Regression as our model. In addition, we performed two Shrinkage Methods (Ridge Regression and Lasso Regression) and two Dimension Reduction Methods (Principal Components Regression and Partial Least Squares Regression) to compare the results with our base model. 

Then we used 10-fold Cross Validation to choose minimum lambda for Shrinkage Methods and minimum validation components for Dimension Reduction Methods. With the chosen parameter, we compare results by calculating Mean Square Error on test dataset.

The following table is the test Mean Square Error for the four methods.

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/test-MSE.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/test-MSE.png)

From the table, we can see that the Lasso Regression has the minimum test Mean Squared Error in this case, followed by Ridge Regression. The Dimension Reduction Methods in this case do not perform as well as Shrinkage Methods.

Then to see which predictors matter most in prediction, we visualize the coefficients of predictors within each method as a table.

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/coefficients-values.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/coefficients-values.png)

From the table, we can see that in all five methods we used for prediction, Limit is the single most important predictor for Balance which corresponds to our common sense that amount of limit is usually highly correlated to amount of Balance. 

For Ridge Regression, the second and third important factors are Rating and Income. For Lasso Regression, the second and third important factors are Income and Rating. For Pricipal Components Regression, the second and third important factors are Income and Rating. For Parse Least Squares Regression, the second and third important factors are Income and Rating. Hence we can conclude that the three leading factors are Limit, Income, and Rating.


To get a better intuition of the importance of each factor, we visualize the coefficients of each predictor in each five methods in bar plots.

* OLS

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/OLS.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/OLS.png)

* Ridge

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Ridge.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Ridge.png)

* Lasso

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Lasso.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/Lasso.png)

* PCR

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/PCR.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/PCR.png)

* PLS

![<img src="https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/PLS.png">](https://github.com/ziao1/stat159-fall2016-project2/raw/master/images/PLS.png)






