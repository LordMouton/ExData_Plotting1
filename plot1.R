# Read the data
elecdata <- read.table("household_power_consumption.txt",header=T, sep=";", stringsAsFactors = F,na.strings = "?")
elecdata$Date <- as.Date(elecdata$Date, format="%d/%m/%Y")

# Take only the measurement from Feb 1st and 2nd, 2007
elecdata_sub <- subset(elecdata,Date=="2007-02-01"|Date=="2007-02-02")

#start the png graphic device and set the size of the graph
png(filename = "plot1.png",width = 480, height = 480)

#make the histogram plot of Global Active Power
hist(elecdata_sub$Global_active_power, breaks=24, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

#stop the graphic device
dev.off()
