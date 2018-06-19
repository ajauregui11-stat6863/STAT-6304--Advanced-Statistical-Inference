#### Normal, Binomial, Poisson Distribution/CLT/Normality Checking ####

#Four fundamental items can be calculated for a statistical distribution:
# .	Density or point probability (starting with d)
# .	Cumulated probability, distribution function (starting with p)
# .	Quantiles (starting with q)
# .	Random numbers (starting with r)

#a)	Let X be a normal random variable with given mean and sd. Then,
#.	Probability that X is less than or equal to x is pnorm(x,mean,sd)
#.	100pth percentile of X is qnorm(p,mean,sd)

#b)	Let X be a binomial random variable with n trials and success rate p. 
#Then,
#.	Probability that X is less than or equal to x is pbinom(x,n,p)
#.	100pth percentile of X is qbinom(p,n,p)
#.	Probability that X is equal to x is dbinom(x,n,p)

#c)	Let X be a Poisson random variable with location parameter ld. Then,
#.	Probability that X is less than or equal to x is ppois(x,ld)
#.	100pth percentile of X is qpois(p,ld)
#.	Probability that X is equal to x is dpois(x,ld)

#Central Limit Theorem(CLT)  
#Consider an experiment of flipping an unbalanced coin (with .3 chance to 
#get head up). Each time the result is either X =0 (tail) or 1 (head).
#a)	What is the distribution of X? Is it bell shaped (normal)?
#b)	Repeat the experiment 40 times. Let X-bar be the mean of the 40 results. By CLT, will it be approximately normal?   
#c)	Simulate the distribution of X-bar. Here is the R code:
  # simulate 5000 sums of 40 flipping results
  xbar<-rbinom(5000,40,.3)
  # mean is the sum over trial size
  xbar<-xbar/40
  # draw the histogram of the simulated data
  hist(xbar)
#Exercise:  Redo b) and c) with only 10 times of coin flipping. 
  xbar2<-rbinom(5000,10,.3)
  xbar2<-xbar2/10
  hist(xbar2)
  
#Normality Checking  
# .	By graphs: If the data does sampled from a normal distribution, 
  #its normal Q-Q plot will be more or less a straight line.
#  .	By tests: later
#  Example:
#    a)	Based on the data in Table 3.1 again, 
  #check if it is reasonable to assume the math scores 
  #(of all third to fifth graders) follow a normal curve.
math<-tb3dot1$Math
qqnorm(math,main="normal Q-Q Plot of math score")
qqline(math,col=2)

#b)	Simulate a random sample of 20 from norm(0,1) 
#and check the normality of the simulated data by the normal Q-Q plot. 
#What is the result? 
data<-rnorm(20,0,1)
qqnorm(data)
qqline(data,col=2)
