#Exercício 11 da Apostila 1

#Amostra de 40 elementos
amostra <- c(3.67, 5.36, 5.28, 0.90,  
             1.82, 3.96, 5.41, 5.09,  
             3.73, 6.54, 7.77, 4.07,
             4.10, 5.84, 4.65, 8.67,
             4.30, 7.35, 1.88, 0.90,
             1.28, 3.63, 2.12, 6.67,
             8.14, 2.93, 4.26, 8.96,
             2.43, 2.82, 2.78, 4.00,
             4.17, 8.45, 5.54, 2.00,
             2.88, 4.15, 6.00, 2.01)

### Agrupe os dados em uma distribuição de frequências, considerando o limite
### inferior igual a zero, o superior igual a 10 e utilizando cinco classes de mesma 
### Amplitude
#Premissas:
# Li = 0
# Ls = 10

summary(amostra)

#Amplitude - h
h <- (max(amostra) - min(amostra))

#Classes de mesma amplitude, (h/5) = 1,612 -> h=2
#seq() cria as cinco classes com amplitude h=2 com Li e Ls
k <- seq(0,10, by=(round(h/5)))

#Agrupa os dados na classe criada
#com o comando cut()
class <- cut(amostra, k)

#table() reproduz a classificacao da tabela
table(class)
#reproduz a mesma classificacao da tabela de uma forma melhor
transform(table(class))
#cria um objeto para essa tabela
Freq <- transform(table(class))
Freq
#Cria a coluna de Frequencia Relativa e
# as Colunas de Frequencia acumulativas
Freq.sum <- transform(Freq, Cum_Freq=cumsum(Freq), Rel_Freq=prop.table(Freq), Cum_RFreq=cumsum(prop.table(Freq)))

Freq.sum
str(Freq.sum)

### Contrua um histograma de frequencias relativas
hist(amostra, breaks = k, xlab = "Classes", ylim = c(0,20))
### ou pode ser feito assim tb 
hist(amostra, breaks = 5)

# Una os pontos médios de cada retangulo, obtendo o poligono de frequencias
# relativas e classique o conjunto quando a assimetria

