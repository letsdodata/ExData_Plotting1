#Read data and filter desired dates out
data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_select <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#get time and active power
datetime <- strptime(paste(data_select$Date, data_select$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(data_select$Global_active_power)


#plot
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()