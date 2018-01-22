# in order to have date labels in english
Sys.setlocale(category = "LC_ALL", locale = "english")

# Read the data
elecdata <- read.table("household_power_consumption.txt",header=T, sep=";", stringsAsFactors = F,na.strings = "?")

# Transform Dates and Times into Date and TIme format and take only the measurement from Feb 1st and 2nd, 2007
elecdata$Date <- as.Date(elecdata$Date,format="%d/%m/%Y")
elecdata <- subset(elecdata,Date=="2007-02-01"|Date=="2007-02-02")
DateTime <- with(elecdata,paste(Date,Time,sep="-"))
elecdata$DateTime <- strptime(DateTime, format="%Y-%m-%d-%H:%M:%S")

#start the png graphic device and set the size of the graph
png(filename = "plot2.png",width = 480, height = 480)

#plot the data
with(elecdata, plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#stop the graphics device
dev.off()