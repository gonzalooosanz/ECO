#Nombre: Gonzalo Sanz Rodriguez 
# PREGUNTA 1: ¿Cuál es la frecuencia del monitor? El tiempo de refresco es de 2 segundos 
#  ¿Cuántos registros y cuántas variables hay?  Existen 8 variables y existen 30 registros

# PREGUNTA 2: Cuál es el tiempo de monitorización en total? ya que la primera medida es 11:58:23 y la ult es 11:59:21
# Se trata de 1 minuto o 58 segundos
getwd()
setwd("C:/Users/Gonzalo Sanz/Documents/ECO")
datosSAR<-read.csv("sarprueba.csv", stringsAsFactors=FALSE, dec=",")
str(datosSAR)

install.packages("dplyr")
library(dplyr)

#Renombra la primera columna X11.58.21 por horas
datosSAR<-rename(datosSAR, Horas=X11.58.21)
# Pone la fila 31 el nombre de mediasSAR
mediasSAR<-datosSAR[31,]
#Quita la linea 31 de nuestra BBDD
datosSAR<-datosSAR[-31,]
# Quita la segunda columna de la BBDD
datosSAR<-datosSAR[,-2]

# Se crea una nueva tabla con solo las columnas user y systemm
datosUS<-select(datosSAR, X.user, X.system)
# Luego muestra la pagina
plot(datosUS$X.user, type='l', col='red')

# Hace un plot de la tabla respecto al x.system

# Hace un histograma teniendo el eje x.user y despues el system

hist(datosUS$X.user, col='red')
hist(datosUS$X.system,col='blue')

# Quitamos la linea 25 que es la que nos daba problemas ya que era el valor mas alto y asignamos la eje x el de user y al y el de system
datosUS<-datosUS[-25,]
X<-datosUS$X.user 
Y<-datosUS$X.system

# Creamos una grafica de puntos ("p") con estos datos y despues ponemos la leyenda de la grafica
plot(X, Y, type="p", xlab="USUARIO", ylab="SISTEMA",col="red")
title("Relacci?n %usuario y %sistema")

# Hacemos la media con el eje y, luego lo asignamos a msistema
msistema<-mean(datosUS$X.system)

# Creamos una variable msistemareal el cual contiene el valor del x.system que equivale a 1.38
msistemareal<-mediasSAR$X.system

# Hacemos la media del user 
musuario<-mean(datosUS$X.user)
# Ahora creamos musuarioreal con el eje x.user
musuarioreal<-mediasSAR$X.user
# Creamos una tabla(vector, deben de ser iguales en el numero de filas /columnas) unicamente con las 2 variables msistema y msistemareal
df.sistema<-data.frame(msistema, msistemareal)

# Creamos una vector con las 2 subtablas 
df.tabla<-data.frame(df.sistema, df.usuario)
# Creamos una variable ErrorUsuarioReal en la que hacemos el valor abs de la media de la columna system - el valor de musuarioreal(o tambien la columna user) 
ErrorUsuarioReal<-abs(mean(datosSAR$X.system)-musuarioreal)
# Hacemos lo mismo peor con la media de user y el user real
ErrorUsuarioSuavizado<-abs(mean(datosSAR$X.user)-musuario)