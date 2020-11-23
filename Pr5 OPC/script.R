df1<-read.csv("datos1.csv")
str(df1)
ModeloA <- df1$ModeloA
ModeloB <- df1$ModeloB

ICalpha<-function(ModeloA, ModeloB, alfa)
{
  n<-length(ModeloA)
  diferencias<-ModeloA-ModeloB
  mediad<-mean(diferencias)
  mediad2<-mean(diferencias^2)
  varianza <- mediad2 - mediad^2
  s<-sqrt(varianza)
  valort<-qt(alfa/2,n-1,lower.tail = F)
  valor<-valort*s/sqrt(n)
  cotaInf<-mediad-valor
  cotaSup<-mediad+valor
  df<-data.frame(cotaInf, cotaSup)
  return(df)
}

IC95 <- ICalpha(ModeloA, ModeloB, 0.05)
print(IC95)
library(stats)
help(t.test)
t95<-t.test(x=ModeloA,y=ModeloB,conf.level=0.95)
print(t95)
install.packages("TeachingDemos")
library(TeachingDemos)
z95 <- z.test(x=ModeloA, y=ModeloB, stdev=1.58, conf.level = 0.95)

print("Intervalo de confianza al 95%")

IC95
z95
t95

IC99 <- ICalpha(ModeloA, ModeloB, 0.01)
t99 <- t.test(x=ModeloA,y=ModeloB,conf.level=0.99)
z99 <- z.test(x=ModeloA, y=ModeloB, stdev=1.58, conf.level = 0.99)

print("Intervalo de confianza al 99%")

IC99
z99
t99