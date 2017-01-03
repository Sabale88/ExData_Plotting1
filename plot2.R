#Set working directory:
setwd('/RFiles')

#Gets Data:
source('DataPreparation.R')

#Generates second plot:
png(filename = 'plot2.png',width = 480, height = 480, units = 'px')
plot(Data$DateAndTime, Data$GlobalActivePower, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
