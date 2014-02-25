file <- file("household_power_consumption.txt")
data <- read.table(file, header = TRUE, sep = ";", na.strings="?")
subset <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
subset2 <- transform(subset, DateTime = paste(Date,Time))
formattedDateTime <- strptime(subset2$DateTime,"%d/%m/%Y %H:%M:%S")
subset2 <- transform(subset2, DateTime = formattedDateTime)

# Plot 3
png(filename = "plot3.png")
with(subset2, {plot(DateTime, Sub_metering_1, type = "l", xlab = "", 
                    ylab = "Energy sub metering") 
               points(DateTime, Sub_metering_2, type = "l", col = "red")
               points(DateTime, Sub_metering_3, type = "l", col = "blue")})
legend("topright",legend = names(subset2)[7:9], 
       col = c("black","red","blue"), lwd = 1)
dev.off()