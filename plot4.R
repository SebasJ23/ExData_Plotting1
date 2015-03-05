# Read data, subset and format columns:
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
useData <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",] # subsets dates
useData$DateTime <- strptime(paste(useData$Date, useData$Time),
                             "%d/%m/%Y %H:%M:%S") # new variable for graphics
useData$Date <- as.Date(useData$Date, "%d/%m/%Y")

# Plot:
png("plot4.png", 480, 480, units = "px", bg = "transparent") # png file for plot
par(mfcol = c(2,2)) # sets 2 columns and 2 rows for graphics in one page
plot(useData$DateTime, useData$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "") # topleft plot
plot(useData$DateTime, useData$Sub_metering_1, type = "l", col = "black",
     ylab = "Energy sub metering", xlab = "") # bottomleft plot
points(useData$DateTime, useData$Sub_metering_2, type = "l", col = "red")
points(useData$DateTime, useData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
plot(useData$DateTime, useData$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage") # topright plot
plot(useData$DateTime, useData$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power") # bottomright plot
dev.off() # shuts down png device