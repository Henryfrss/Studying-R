
#10 random number from normal distribution
rnorm(10)

# 10 numbers from uniform distribution
# first set of numbers are concentrated around zero
# second set are more or less equally spaaced
runif(10)


old.par <- par(mfrow=c(2,1))
hist(rnorm(100), main="Normal data")
hist(runif(100), main="Non-normal data")
par(old.par)

###Histograms are good to check normality
#NOTE - Nonparametric Methods are applicable to both
# "nonparametric" and "parametric"

#Measurement data are usually presented in R as Numerical vectors
x <- c(174, 162, 188, 192, 165, 168, 172.5)
# x = the name of the object
# <- = is an assignment operator
# c() = is a function to create vector
# every R object has a structure

#str() shows that x is a numerical vector
str(x)
#you can check if an object is a vector
is.vector(x)

#There are also multiple as.something()-like conversion functions

#to sort heights from smalles to biggest
sort(x)

#to reverse results
rev(sort(x))

#Ranked( or ordinal(categorico)) data 
#do not come directly from measurements
#do not easily correspond to numbers
#Always require nonparametric methods

#by default, R will identify ranked data as regular numerical vector

#(i.e,. Seven employees ranked by their heights)
rr <- c(2 ,1 ,3 , 3, 1, 1, 2)
#The ordered factor arranged in proper order by labels
(hh <- cut(x, 3, labels = c(1:3), ordered_result = TRUE))

#note that cut() is irreversible operation
as.numeric(hh)
x
hh


###Factor###
#In R, Factors, unlike character vectors 
#allow for easy transformation into numbers

#R uses the alphabetical order every 
#time when factors have to be converted into numbers
sex <- c("male", "female", "male", "male", "female", "male","male")
sex.f <- factor(sex)
sex.n <- as.numeric(sex.f)

#if your factor is made from numbers and you want
#to convert it back to numbers, convert it first
#to the characters vector, and onlu then
#to the numbers
ff<- factor(3:5)
as.numeric(as.character(ff))

#We can order factors in alphabetical order
m <- c("L", "S", "XL", "XXL", "S", "M", "L")
m.f <- factor(m)
m.o <- ordered(m.f, levels=c("S","M","L","XL","XXL"))

###Binary data 
#(do not mix with a binary file format) are a
#special case related with both
#nominal and ranked data

(is.male <- sex == "male")
#i.e, from ifelse factor
ifelse(sex=="female", "pink", "blue")

#Fractions, count and ranks
# Close to secondary data is an idea of compositional 
# data which are quantitative descriptions of the parts of
# the whole (probabilities, proportions, percentages etc.)

#In R, all kinds of missing data are denoted with two uppercase letters NA.
#R, always return a warning if there are ties