message("Please wait while data loading...")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
dataTemp <- read.table(file="household_power_consumption.txt" , header=TRUE, sep=";",na.strings="?" , colClasses=c('myDate','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
temp3 <- dataTemp[(dataTemp$Date == '2007-02-01' | dataTemp$Date == '2007-02-02'),]

#plot 2
temp4 <- temp3 # making a copy of the data for processing.

temp4$fqTime <- paste(  temp4[,'Date'],temp4[,'Time'])
temp4$fqTime <- strptime(temp4$fqTime, format="%Y-%m-%d %H:%M:%S")
wDays <-  strptime(temp4$fqTime, format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2), mar= c(4, 4, 0.5, 0.5))

#4.1
plot(wDays, temp4$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot 4.2
plot(wDays,temp4$Voltage,type="l", xlab="datetime",ylab="Voltage")

#4.3 
##Plot 3 
with(temp4,plot(wDays, temp4$Sub_metering_1, type="l", col="grey",xlab="", ylab="Energy sub metering"), legend = "Sub_metering_1",lty=1)
with(temp4,lines(wDays, temp4$Sub_metering_2, type="l", col="red",xlab="", ylab="Energy sub metering"), legend = "Sub_metering_2",lty=1)
with(temp4,lines(wDays, temp4$Sub_metering_3, type="l", col="blue",xlab="", ylab="Energy sub metering") , legend = "Sub_metering_3",lty=1)
legend("topright", border="",
       cex=0.7,
       bty="n",
       col = c("grey","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1))

# 4.4
plot(wDays, temp4$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

message("Exporting Image to file './figure/plot4.png' ")
dev.copy(png,file="plot4.png")
dev.off()
