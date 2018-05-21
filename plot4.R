
#Data File Path
dataFile <- "./data/household_power_consumption.txt"

#Read Data
dataInit <- read.table(dataFile, header= TRUE,stringsAsFactors = FALSE, sep =";" )

#Select only data from the dates 2007-02-01 and 2007-02-02
subdataInit <- subset(dataInit,dataInit$Date=="1/2/2007" | dataInit$Date =="2/2/2007")

datetime <- strptime(paste(subdataInit$Date, subdataInit$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert to numeric
global_Active_Power <- as.numeric(subdataInit$Global_active_power)
global_Reactive_Power <- as.numeric(subdataInit$Global_reactive_power)
voltage <- as.numeric(subdataInit$Voltage)

#Convert to numeric
sub_Metering1 <- as.numeric(subdataInit$Sub_metering_1)
sub_Metering2 <- as.numeric(subdataInit$Sub_metering_2)
sub_Metering3 <- as.numeric(subdataInit$Sub_metering_3)

#plot Data
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Metering2, type="l", col="red")
lines(datetime, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()