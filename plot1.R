file <- file("household_power_consumption.txt")
data <- read.table(file, header = TRUE, sep = ";", na.strings="?")
subset <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
subset2 <- transform(subset, DateTime = paste(Date,Time))
formattedDateTime <- strptime(subset2$DateTime,"%d/%m/%Y %H:%M:%S")
subset2 <- transform(subset2, DateTime = formattedDateTime)

# Plot 1
png(filename = "plot1.png")
hist(subset$Global_active_power, col="red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()