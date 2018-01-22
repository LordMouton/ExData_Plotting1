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
png(filename = "plot4.png",width = 480, height = 480)

#set the plotting window, 2x2 plots
par(mfrow=c(2,2))

#plot the data
#topleft plot
with(elecdata, plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#topright plot
with(elecdata, plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

#bottomleft plot
with(elecdata, plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
with(elecdata, lines(DateTime,Sub_metering_2,type="l",col="red"))
with(elecdata, lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1))

#bottomright plot
with(elecdata, plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))

#stop the graphics device
dev.off()