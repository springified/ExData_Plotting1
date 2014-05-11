message("Please wait while data loading...")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
dataTemp <- read.table(file="household_power_consumption.txt" , header=TRUE, sep=";",na.strings="?" , colClasses=c('myDate','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
temp3 <- dataTemp[(dataTemp$Date == '2007-02-01' | dataTemp$Date == '2007-02-02'),]

#plot 2
temp4 <- temp3 # making a copy of the data for processing.


temp4$fqTime <- paste(  temp4[,'Date'],temp4[,'Time'])
#temp4$fqTime <- strptime(temp4$fqTime, format="%Y-%m-%d %H:%M:%S")

wDays <-  strptime(temp4$fqTime, format="%Y-%m-%d %H:%M:%S")
plot(wDays, temp4$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

message("Exporting Imange to file './plot2.png' ")

dev.copy(png,file="plot2.png")
dev.off()
