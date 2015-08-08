## Getting full dataset
fdata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")
fdata$Date <- as.Date(fdata$Date, format = "%d/%m/%Y")

## Subsetting the data
dat1 <- subset(fdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fdata)

## Plot data to PNG file
dev.cur()
png(filename = "plot1.png", width = 480, height = 480)
hist( dat1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)" , ylab="Frequency",col="red")
dev.off()