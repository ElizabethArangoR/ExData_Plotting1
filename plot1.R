## Course project 1

# Importing libraries

library(tidyverse)
library(lubridate)

HPC <- read.table("household_power_consumption.txt", header = T,
               sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
dim(HPC)
dataplot<- subset(HPC,HPC$Date=="1/2/2007"|HPC$Date=="2/2/2007")
datetime  <- strptime(paste(dataplot$Date, dataplot$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot1 <- function() {
  hist(dataplot$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",
       main="Global Active Power")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}

plot1()
