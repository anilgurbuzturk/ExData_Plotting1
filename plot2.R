## Peer-graded Assignment: Course Project 1
## Loading the data

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp <- tempfile()

download.file(fileURL, temp)

data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)

unlink(temp)


## Converting the Date and Time variables to Date/Time classes

DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

data <- cbind(data, DateTime)

data$Date <- as.Date(data$Date, "%d/%m/%Y")


## Subsetting data from the dates 2007-02-01 and 2007-02-02

sdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

str(sdata)


##Changing class of variables

sdata$Global_active_power <- as.numeric(sdata$Global_active_power)

sdata$Sub_metering_1 <- as.numeric(sdata$Sub_metering_1)

sdata$Sub_metering_2 <- as.numeric(sdata$Sub_metering_2)

sdata$Sub_metering_3 <- as.numeric(sdata$Sub_metering_3)

sdata$Voltage <- as.numeric(sdata$Voltage)

sdata$Global_reactive_power <- as.numeric(sdata$Global_reactive_power)


## Making Plots
## plot2.png
png("plot2.png", width = 480, height = 480)

with(sdata, plot(DateTime, Global_active_power, type = "l", xlab = "Day", 
                 ylab = "Global Active Power (kilowatts)"))

dev.off()

