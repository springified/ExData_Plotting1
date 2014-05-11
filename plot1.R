getwd();
message("Note: You need to run this script where the data set .txt file exist. Use setwd() to set the directory path of the dataset text file.")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
dataTemp <- read.table(file="household_power_consumption.txt" , header=TRUE, sep=";",na.strings="?" , colClasses=c('myDate','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
temp3 <- dataTemp[(dataTemp$Date == '2007-02-01' | dataTemp$Date == '2007-02-02'),]

#plot 1
#wDays <-  strptime(temp3$fqTime, format="%Y-%m-%d %H:%M:%S")
hist(temp3$Global_reactive_power*10,col='red' , xlab="Global Active Power (kilowatts) ", xlim=c(0,6),ylim=c(0,1200), main="Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()


