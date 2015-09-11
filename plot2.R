# Read the data
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";",na.strings = "?")
colnames(data) <- c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")

# Convert the Date and Time Variables in a new column
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot2
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
plot(data$DateTime, data$GlobalActivePower, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
