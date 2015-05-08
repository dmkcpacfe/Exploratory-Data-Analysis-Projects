library(datasets)


## Read Electric Power Consumption Dataset into R
hhpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset the hhpower dataset into the date range used for the analysis
hhpower_sub <- hhpower[hhpower$Date %in% c("1/2/2007", "2/2/2007"),]

##Find the class of the Global_active_power variable
class(hhpower_sub$Global_active_power)

##Convert Global_active_power variable from character to numeric
globalactivepower <- as.numeric(hhpower_sub$Global_active_power)

##Construct plot1 and save to a PNG file with width of 480 pixels and height of 480 pixels
png("plot1.png", width=480, height=480)

hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()





