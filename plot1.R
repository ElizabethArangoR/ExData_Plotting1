# Reading data from a .txt file

HPC <- read.table("household_power_consumption.txt", header = T,
                  sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")

head(HPC) # Looking the headers of the dataset.

# Filtering on the 2 days of February.

datafeb <- subset(HPC, HPC$Date=="1/2/2007"|HPC$Date=="2/2/2007")

# Adding a new column called datetime including date and time.

datafeb$datetime  <- strptime(paste(datafeb$Date, datafeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Creating a function with the histogram.

plot1 <- function() {
  # Calling the basic plot functions
  hist(datafeb$Global_active_power,
       col="red",
       xlab="Global Active Power(kilowatts)",
       main="Global Active Power")
  # Creating PNG
  dev.copy(png, file="plot1.png", width=480, height=480)
  # Closing plot
  dev.off()
}

plot1()
