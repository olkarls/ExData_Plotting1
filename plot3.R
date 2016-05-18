source(file="./utils/download_data.R")
source(file="./utils/clean_data.R")

download_data()
data <- clean_data()

par("mar" = c(1, 1, 1, 1))

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend(
  "topright",
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = c(1,1),
  lwd = c(1,1),
  y.intersp = .5,
  xjust = .5,
  yjust = .5,
  cex = .8)

  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()

  # Show where the file was created
  cat("Plot3.png has been created in", getwd())
