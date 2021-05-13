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
