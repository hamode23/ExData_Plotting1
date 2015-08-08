## Getting full dataset
fdata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")
fdata$Date <- as.Date(fdata$Date, format = "%d/%m/%Y")

## Subsetting the data
dat2 <- subset(fdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fdata)

## Converet Dates
dateTimeTmp <- paste(as.Date(da2t$Date), data$Time)
dat2$dateTime <- as.POSIXct(dateTimeTmp)

## Plot data to PNG file
dev.cur()
png(filename = "plot2.png", width = 480, height = 480)
plot(dat$Global_active_power ~ dat2$dateTime, type = "l" , ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()