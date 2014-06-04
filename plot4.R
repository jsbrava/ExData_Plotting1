# project 1- plot 4, exploratory data analysis

power <- read.table("data1/household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
p <- subset(power, power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"))
x_range <- range(p$Time)
y_range <- range(p$)
# Start PNG device driver to save output
png('plot4.png')
par(mfrow=c(2,2))

# upper left plot, Global active power
with(p, plot(Time, Global_active_power,
             type = 'l',
             ylab = "Global Active Power (kilowatts)",
             xlab = "",
))

# upper right plot, Voltage
with(p, plot(Time, Voltage,
             type = 'l',
             ylab = "Voltage",
             xlab = "datetime",
))

# lower left plot, sub metering
with(p, plot(Time, Sub_metering_1,
             type = 'l',
             ylab = "Energy sub metering",
             xlab = "",
))
with(p, lines(Time, Sub_metering_2,
              type = "l",
              col = "red"))
with(p, lines(Time, Sub_metering_3,
              type = "l",
              col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","blue","red"), pt.cex=1, cex = 0.5, lty=c(1,1,1))

# lower right plot, Global reactive power
with(p, plot(Time, Global_reactive_power,
             type = 'l',
             ylab = "Global_reactive_power",
             xlab = "datetime",
))

dev.off()