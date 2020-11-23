#Gonzalo Sanz
setwd("C:/Users/Gonzalo Sanz/Documents\ECO/Pr7 OPC")
m15<-read.csv("monitor15.csv", stringsAsFactors=FALSE, dec=",")
View(m15)
str(m15)
head(m15)
tail(m15)
numArrivals <- NROW(M15) - sum(is.na(M15$arrivals))
numDepartures<- NROW(m15) - sum(is.na(m15$departures))
numDepartures
errRelative <- function(arrivals, departures){
  return(abs(arrivals - departures) / departures)
}
errRelative(numArrivals, numDepartures)

tasaCalculator <- function(arrivals, time){
  return (arrivals/time)
}
#4
tasaLlegadas <- tasaCalculator(numArrivals, period)
productividad <- tasaCalculator(numDepartures, period)
#5
library(dplyr)

mutatedM15 <- mutate(M15, time = M15$departures - M15$arrivals)
filteredM15 <- filter(mutatedM15, time >= 0)
nrow(filteredM15)

#6
tMedioRespuesta <- mean(filteredM15$time)
tMedioRespuesta


#7
arrivals <- filteredM15$arrivals
departures <- filteredM15$departures
ocioso <- 0
for(i in (1:(length(arrivals)-1))){
  solapa <- arrivals[i+1] - departures[i]
  if(solapa>0){
    ocioso<-ocioso+solapa
  }
}
busy<- period - ocioso
ServiceTime <- busy / numDepartures
U <- busy  / period
ServiceTime
U

#Ejercicio 10
usuarios <- 25
z <- 6
data <- data.frame("X" = c(1,2),"Vi" = c(4,3), "Si" = c(0.5,0.75))
#a
di <- data$Vi* data$Si
db <- max(di)
db

#b
Rmin <- sum(di)
Rmin

Xmax <- 1/db
#c
tRespuesta <- max(di, usuarios*db-z)
tRespuesta

Productividad <- min(usuarios/di+z, 1/db)
Productividad

#d
Teorico <- (Rmin + z )/ db
Teorico

#e
R <- usuarios * db - z
R