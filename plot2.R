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

#Generates second plot:
png(filename = 'plot2.png',width = 480, height = 480, units = 'px')
plot(Data$DateAndTime, Data$GlobalActivePower, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
