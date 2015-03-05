# Read data, subset and format columns:
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
useData <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",] # subsets dates
useData$DateTime <- strptime(paste(useData$Date, useData$Time),
                             "%d/%m/%Y %H:%M:%S") # new variable for graphics
useData$Date <- as.Date(useData$Date, "%d/%m/%Y")

# Plot:
png("plot1.png", 480, 480, units = "px", bg = "transparent") # png file for plot
hist(useData$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off() # shuts down png device
