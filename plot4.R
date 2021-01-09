# Reading data from a .txt file

HPC <- read.table("household_power_consumption.txt", header = T,
                  sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")

head(HPC) # Looking the headers of the dataset.

# Filtering on the 2 days of February.

datafeb <- subset(HPC, HPC$Date=="1/2/2007"|HPC$Date=="2/2/2007")

# Adding a new column called datetime including date and time.

datafeb$datetime  <- strptime(paste(datafeb$Date, datafeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Creating a function with the plot.

par(mfrow=c(2,2))
plot4<-function(){
  # Calling the basic plot functions
  plot(datafeb$datetime, 
       dataplot$Global_active_power, 
       ylab="Global Active Power",
       xlab="",type="l")
  plot(datafeb$datetime, datafeb$Voltage,ylab="Voltage",type="l")
  plot(datafeb$datetime, datafeb$Sub_metering_1,type="n",xlab = "",ylab="Energy sub metering")
  lines(datafeb$datetime, datafeb$Sub_metering_1,col="black")
  lines(datafeb$datetime, datafeb$Sub_metering_2,col="red")
  lines(datafeb$datetime, datafeb$Sub_metering_3,col="blue")
  legend("topright",
         lty=c(1,1,1),
         col=c("black","red","blue"),
         legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"))
  plot(datafeb$datetime, 
       datafeb$Global_reactive_power,
       type="l",
       ylab="Global_reactive_power")
  dev.copy(png, file="plot4.png", width=480, height=480) # Creating PNG
  dev.off() # Closing plot
}
plot4()
