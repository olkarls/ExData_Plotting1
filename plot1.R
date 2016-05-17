# Include library httr
library(httr)

# Check if file is already downloaded
if (!file.exists('./household_power_consumption.txt')) {
  print("Downloading dataset, please be patient it's a large file...")

  # Download the dataset and write it to disk
  file <- GET("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
               write_disk('./dataset.zip'))

  # unzip the downloaded file
  unzip('./dataset.zip')
  print("Unzipping dataset...")

  # remove the downloaded file
  unlink('./dataset.zip')
}

data <- read.table(
          './household_power_consumption.txt',
          header = TRUE,
          sep = ';')

# Converts Date column to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Select only data where date is equal to "2007-02-01" or "2007-02-02"
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Creates a column named DateTime with full timestamp
data <- transform(data, DateTime = as.POSIXct(paste(Date, Time)))

# Converts coloumn Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Creates the plot
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

# Saves the plot to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

# Show where the file was created
cat("Plot1.png has been created in", getwd())
