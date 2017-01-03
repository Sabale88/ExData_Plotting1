#Set working directory:
setwd('/RFiles')

#Gets Data:
source('DataPreparation.R')

#Generates third plot:
png(filename = 'plot3.png',width = 480, height = 480, units = 'px')
plot(Data$DateAndTime, Data$Kitchen, col = 'black', type = 'l', xlab = "", ylab = "Energy sub metering")
lines(Data$DateAndTime, Data$Laundry, col = 'red')
lines(Data$DateAndTime, Data$`Water&AirCondition`, col = 'blue')
legend('topright', legend = c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'), col = c('black', 'red', 'blue'), lty = 'solid')
dev.off()
