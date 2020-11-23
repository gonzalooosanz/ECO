---
title: "ECO"
author: "Gonzalo Sanz y Fernando Gonzalez Navarro"
date: "22/2/2020"
output: html_document
---

Vista de los datos 

``````{r}
datosTOP<-read.csv("topprueba.csv",stringsAsFactors = FALSE, dec = ",")
View(datosTOP)
str(datosTOP)
```` 

Vamos a proceder a eliminar filas y columnas de nuestra BBDD:

Eliminamos las dos primeras filas y despues eliminamos la primera columna

`````{r}
datosTOP<-datosTOP[-(1:2),]
datosTOP<-datosTOP[,-1]
`````

Ahora vamos a ver la representacion gráfica de el porcentaje de datos de uso de CPU y Memoria Virtual

```{r echo= FALSE}
plot(datosTOP$VIRT)
plot(datosTOP$X.CPU)
```

En este paso Realizamos un diagrama BoxPlot para cada usuario

```{r echo= FALSE}
plot(as.factor(datosTOP$USUARIO), datosTOP$VIRT)
title("Uso de la Memoria Virtual")

```


Relación entre el uso de la memoria Virtual y el % de CPU en los procesos

```{r}
X<-datosTOP$X.CPU 
Y<-datosTOP$VIRT/(1024)


plot(X, Y, type="l", xlab="CPU", ylab="Mem. Virtual",col="red")
title("Relación entre Memoria Virtual y % de CPU")
```