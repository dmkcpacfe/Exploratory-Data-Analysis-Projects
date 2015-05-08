## Read Electric Power Consumption Dataset into R
data <- "household_power_consumption.txt"
hhpower <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset the dataset into the date range used for the analysis
hhpower_sub <- hhpower[hhpower$Date %in% c("1/2/2007","2/2/2007") ,]

##Review classification of variables
str(hhpower_sub)

## Strip out date and time 
datetime <- strptime(paste(hhpower_sub$Date, hhpower_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Convert variables from character to numeric

globalactivepower <- as.numeric(hhpower_sub$Global_active_power)
globalreactivepower <- as.numeric(hhpower_sub$Global_reactive_power)
voltage <- as.numeric(hhpower_sub$Voltage)

submetering1 <- as.numeric(hhpower_sub$Sub_metering_1)
submetering2 <- as.numeric(hhpower_sub$Sub_metering_2)
submetering3 <- as.numeric(hhpower_sub$Sub_metering_3)

##Create & plot 4 separate graphs & save to PNG file

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"))

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
