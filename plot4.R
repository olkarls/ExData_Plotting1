source(file="./utils/download_data.R")
source(file="./utils/clean_data.R")
source(file="./plot2.R")

download_data()
data <- clean_data()

par(mar = c(4,4,1,1))

par(mfrow = c(2,2))

plot2()
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1, lwd = 0.5, col = c("black", "red", "blue"), cex = 0.5)
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

# Show where the file was created
cat("Plot4.png has been created in", getwd())
