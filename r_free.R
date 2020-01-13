insurance = read.csv("insurance.csv")
insurance

dim(insurance)
ncol(insurance)
nrow(insurance)
head(insurance, n=20)
max(insurance$age)
#max(insurance$smoker)
#Get the person detail having  max age
max_age = subset(insurance , age==max(age))
max_age #total Number of Max Age People
insurance
#Only Male data
male_data = subset(insurance, sex=="male")
male_data
head(insurance)
#Children having greater than 3
child_3 = subset(insurance, children >=3)
child_3
#lives in southwest and smoke
smoking = subset(insurance,(smoker=="yes" & region=="southwest"))
smoking
#age <25 sex female children==0 and smoke ==yes
danger = subset(insurance,(age<=25 & sex=="female" & children==0&smoker =="yes"))
danger
#writing to csv
write.csv(danger,"dangerzone.csv",row.names = FALSE) #row.names = false will not write row index name 
#col.names = FALSE #will not write col names
write.csv(danger,"danger_no_col.csv",col.names = FALSE)
install.packages("xlsx")
#opening Excel File Format
library(xlsx)
data = read.xlsx("danger.xlsx",sheetIndex = 1)
#Statistical Methods
#mean(x, trim =0 , na.rm = FALSE,...)
#create a Vector
x = c(12,7,3,4,5,6,7,3,3,2)
mean(x)
median(x)
#Applying Trim Option
x = c(12,6,2,55,6,9,23,1,33,4 )
#When Trim parameter is suppplied, the values in the Vector get sorted and then the required numbers of observations\
#are dropped 
mean(x,trim = 0.3)
sum(x)
length(x)
x = c(12,6,2,55,6,9,23,1,33, NA )
mean(x,na.rm = T)
#Median is Middle Value in range
median(x,na.rm = T)

#Mode is the Highest Number of Occurance in the Vector 
#R linear Regression
# y = ax +b
#Y is the response variable 
#x is predictor variable 
#a and b are constant which are called the coefficient

height = c(151,174,138,186,128,136,179,163,152)
weight = c(63,81,56,91,47,57,76,72,62)
length(height)
length(weight)
#lm() Function is the basic regression Function 
#lm(formula , data)
#lets Apply the lm() Function
relation = lm(weight~height)
relation
summary(relation)

#predict(object,new_data)
a= data.frame(height=170) #Must be x Column Parameter
a
predict(relation,a)

#Visualize the Regression Graphically
#give the chart file a name 
png(filename = "linearregression.png")
#plot the chart
plot(height,weight,col="blue",main = "Height & Weight Regression ",  abline(lm(weight~height)),cex=1.3, pch =16,xlab = "Weight in Kg"
     ,ylab = "Height in CM")
#Save the File
dev.off()
#Multiple Regression
#lm(y~x1+x2+x3....,data)
mtcars #We load few Columns from the mtcars data
input = mtcars[,c("mpg","disp","hp","wt")]
input
#Create the Relation Ship Model
model = lm(mpg~disp+hp+wt,data = input)#Multiple Regression Y Column is mpg and x Columns are disp, hp , wt and data
print(model)
summary(model)
coef(model)
coef(model)[1]
coef(model)[-1]
print()
#Create Multiple Regression Equation
input = mtcars[,c("am","cyl","hp","wt")]
head(input)
#Lets Use glm
am.data = glm(formula = am~cyl+hp+wt, data = input,family = binomial)
am.data
summary(am.data)
#dnorm(x,mean,sf)
#pnorm(x,mean,sd)
#qnorm(p,mean,sd)
#rnorm(n,mean,sd)
#x is the vector of Number
#p is the Vector of Probabilities
#n is the number of observations
#dnorm() #Probability Distribution at each point for a given mean adn sd
x = seq(-10,10,by = 0.1)
x
y = dnorm(x,mean = 2.5 , sd = 0.5)
#Give the chart File a Name
png(file = "dnorm.png")
plot(x,y)
#save the Plot
dev.off()

#pnorm() #This Function gives the Probability of a normally distributed random number to be less that the value 
#of a given Number
#Create a sequence of Numbers between -10 and 10 incrementing by 0.2
x = seq(-10,10,by=0.2)
#Choose the Mean as 2.5 and Standard Deviation as 2
y = pnorm(x,mean=2.5,sd = 2)
plot(x,y)

#####
#qnorm()
#qnorm() takes the probability value and gives a number whose cumulative value matches the probability value
x = seq(0,1,by = 0.02)
y = qnorm(x,mean = 2, sd =1)
#Give the chart file a name 
png(filename = "qnorm.png")
#plot the Graph
plot(x,y)

#rnorm()
#This function is used to generate random numbers whose distribution is normal.It takes the sample size as 
#input and generates that many random numbers.

y = rnorm(50)
y
#Give the chart file Name
png(filename = "rnorm.png")
#plot the Histogram for this sample
hist(y,main = "Normal Distribution")
#Save the file
dev.off()
###########################################################################################
##### R-Bionomial Distribution model deals with finding the probability of success of an event which has only
#two possible outcomes in a series of experiments.
#dbinom(x, size, prob)
#pbinom(x, size = ,prob = )
#qbinom(p, size , prob)
#rbinnorm(n , size , prob)
#x is a Vector of Numbers
#p is vector of Probabilities
#n is number of Observations
#prob is the probability of success full of each trial


#dbinom()
#Create a sampe of 50 Numbers which are incremented by 1
x = seq(1,50,by =1)
x
#Create the Binomial distribution 
y = dbinom(x,50,0.5)
y#Give the chart File name
png(file = "dbinom.png")
#plot the graph of this sample
plot(x,y)


#pbinom()
#Probability of getting 26 or less heads from a 51 toess of coin
pbinom(26,51,0.5)

#qbinom()

#How Many heads will have a probability of 0.25 will come out when a coin is tossed 51
qbinom(0.25,51,1/2)

#rbinom()
#This function generates required number of random values of given probability from  a given sample
#Find 8 random Values from a sample of 150 with probability of 0.4
x = rbinom(8,150,0.4);x


#Poisson Regression
#log(y) = a+b1x1+b2x2+....bnxn
#Y is the response Variable
#a and b are the Numeric Coefficients
#x is the predictor variable

#basic Syantax for glm() function in Poisson regression is 
#glm(formula, data , family)
#Formula is the symbol presenting the realtionship  between the variables
#data is the data set giving the values of these variables
#family is R object to specify 









































