#Read data and filter desired dates out
data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_select <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#select active power
Global_Active_Power <- as.numeric(data_select$Global_active_power)


#plot
png("plot1.png", width=480, height=480)
hist(Global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()