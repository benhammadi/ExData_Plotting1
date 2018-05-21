
#Data File Path
dataFile <- "./data/household_power_consumption.txt"

#Read Data
dataInit <- read.table(dataFile, header= TRUE,stringsAsFactors = FALSE, sep =";" )

#Select only data from the dates 2007-02-01 and 2007-02-02
subdataInit <- subset(dataInit,dataInit$Date=="1/2/2007" | dataInit$Date =="2/2/2007")

#Convert Global_active_power column data to numeric
globalActivePower <- as.numeric(subdataInit$Global_active_power)

datetime <- strptime(paste(subdataInit$Date, subdataInit$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()