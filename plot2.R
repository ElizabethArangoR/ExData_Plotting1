HPC <- read.table("household_power_consumption.txt", header = T,
                  sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
dim(HPC)
dataplot<- subset(HPC,HPC$Date=="1/2/2007"|HPC$Date=="2/2/2007")
datetime  <- strptime(paste(dataplot$Date, dataplot$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot2 <- function() {
  plot(datetime,dataplot$Global_active_power,ylab="Global Active Power(kilowatts)",
       xlab="",type="l")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}

plot2()