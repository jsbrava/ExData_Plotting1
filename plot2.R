# project 1- plot 2, exploratory data analysis

power <- read.table("data1/household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
p <- subset(power, power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"))
x_range <- range(p$Time)
y_range <- range(p$)
# Start PNG device driver to save output
png('plot2.png')
with(p, plot(Time, Global_active_power,
             type = 'l',
             ylab = "Global Active Power (kilowatts)",
             xlab = "",
             ))
dev.off()