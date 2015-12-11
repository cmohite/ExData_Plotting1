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

## Plot1
hist(data_reqd$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving to file
dev.current()
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
