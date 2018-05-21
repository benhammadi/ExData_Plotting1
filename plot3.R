
#Data File Path
dataFile <- "./data/household_power_consumption.txt"

#Read Data
dataInit <- read.table(dataFile, header= TRUE,stringsAsFactors = FALSE, sep =";" )

#Select only data from the dates 2007-02-01 and 2007-02-02
subdataInit <- subset(dataInit,dataInit$Date=="1/2/2007" | dataInit$Date =="2/2/2007")

datetime <- strptime(paste(subdataInit$Date, subdataInit$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert to numeric
sub_Metering1 <- as.numeric(subdataInit$Sub_metering_1)
sub_Metering2 <- as.numeric(subdataInit$Sub_metering_2)
sub_Metering3 <- as.numeric(subdataInit$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, sub_Metering2, type="l", col="red")

lines(datetime, sub_Metering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()