#R Lab Five: One-way ANOVA

#Topics: 
#One-way ANOVA, model diagnostics, response transformation, Kruskal-Wallis test 
#Dataset: battery.txt posted on the class webpage
#Data: Daily energy expenditure for lean and obese women data (energy.txt) 
#posted on the class webpage: 
#http://www.sci.csueastbay.edu/~sfan/SubPages/CSUteach/st3502/labs/energy.txt  

#R code: fit the ANOVA model
# One way ANOVA
# battery lifetime vs. brand
# import data file of battery via RStudio
lifetime<-battery$lifetime
# change the data type of the group variable brand 
brand<-factor(battery$brand)

# first quick look of data
boxplot(lifetime~brand)
# conduct one-way anova
result<-aov(lifetime~brand)
summary(result)
# conduct Tukey multiple comparisons
TukeyHSD(result)


#Df Sum Sq Mean Sq F value Pr(>F)  
#brand        7  69.12   9.874   3.382 0.0206 *
#  Residuals   16  46.72   2.920             

#R code: model diagnostics

##### diagnostics
# extract residuals, fitted values
r<-residuals(result)
rs<-rstandard(result)
fits<-fitted.values(result)
# check the normality of residuals
qqnorm(rs)
qqline(rs,col=2)
shapiro.test(rs)
# p-value of .18 and the qq plot support the normality assumption

#.	Test for normality:
 # Ho: residuals follow a normal distribution 
#vs. Ha: they do not follow a normal distribution

#Shapiro-Wilk normality test
#data:  rs
#W = 0.9421, p-value = 0.1816

# check the equal variance assumption
# you must load library 'car' first
library(car)
plot(fits,rs,main="residuals vs. fitted values")
leveneTest(lifetime~brand)
# p-value of .94 supports the equal variance assumption

#.	Test for equal variances:  
 # Ho: variances of residuals/responses are equal 
#vs. Ha: they are not equal

#Levene's Test for Homogeneity of Variance (center = median)
#Df F value Pr(>F)
#group  7  0.3128 0.9375

#.	Check for independence
# check for independence among observations
plot(rs,type="l",main="run order plot")
# no time/order dependent pattern is shown

#R code: transform response and redo everything
##### response transformation (not needed here)
# example: the new response is log(lifetime)
ly<-log(lifetime)
# redo the whole procedure:
result2<-aov(ly~brand)
rs2<-rstandard(result2)
fits2<-fitted.values(result2)
qqnorm(rs2)
qqline(rs2,col=2)
shapiro.test(rs2)
plot(fits2,rs2,main="residuals vs. fitted values")
leveneTest(ly~brand)
plot(rs2,type="l",main="run order plot")

#R code: Kruskal Wallis (non-parametric) test
##### conduct Kruskal Wallis test
kruskal.test(lifetime~brand)

#Kruskal-Wallis rank sum test
#data:  lifetime by brand
#Kruskal-Wallis chi-squared = 13.01, df = 7, p-value = 0.07188