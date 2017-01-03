#Set working directory:
setwd('/RFiles')

#Gets Data:
source('DataPreparation.R')

#Generates first plot:
png(filename = 'plot1.png',width = 480, height = 480, units = 'px')
hist(Data$GlobalActivePower, col = "red", border = "black", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
