# Read the data
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";",na.strings = "?")
colnames(data) <- c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")

# Convert the Date and Time Variables in a new column
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot4
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12)
par(mfrow=c(2,2))

plot(data$DateTime, data$GlobalActivePower, type = "l", xlab = "", ylab = "Global ActivePower", col = "black")

plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")

plot(data$DateTime, data$SubMetering1, type = "l", xlab = "",ylab = "Energy sub metering", col = "black")
lines(data$DateTime, data$SubMetering2, col = "red")
lines(data$DateTime, data$SubMetering3, col = "blue")
legend('topright',legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"), lty = 'solid')

plot(data$DateTime, data$GlobalReactivePower, type = "l", xlab = "datetime",ylab = "Global_reactive_power", col = "black")

dev.off()
