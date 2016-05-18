# Include library httr
library(httr)

download_data <- function() {
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
}
