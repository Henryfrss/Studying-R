###Exercício 5 da Apostila 2

#amostra de 5 casais foi colhida em um determinado bairro
#e seus salarios anuais(em milhares de reais) estao na tabela abaixo
#X = Homem e Y = Mulher

amostra <- data.frame(
  X=c(10,13,15,17,20),
  Y=c(9,10,13,13,15)
  )
t(amostra)

#(5.1)Salario anual medio dos homens
mean(amostra$X)
#Desvio padrao do salario anual dos homens
sd(amostra$X)

#(5.1)Salario anual medio das mulheres
#Desvio padrao do salario anual das mulheres
mean(amostra$Y)
sd(amostra$Y)

#(5.3)Construa o diagrama de dispersão
scatter.smooth(amostra, span = 3)

#(5.4)Encontre a correlação entre o salario anual dos homens e das mulheres
cor(amostra$X, amostra$Y)
cor.test(amostra$X,amostra$Y)
###cor = 0.9649013
#correlação positiva forte

#(5.5)Salario medio familiar e a variancia
mean((amostra$X+amostra$Y)/2)
var(amostra$X, y=amostra$Y)

#(5.6)Se x é descontado em 8% e y em 6%
#salario anual médio e a variancia?
salario <- data.frame(
  X = c(amostra$X*0.92),
  Y = c(amostra$Y*0.94)
)
t(salario)
mean((salario$X+salario$Y)/2)
var(salario$X, y=salario$Y)

#(6.1)Equação da regressão linear
#(6.2)Faça uma previsao de quanto ganharia uma mulher cujo 
#homem está ganhando 22000 anuais

lm(amostra$Y ~ amostra$X)
#Y = a +bX
# a = (Intercept) ou (coeficiente angular - parâmetro da regressão)
# b = amostra$x ou (coeficiente linear)

###Equação da regressão linear###
#Y = 2.6897 + 0.6207*X
y <- 2.6897 + (0.6207*22000)
y
#Interpretação
#Como os valores de salários estão em ordem de milhares de reais
#Para um salário do homem no valor igual a "0"
#Temos que uma mulher tem um salário 
#no valor de 2.6887*1000 = 2688,70

#E para um salário do homem = 1000
#Temos um salário da mulher igual => 2.6897 + (0.6207*1000)
# Y => 623.3897

#(6.3) Determine o erro padrão da regressão
model <-lm(amostra$Y ~ amostra$X)
summary(model)

#In summary(), 
# we got the Estimate Std. Error, (SE)
# Which defines the accuracy of beta coefficients,
# For a given beta coefficient, the SE reflects
# how the coefficient varies under repeated sampling
# It can be used to compute the confidence interval and the t-statistic


#Regression line - Study

#Regression line - utilizando ggplot2
#linhas abaixos retirados do livro Practical Statistics for Data Scientists
library(ggplot2)
ggplot(amostra, aes(X,Y)) + geom_point() + stat_smooth(method = "lm")  

###OBS in ggplot: if you get the error "invalid graphics state"
#try to run
dev.off()

#how to check the quality of linear regression model
model <- lm(amostra$Y ~ amostra$X)
model <- lm(salario$Y ~ salario$X)
summary(model)

#Call = shows the function call used to compute regression model
#
#Residuals = Provide a quick view of the distribution of the residuals
#             which by definition have a mean zero. Therefore, the median 
#              should not be far from zero, and the minimun and maximum should
#               be roughly equal in absolute value
#
#Coeficients = Shows the regression beta coefficients and their statistical signigicance.
#               Predictor variables, that are significantly associated to the outcome variable
#                 are marked by stars
#
# *Residual standard error (RSE) - The average variation of point around the fitted regression line
#                   ###the lower the RSE, the better it is###
# *R-squared(R2)
# *F-stastistic 
###   these three are metrics that are used to check how weel the model fits to our data

#Coeficients:
##Estimate Std.Error = the standard errors(SE), 
#   which defines the accuracy of beta coefficients.
#     for a given beta coefficient, the SE reflects how the coefficient varies
#       under repeated sampling, it can be used to compute the confidence intervals 
#         and the t-statistic.
#
#t-statistic and the associated p-value,
#   which defines the statistical significance of the beta coefficients
#

####t-statistic and p-values####
#   For a given predictor, 
#   the t-statistic (and its associated p-value) tests
#   wheter or not there is a statistically significant relationship
#   between a given predictor and the outcome variable, That is
#   the beta coefficient of the predictor is signicantly
#   different from zero.

####The statistical hypotheses are as follow:
#   *Null Hypothesis (H0): the coefficients are equal to zero
#     (i.e., no relationship between x and y)
#   *Alternative Hypothesis (Ha): the coefficients are not equal to zero
#     (i.e., there is some relationship between x and y)

####t-statistic => t = (b - 0)/SE(b)
#     measures the number of standard deviations that b is away from 0,
#     Thus a large t-statistic will produce a small p-value.
#
######   The higher t-statistic (and the lower the p-value),#####
######      the more significant the predictor              #####

#the symbol to the right visually specifies the level o significance
######    one star means 0.01 < p < 0.05                    #####
#       The more the stars beside the variable's p-value    #
#       The more significant the variable                   #

###### The t-statistic is a very useful guide for whether or not
#       to include a predictor in a model.

#     High t-statistics (which go with low p-values near 0)
#     indicate that a predictor should be retained in a model,
#     while very low t-statistics indicate a predictor could be dropped.