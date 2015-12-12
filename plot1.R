library(graphics)

# Start Load Data - Copied into each plot script
consumptionData <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = "?")
consumptionDataSubset <- subset(consumptionData, consumptionData$Date == '1/2/2007' | consumptionData$Date == '2/2/2007')
consumptionDataSubset$DateTime <-as.POSIXct(paste0(consumptionDataSubset$Date, " ", consumptionDataSubset$Time), format="%d/%m/%Y %H:%M:%S")
# End Load Data - Copied into each plot script

png("plot1.png")
hist(consumptionDataSubset$Global_active_power, 
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

