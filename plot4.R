#Memory check - nRows * nCols * 8 / 2^20:
nRows <- 2075259
nCols <- 9
MemoryMegaBytes <- nRows * nCols * 8  / 2^20
if (MemoryMegaBytes > 10000) {stop("Not enough memory - data is bigger than 10 GB")}

#Reads data and filters out the unrelevant dates and NA's:
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep('character',2),rep('numeric',7)), quote = "", blank.lines.skip = TRUE)
Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
Data <- Data[complete.cases(Data),]

#Fix names:
ColNames <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage', 'GlobalIntensity', 'Kitchen', 'Laundry', 'Water&AirCondition')
colnames(Data) <- ColNames

#Makes a new variable that contains the date and the time together:
library(lubridate)
Data$DateAndTime <- dmy(Data$Date) + hms(Data$Time)
Data <- Data[,c(10,3:9)]
#Generates fourth plot:
png(filename = 'plot4.png',width = 480, height = 480, units = 'px')
par(mfrow = c(2,2))
plot(Data$DateAndTime, Data$GlobalActivePower, xlab = "", ylab = "Global Active Power", type = "l")
plot(Data$DateAndTime, Data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(Data$DateAndTime, Data$Kitchen, col = 'black', type = 'l', xlab = "", ylab = "Energy sub metering")
lines(Data$DateAndTime, Data$Laundry, col = 'red')
lines(Data$DateAndTime, Data$`Water&AirCondition`, col = 'blue')
legend('topright', legend = c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'), col = c('black', 'red', 'blue'), lty = 'solid')
plot(Data$DateAndTime, Data$GlobalReactivePower, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()
