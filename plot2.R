### Assignment 1
## Plot 2
setwd("./Documents/Coursera/Data_Science_Specialization/Exploratory Data Analysis")
data <-read.csv("./household_power_consumption.txt", header=T, sep=';',
                na.strings = "?", nrows=2075259, check.names=F, stringsAsFactors = F,
                comment.char = "")
februarydata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
februarydata$Date <- as.Date(februarydata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(februarydata$Date), februarydata$Time)
februarydata$datetime <- as.POSIXct(datetime)

with(februarydata, plot(Global_active_power~datetime, type="l",
                        ylab = "Global Active Power (kilowatts)", xlab=""))
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()