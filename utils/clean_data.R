clean_data <- function() {
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
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

  return(data)
}
