file <- file("household_power_consumption.txt")
data <- read.table(file, header = TRUE, sep = ";", na.strings="?")
subset <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
subset2 <- transform(subset, DateTime = paste(Date,Time))
formattedDateTime <- strptime(subset2$DateTime,"%d/%m/%Y %H:%M:%S")
subset2 <- transform(subset2, DateTime = formattedDateTime)

# Plot 4
png(filename = "plot4.png")
par(mfrow = c(2,2))          # set a 2-by-2 grid for plotting

# Upper Left Plot
with(subset2, plot(DateTime, Global_active_power, 
                   type = "l", xlab = "", 
                   ylab = "Global Active Power"))

# Upper Right Plot
with(subset2, plot(DateTime, Voltage, 
                   type = "l", xlab = "datetime", 
                   ylab = "Voltage"))

# Lower Left Plot
with(subset2, {plot(DateTime, Sub_metering_1, type = "l", xlab = "", 
                    ylab = "Energy sub metering") 
               points(DateTime, Sub_metering_2, type = "l", col = "red")
               points(DateTime, Sub_metering_3, type = "l", col = "blue")})
legend("topright",legend = names(subset2)[7:9], cex = 1,
       col = c("black","red","blue"), lwd = 1, bty = "n")

# Lower Right Plot
with(subset2, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()