### Assignment 1
## Plot 3
setwd("./Documents/Coursera/Data_Science_Specialization/Exploratory Data Analysis")
data <-read.csv("./household_power_consumption.txt", header=T, sep=';',
                na.strings = "?", nrows=2075259, check.names=F, stringsAsFactors = F,
                comment.char = "")
februarydata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
februarydata$Date <- as.Date(februarydata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(februarydata$Date), februarydata$Time)
februarydata$datetime <- as.POSIXct(datetime)

with(februarydata,{
  plot(datetime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(Sub_metering_2 ~ datetime, col="Red")
lines(Sub_metering_3 ~ datetime, col="Blue")
})
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()