#Book of Alexey Shipunov - page 375 to 387

#Read data from bugs.txt
data <- read.table("data/bugs.txt", header = TRUE)

#Find the males with the Length higher than 10 mm
data.m.big <- data[data$SEX == 1 & data$LENGTH > 10 ,]

#Add new colum WEIGHT.R ( ratio between weight and length)
data$WEIGHT.R <- data$WEIGHT/data$LENGTH

#to save the new column at your data.txt
write.table(data, file = "data/bugs.txt", quote = FALSE)

#change SEX and COLOR structure, Numerical to Categorical
data$SEX <- factor(data$SEX, labels = c("female", "male"))
data$COLOR <- factor(data$COLOR, labels = c("red", "blue", "green"))
#If the data have missed values(NA), the commands above will not work
data[3,3] <- NA
#To calculate mean without noticing missing data
mean(data$WEIGHT, na.rm = TRUE)
#Another way is to remove rows with NA from the data
data2.o <- na.omit(data)

#Important to caregorical data
#Look how many times every value appear in the data file
table(data$SEX)
table(data$COLOR)

#Transform frequencies into percents(100% is the total number of bugs)
100*prop.table(table(data$SEX))

#standard deviation(desvio padrao)
sd(data$WEIGHT)
#sd for each numerical column( col 3, 4)
sapply(data[ , 3:4], sd)
#with a missed value( NA VALUE)
sapply(data[ , 3:4], sd, na.rm = TRUE)

#Coefficient of variation (CV)
100*sd(data$WEIGHT)/mean(data$WEIGHT)

#We can calculate any characteristic separately
#For example, means for insect weights
tapply(data$WEIGHT, data$SEX, mean)
#How many individuals of each color are among males and females?
table(data$COLOR, data$SEX)
#Now the same in percents
100*prop.table(table(data$COLOR, data$SEX))
#Mean values of weight separately for every combination of color and sex
#(i.e., for red males, red females, green males.. and so on)
tapply(data$WEIGHT, list(data$SEX, data$COLOR), mean)

#Plotting
hist(data$WEIGHT, breaks=3)
#(to see more detailed, increase the number of breaks)
#if you want to split data in the specific way
#(i.e., by 20 units, starting from 0 and ending in 100)
hist(data$WEIGHT, breaks=seq(0, 100, 20))

#Boxplot
#show outliers, maximum, minimum, quartile range and median 
#for any measurement variable
boxplot(data$LENGTH)
#for males and females separately
boxplot(data$LENGTH ~ data$SEX)

#There are two commands which together help to check normality of the character
qqnorm(data$WEIGHT); qqline(data$WEIGHT)

#Scatterplot where all bugs are represented with small circles
plot(data$LENGTH, data$WEIGHT, type="p")
#(type="p" is the default for plot()
#to change the size of dots, use the cex parameter
plot(data$LENGTH, data$WEIGHT, type="p", cex=0.5)
plot(data$LENGTH, data$WEIGHT, type="p", cex=2)
#to change the circles into triangle
plot(data$LENGTH, data$WEIGHT, type="p", pch=2)
#to change the circle for the SEX text code (0/1)
plot(data$LENGTH, data$WEIGHT, type="n")
text(data$LENGTH, data$WEIGHT, labels=data$SEX)
#the same plot, but only with one-letter labels
plot(data$LENGTH, data$WEIGHT, pch=as.character(data$SEX))

#if you want different types, try (0-25)  
plot(data$LENGTH, data$WEIGHT, pch=15)
#Its possible to specify different background and frame colors/
plot(data$LENGTH, data$WEIGHT, type="n")
text(data$LENGTH, data$WEIGHT, labels=data$SEX, col=10)

###NOT WORKING###
#You can use symbols from Hershey fonts
plot(data$LENGTH^3, data$WEIGHT, type="n",xlab=expression("Volume (cm"^3*")"), ylab="Weight")
text(data$LENGTH^3, data$WEIGHT, labels=ifelse(data$SEX, "\\MA", "\\VE"), vfont=c("serif","plain"), cex=1.5)

#we can paint symbols with different colors
plot(data$LENGTH, data$WEIGHT, type="n", main = "Bugs Weight*Length", xlab = "LENGTH", ylab = "WEIGHT")
points(data$LENGTH, data$WEIGHT, pch=c(0,3), col=1:2)
#and add a legend
legend("bottomright", legend=c("male", "female"),pch=c(0, 3), col=1:2)

#SAVE THE PLOT AS PDF FILE 
dev.copy(pdf, "graph.pdf")
dev.off()

#There is also a better way to save plots 
#because it does not duplicate to screen and
#therefore works better in R scripts

pdf("graph.pdf")
plot(data$LENGTH, data$WEIGHT, type="n", main = "Bugs Weight*Length", xlab = "LENGTH", ylab = "WEIGHT")
points(data$LENGTH, data$WEIGHT, pch=c(0,3), col=1:2)
legend("bottomright", legend=c("male", "female"),pch=c(0, 3), col=1:2)
dev.off()

###BE CAREFUL !!!###
#note here that R issues no warning if the 
#file with the same name is already exist on the disk
#it simply erases it and saves the new one)

#Testing
#The significance of difference between means for paired parametric data
t.test(data$WEIGHT, data$LENGTH, paired=TRUE)