### Assignment 1
## Plot 1
setwd("./Documents/Coursera/Data_Science_Specialization/Exploratory Data Analysis")
data <-read.csv("./household_power_consumption.txt", header=T, sep=';',
                na.strings = "?", nrows=2075259, check.names=F, stringsAsFactors = F,
                comment.char = "")
februarydata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
februarydata$Date <- as.Date(februarydata$Date, format="%d/%m/%Y")
hist(februarydata$Global_active_power, main= "Global Active Power", 
xlab = "Global Active Power (kilowatts)", ylab= "Frequency", col="red")
dev.copy(png, "plot1.png")
dev.off()  