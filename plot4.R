### Assignment 1
## Plot 4
setwd("./Documents/Coursera/Data_Science_Specialization/Exploratory Data Analysis")
data <-read.csv("./household_power_consumption.txt", header=T, sep=';',
                na.strings = "?", nrows=2075259, check.names=F, stringsAsFactors = F,
                comment.char = "")
februarydata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
februarydata$Date <- as.Date(februarydata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(februarydata$Date), februarydata$Time)
februarydata$datetime <- as.POSIXct(datetime)

par(mfrow= c(2,2), mar= c(4,4,2,1), oma = c(0,0,2,0))
# Graph 1
with(februarydata, plot(Global_active_power~datetime, type="l",
                        ylab = "Global Active Power", xlab=""))
# Graph 2
with(februarydata, plot(Voltage~datetime, type="l",
                        ylab = "Voltage", xlab="datetime"))
# Graph 3
with(februarydata,{
  plot(datetime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ datetime, col="Red")
  lines(Sub_metering_3 ~ datetime, col="Blue")
})
legend("top", col = c("black", "red", "blue"), lty=1, lwd=2, bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Graph 4
with(februarydata, plot(Global_reactive_power~datetime, type="l"))

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()