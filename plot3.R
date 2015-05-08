## Read Electric Power Consumption Dataset into R

data <- "household_power_consumption.txt"
hhpower <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset the dataset into the date range used for the analysis
hhpower_sub <- hhpower[hhpower$Date %in% c("1/2/2007","2/2/2007") ,]

## Strip out date and time 
datetime <- strptime(paste(hhpower_sub$Date, hhpower_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Convert variable Global_active_power from character to numeric
globalactivepower <- as.numeric(hhpower_sub$Global_active_power)

class(hhpower_sub$Sub_metering_1)
class(hhpower_sub$Sub_metering_2)
class(hhpower_sub$Sub_metering_3)

##Convert submetering variables from character to numeric
submetering1 <- as.numeric(hhpower_sub$Sub_metering_1)
submetering2 <- as.numeric(hhpower_sub$Sub_metering_2)
submetering3 <- as.numeric(hhpower_sub$Sub_metering_3)

##Create & Save graph to PNG file
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"))
dev.off()
