## Setting working directory 
setwd("D:\\Applcation-Docs-Src\\SelfStudy\\Coursera\\RProgramming\\ExploratoryAnalysis")

## Reading data 
file <- ".\\data\\household_power_consumption.txt"
data <- read.table(file,header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

## Updating date format for date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting data & remove full dataset
attach(data)
data_reqd <- data[which(Date >= "2007-02-01" & Date <= "2007-02-02"), ]
rm(data)

## Converting datetime
data_reqd$datetime <- as.POSIXct(paste(as.Date(data_reqd$Date), data_reqd$Time))

# plot3
plot(data_reqd$Sub_metering_1~data_reqd$datetime, xlab="", ylab="Energy sub metering", type="l")
points(data_reqd$Sub_metering_2~data_reqd$datetime, col="Red", type="l")
points(data_reqd$Sub_metering_3~data_reqd$datetime, col="Blue", type="l")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Saving to file
dev.current()
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
