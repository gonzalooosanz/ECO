#Nombre: Gonzalo Sanz Rodriguez 
#1. OBSERVA EL C�DIGO ABAJO. INCLUYE COMENTARIOS DICIENDO PARA QU� SIRVEN 
# LAS TRES FUNCIONES. COMENTA TAMBI�N LAS L�NEAS DE CODIGO RESTANTES
#---------------------------------
#Esta funcion sirve para obtener la media aritmetrica y posteriormente devolverla
mean1<-function(datos)
{return(sum(datos)/length(datos))}
#---------------------------------
#Obtiene la media armonica y devolverla
mean2<-function(datos)
{cuenta<-sum(datos^-1)
return(length(datos)/cuenta)
}
#---------------------------------
##Obtiene la media geometrica y la devuelve
mean3<-function(datos)
{cuenta<-prod(datos)
return(cuenta^(1/length(datos)))
}
#---------------------------------
datos<-c(1,2,3,4,5,6)# Creamos un vector
#Almacenamos en m1...m3 los valores de las medias
m1<-mean1(datos)
m2<-mean2(datos)
m3<-mean3(datos)
m1
m2
m3
# OBSERVA TU WORKSPACE Y COMPRUEBA LA COHERENCIA DE LOS RESULTADOS
#---------------------------------

#2. Generaliza una de las funciones anteriores a�adiendo un par�metro adicional
# como se indica en la cabecera de la funci�n a continuaci�n.
# Implementa una funci�n que sirva para resolver la primera parte del ejercicio 4
# del bloque ANALISIS COMPARATIVO. Los datos se proporcionan:
datos<-c(1,10,100)
pesos<-c(0.3,0.2,0.5)
# ten en cuenta que las operaciones entre vectores con el mismo n�mero de elementos
# se realizan elemento a elemento, haz alguna prueba para comprobar el resultado
mean4<-function(datos,pesos)
{ratios<-pesos/datos
  cuenta<-sum(ratios)
    return(1/cuenta)
}

sol<- mean4(datos, pesos)
# Comprueba la soluci�n obtenida con la soluci�n de clase.
# La solucion obtenida es correcta el resultado es: 1/(0.3/1 + 0.2/10 +0.5/100)=3.076
sol