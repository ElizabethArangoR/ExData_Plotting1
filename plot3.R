HPC <- read.table("household_power_consumption.txt", header = T,
                  sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
dim(HPC)
dataplot<- subset(HPC,HPC$Date=="1/2/2007"|HPC$Date=="2/2/2007")
datetime  <- strptime(paste(dataplot$Date, dataplot$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot3 <- function() {
  plot(datetime,dataplot$Sub_metering_1,type="n",xlab = "",ylab="Energy sub metering")
  lines(datetime,dataplot$Sub_metering_1,col="black")
  lines(datetime,dataplot$Sub_metering_2,col="red")
  lines(datetime,dataplot$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1,1),
         col=c("black","red","blue"),
         legend=c("Sub_meeting_1",
                  "Sub_meeting_2",
                  "Sub_meeting_3"))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
}

plot3()