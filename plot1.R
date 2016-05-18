source(file="./utils/download_data.R")
source(file="./utils/clean_data.R")

download_data()
data <- clean_data()

# Creates the plot
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

# Saves the plot to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

# Show where the file was created
cat("Plot1.png has been created in", getwd())
