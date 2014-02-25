file <- file("household_power_consumption.txt")
data <- read.table(file, header = TRUE, sep = ";", na.strings="?")
subset <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
subset2 <- transform(subset, DateTime = paste(Date,Time))
formattedDateTime <- strptime(subset2$DateTime,"%d/%m/%Y %H:%M:%S")
subset2 <- transform(subset2, DateTime = formattedDateTime)

# Plot 2
png(filename = "plot2.png")
with(subset2, plot(DateTime, Global_active_power, 
                   type = "l", xlab = "", 
                   ylab = "Global Active Power (kilowatts)"))
dev.off()