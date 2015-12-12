library(graphics)

# Start Load Data - Copied into each plot script
consumptionData <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = "?")
consumptionDataSubset <- subset(consumptionData, consumptionData$Date == '1/2/2007' | consumptionData$Date == '2/2/2007')
consumptionDataSubset$DateTime <-as.POSIXct(paste0(consumptionDataSubset$Date, " ", consumptionDataSubset$Time), format="%d/%m/%Y %H:%M:%S")
# End Load Data - Copied into each plot script

png("plot4.png")

par(mar = c(5, 4, 2, 2), mfrow=c(2, 2))
plot(Global_active_power ~ DateTime, consumptionDataSubset, type = "l", ylab = "Global Active Power")
plot(Voltage ~ DateTime, consumptionDataSubset, type = "l", xlab = "datetime", ylab = "Voltage")

plot(consumptionDataSubset$Sub_metering_1 ~ DateTime, consumptionDataSubset, type = 'l', ylab = "Energy sub metering", xlab="")
lines(consumptionDataSubset$DateTime, consumptionDataSubset$Sub_metering_2, col = "red")
lines(consumptionDataSubset$DateTime, consumptionDataSubset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

plot(Global_reactive_power ~ DateTime, consumptionDataSubset, type = "l", xlab = "datetime")

dev.off()
