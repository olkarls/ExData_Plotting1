source(file="./utils/download_data.R")
source(file="./utils/clean_data.R")

download_data()
data <- clean_data()

plot2 <- function() {
  plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
}

plot2()

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

# Show where the file was created
cat("Plot2.png has been created in", getwd())
