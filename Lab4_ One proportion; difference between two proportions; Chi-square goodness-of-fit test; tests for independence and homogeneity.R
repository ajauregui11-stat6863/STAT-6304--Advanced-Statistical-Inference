#R LAB SIX: Inferences for Proportions                
#Topics: 
#One proportion; difference between two proportions; 
#Chi-square goodness-of-fit test; tests for independence and homogeneity

#1.	Inferences for one proportion:
  
 # .	Z procedure

#prop.test(x, n, p, alternative = c("two.sided", "less", "greater"),
#conf.level = 0.95)

#.	Exact procedure

#binom.test(x, n, p, alternative = c("two.sided", "less", "greater"),
#conf.level = 0.95)

#See the help file in R (?prop.test, ?binom.test) for more detail.

#Example 10.1. 
n=870
Y=330
#Conduct a test for Ho: ???=.35 vs. Ha: ???>.35 and find a 90% confidenc
#e level of ???.

#R code: 
prop.test(330,870,.35,alternative="greater")
prop.test(330,870,alternative="two.sided", conf.level=.90)

#R output: 
 # 1-sample proportions test with continuity correction

#data:  330 out of 870, null probability 0.35
#X-squared = 3.1578, df = 1, p-value = 0.03778
#alternative hypothesis: true p is greater than 0.35

#90 percent confidence interval:
 # 0.3521005 0.4072844

#R code:
binom.test(330,870,p=.35,alternative="greater")
binom.test(330,870,conf.level = .90)

#R output:
 # Exact binomial test

#data:  330 and 870
#number of successes = 330, number of trials = 870,
#p-value = 0.03838
#alternative hypothesis: true probability of success is greater than 0.35

#90 percent confidence interval:
 # 0.3520104 0.4072182

#2.	Inferences for the difference in two proportions ???????????????:
  
 # .	Z procedure

#prop.test(x, n, p = NULL,
 #         alternative = c("two.sided", "less", "greater"),
  #        conf.level = 0.95, correct = TRUE)

#.	Fisher Exact procedure

#fisher.test(x, alternative = c("two.sided", "less", "greater"))

#See the help file in R (?prop.test, ?fisher.test) for more detail.

#Example 10.6.  n=(n1, n2)=(527, 608) and Y=(Y1, Y2)=(413, 392)

#Conduct a test for Ho: pi1 = pi2 vs. Ha: pi1 > pi2 ??????????????????and calculat
#e 95% confidence interval of (pi1 - pi2)???????????????
                                                                                     
#R code:
  n<-c(527,608)
  y<-c(413,392)
  prop.test(y,n,alternative = "greater")
  prop.test(y,n,alternative = "two.sided", conf.level=.95)
#R output:
# 2-sample test for equality of proportions with continuity correction
#data:  y out of n
 #X-squared = 25.76, df = 1, p-value = 1.933e-07
 #alternative hypothesis: greater
 
 #95 percent confidence interval:
  # 0.08537646 0.19251229
 
 #Note. If the null difference is not zero, you need to do the Z test by hand.
 # Example 10.8. Fisher Exact Procedure of 2x2 tables
 
  #R code: 
x<-matrix(c(38,14,4,7),nrow=2,ncol=2)
fisher.test(x,alternative = "greater")
  
#  R output: 
    
 #   Fisher's Exact Test for Count Data
  
  #data:  x
  #p-value = 0.02537
  #alternative hypothesis: true odds ratio is greater than 1
  
  
  #3.	Goodness of Fit test for a given distribution:
  
  #chisq.test(x=observed counts, p=given distribution)
  
  #Example 10.10. 
  
  #R code:
  
  d<-c(120,60,10,10)
  h<-c(.50,.25,.10,.15)
  chisq.test(x=d,p=h)
  
  #R output:
  
#  Chi-squared test for given probabilities
  
 # data:  d
  #X-squared = 24.333, df = 3, p-value = 2.128e-05
  
  
#  4.	Test for independence between two categorical variables:
  
 # chisq.test(x=matrix of observed counts)
  
  #Example 10.13.
  
  #R code:
  
  d<-matrix(c(15,8,1,32,29,20,18,23,25,5,18,22),nrow=3,ncol=4)
  chisq.test(x=d)
  
  #R output:
  
  #Pearson's Chi-squared test
  
  #data:  d
  #X-squared = 27.135, df = 6, p-value = 0.0001366
  
  