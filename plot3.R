#Read data and filter desired dates out
data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_select <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#get submetering
datetime <- strptime(paste(data_select$Date, data_select$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(data_select$Sub_metering_1)
Sub_metering_2 <- as.numeric(data_select$Sub_metering_2)
Sub_metering_3 <- as.numeric(data_select$Sub_metering_3)



#plot
png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy Submetering")
lines(datetime, Sub_metering_2, type="l", col = "red")
lines(datetime, Sub_metering_3, type="l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5))
dev.off()