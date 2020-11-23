getwd()
setwd("C:/Users/Gonzalo Sanz/Documents/ECO")

datosTOP<-read.csv("topprueba.csv",stringsAsFactors = FALSE, dec = ",")
View(datosTOP)
str(datosTOP)#Vista de los datos

datosTOP<-datosTOP[-(1:2),]
datosTOP<-datosTOP[,-1]#Eliminamos las dos primeras filas y despues eliminamos la primera columna

plot(datosTOP$VIRT)
plot(datosTOP$X.CPU)#Ahora vamos a ver la representacion gráfica de el porcentaje de datos de uso de CPU y Memoria Virtual

plot(as.factor(datosTOP$USUARIO), datosTOP$VIRT)
title("Uso de la Memoria Virtual")#En este paso Realizamos un diagrama BoxPlot para cada usuario

X<-datosTOP$X.CPU 
Y<-datosTOP$VIRT/(1024)
plot(X, Y, type="l", xlab="CPU", ylab="Mem. Virtual",col="red")
title("Relación entre Memoria Virtual y % de CPU")#Relación entre el uso de la memoria Virtual y el % de CPU en los procesos