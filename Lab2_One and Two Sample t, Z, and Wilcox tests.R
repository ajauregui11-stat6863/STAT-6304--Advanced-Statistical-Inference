#Data: Daily energy expenditure for lean and obese women data (energy.txt) 
#posted on the class webpage: 
#http://www.sci.csueastbay.edu/~sfan/SubPages/CSUteach/st3502/labs/energy.txt  

#.	One sample t method
#R code: 
  #normaility checking
qqnorm(energy$expend)
qqline(energy$expend,col=2)
shapiro.test(energy$expend)
t.test(energy$expend,mu=8.5,alternative="two.sided",conf.level = .90)
#R output:		
  #Shapiro-Wilk normality test
#data:  energy$expend
#W = 0.95418, p-value = 0.3812
#One Sample t-test
#data:  energy$expend
#t = 1.3238, df = 21, p-value = 0.1998
#alternative hypothesis: true mean is not equal to 8.5
#90 percent confidence interval:
 # 8.356339 9.601843
#sample estimates:
 # mean of x 
#8.979091 
#Note: The four R functions for t distribution with degree of freedom of df
#dt(x, df) returns the t probability density at x
#pt(q, df) returns the t cumulative probability at q, P[t  < q]
#qt(p, df) returns the (p*100)th percentile of t
#rt(n, df) returns n random numbers generated from t distribution
#Power and sample size calculation: see R document (help(power.t.test))
# Ott, 6th ed., eg. 5.11
power.t.test(delta=.1,sd=.225,sig.level=.05,power=.99,type="one.sample",
             alternative="one.sided")
# Ott, 6th ed., eg. 5.8
power.t.test(n=50,delta=15,sd=35.2,sig.level=.01,type="one.sample",
             alternative="one.sided")

#.	One sample z method
#R does not have a function for z method 
#and thus we need to calculate the confidence interval 
#and z test statistic ourselves. Yet, we can use R to find statistics, 
#such as sample mean and sample S.D., critical value and p value.
#Note that if n is greater than 200, z method is almost the same as t method.

#.	Wilcoxon signed rank test
#R code:  
wilcox.test(energy$expend,mu=8.5)
#R output: 
 # Wilcoxon signed rank test with continuity correction
#data:  energy$expend
#V = 159, p-value = 0.2988
#alternative hypothesis: true location is not equal to 8.5

#.	Two-sample t Method: 
#  R code: Conduct pooled t test/interval for the two-sided 
#alternate hypothesis
t.test(energy$expend~energy$stature, alternative="two.sided", var.equal=T, 
       conf.level=.90)
#R output:
#Two Sample t-test
#data:  energy$expend by energy$stature
#t = -3.9456, df = 20, p-value = 0.000799
#alternative hypothesis: true difference in means is not equal to 0
#90 percent confidence interval:
 # -3.207130 -1.256118
#sample estimates:
 # mean in group lean mean in group obese 
#8.066154           10.297778 
#R code: Check the normality assumption for both group, 
#by graphs and tests
y<-split(energy$expend, energy$stature)
# normal qq plot for each group
qqnorm(y$lean, main="qq plot for lean women")
qqline(y$lean,col=2)
qqnorm(y$obese, main="qq plot for obese women")
qqline(y$obese,col=2)
# normality test for each group
shapiro.test(y$lean)
shapiro.test(y$obese)
#.	Two-sample Z method:
 # R does not have any function for z method as it is less popular. 
#However, you can use the results in t test and find the p value of z test. 
#For example, as the data in lean group do not follow a normal curve, 
#t test is no longer suitable. If the sample sizes were both large enough, 
#we may want to use (two-sample) z test. As population standard deviations 
#(sigmas) are unknown, the formula of z is identical to the formula 
#of t (with unequal variances), so we can use the t.test function 
#to find the z test statistic:
 # R code: 
t.test(energy$expend~energy$stature, alternative="two.sided", var.equal=F)
#R output: 
#t = -3.8555, df = 15.919, p-value = 0.001411
#Hence, z = t = -3.8555, the two-sided p value is 2*P(Z > |z|=3.8555) >, 
#which in R is:
  2*(1-pnorm(3.8555))
#[1] 0.0001154933
#Of course, because our sample sizes are quite small, 
  #two-sample z test is not appropriate either. 
  #Now we move on the non-parametric test.

  #.	Two-sample Wilcoxon Test:
  #R code: 
  wilcox.test(expend~stature,data=energy)
#R output: 
 # data:  expend by stature
#W = 12, p-value = 0.002122
#alternative hypothesis: true location shift is not equal to 0
#The p-value 0f .002122 is very small, less than .01, 
  #which shows strong evidence against null hypothesis 
  #or say supporting the alternative hypothesis. 
  #The conclusion, the data show strong evidence that the distributions of 
  #expenditure for lean and for obese women are (significantly) different 
  #at the significance level .002122.
#.	Check for Equal Variances:
 # R code: 
  var.test(expend~stature,data=energy,conf.level=.95)
#R output:
 # F test to compare two variances
#data:  expend by stature
#F = 0.78445, num df = 12, denom df = 8, p-value = 0.6797
#alternative hypothesis: true ratio of variances is not equal to 1
#95 percent confidence interval:
 # 0.1867876 2.7547991
#sample estimates:
 # ratio of variances 
#0.784446 
