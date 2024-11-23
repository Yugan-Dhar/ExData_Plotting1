# Load necessary data
data <- read.table("C:\Users\\ydhar\\Downloads\\exdata_data_household_power_consumption (1)", sep=";", header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
filtered_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot 1: Histogram of Global Active Power
png("plot1.png", width=480, height=480)
hist(filtered_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

# Plot 2: Global Active Power Time Series
png("plot2.png", width=480, height=480)
plot(filtered_data$DateTime, filtered_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# Plot 3: Energy Sub Metering
png("plot3.png", width=480, height=480)
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()

# Plot 4: Multiple Base Plots
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

# Top-left: Global Active Power
plot(filtered_data$DateTime, filtered_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Top-right: Voltage
plot(filtered_data$DateTime, filtered_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Bottom-left: Energy Sub Metering
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# Bottom-right: Global Reactive Power
plot(filtered_data$DateTime, filtered_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
