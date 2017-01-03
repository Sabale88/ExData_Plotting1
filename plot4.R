#Set working directory:
setwd('/RFiles')

#Gets Data:
source('DataPreparation.R')

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
