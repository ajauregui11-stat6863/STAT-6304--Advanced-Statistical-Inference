#Step 1: Key in data

units<-c(1,2,3,4,4,5,6,6,7,8,9,9,10,10)
time<-c(23,29,49,64,74,87,96,97,109,119,149,145,154,166)

#Step 2: Plot the scatterplot with the fitted regression line

plot(units,time,main="Repair Time vs. Units")
abline(lm(time~units))

#The overall pattern is pretty linear and the fitted regression line 
#fits the data well. Hence the SLR model seems appropriate

#Step 3: Fitting the SLR model

result<-lm(time~units)
summary(result)

#Output:	
  
 # Call:
  #lm(formula = time ~ units)

#Residuals:
 # Min      1Q  Median      3Q     Max 
#-9.2318 -3.3415 -0.7143  4.7769  7.8033 

#Coefficients:
 # Estimate 	Std. Error 	t value 	Pr(>|t|)    
#(Intercept)    4.162      	3.355    		1.24    	0.239    
#units         15.509      	0.505   		30.71 	8.92e-13 ***
 # ---
  #Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#Residual standard error: 5.392 on 12 degrees of freedom
#Multiple R-squared:  0.9874,	Adjusted R-squared:  0.9864 
#F-statistic: 943.2 on 1 and 12 DF,  p-value: 8.916e-13

#.	The fitted regression equation is

#Time= 4.162+ 15.509*Units

#.	The column Pr(>|t|) is the p-value of the test for Ho: coef = 0. 

#Since the p-value for "units" is almost 0, 
#the slope (estimated as 15.509) is significantly different to zero. 

#.	RSE = 5.392, which is the root mean square error (RMSE), 
#the estimate of sigma??????

#.	Adjusted R-sq measures the goodness of fit of the model to the data: 
#0% (not fit at all) to 100% (perfect fit).

#.	C.I. for coefficients (parameters)

#For each coefficient, its estimate and std. error (S.E.) are reported 
#and so we can find the confidence interval for the coefficient: 
  #coef +/- t_alpha/2 * SE
  #where the d.f. of t is the d.f. of the RSE in the output 
#(here it is 12, which is n-2 for SLR model). 
#For example, for 95% level, the t critical value at 12 d.f.  is 2.1788.

#Step 4: Assumption checking/model diagnostics
#We are now checking the assumptions for SLR model. 
#It is pretty much the same as in ANOVA model: three assumptions, 
#normality, equal variances and independence of residuals. 
#However, different to ANOVA model, there is no test for equal variance 
#assumption available.

#r<-residuals(result)
#rs<-rstandard(result)
#fits<-fitted.values(result)

#.	Test for normality: 
#Ho: residuals follow a normal distribution vs. Ha: Ho is false

# check the normality of (standard) residuals
#Shapiro-Wilk normality test

#data:  rs
#W = 0.96251, p-value = 0.7641

#.	Check for equal variance of (standard) residuals, and outliers, 
#by residual plot
#R code:
  
library(car)
plot(fits,rs,main="residuals vs. fitted values")

#.	All the standard residuals are within +/- 2 range, so no outliers exist.
#.	The plot shows no pattern, like a scattered random cloud.
#The equal variance assumption of residuals is reasonable.
