## Getting full dataset
fdata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")
fdata$Date <- as.Date(fdata$Date, format = "%d/%m/%Y")

## Subsetting the data
dat3 <- subset(fdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fdata)


## Converet Dates
dateTimeTmp <- paste(as.Date(dat3$Date), data$Time)
dat3$dateTime <- as.POSIXct(dateTimeTmp)


## Plot data to PNG file
dev.cur()
png(filename = "plot3.png", width = 480, height = 480)

with(dat3, {
    plot(Sub_metering_1 ~ dateTime, type = "l", 
    ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ dateTime, col = 'Red')
    lines(Sub_metering_3 ~ dateTime, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       
dev.off()


