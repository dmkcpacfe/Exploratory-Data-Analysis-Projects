## Read Electric Power Consumption Dataset into R

data <- "household_power_consumption.txt"
hhpower <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset the dataset into the date range used for the analysis

hhpower_sub <- hhpower[hhpower$Date %in% c("1/2/2007","2/2/2007") ,]

## Strip out date and time  
datetime <- strptime(paste(hhpower_sub$Date, hhpower_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Convert variable Global_active_power from character to numeric
globalactivepower <- as.numeric(hhpower_sub$Global_active_power)

## Create and save histogram to PNG file
png("plot2.png", width=480, height=480)

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 
